#!/bin/bash

TASKS_FILE="/tmp/waybar_calendar_tasks"
[ ! -f "$TASKS_FILE" ] && touch "$TASKS_FILE"

CURRENT_DATE=$(date +"%d.%m.%Y")
CURRENT_DAY=$(date +"%-d")
CURRENT_MONTH=$(date +"%-m")
CURRENT_YEAR=$(date +"%Y")

get_month_name() {
    case "$1" in
        1) echo "Январь" ;; 2) echo "Февраль" ;; 3) echo "Март" ;;
        4) echo "Апрель" ;; 5) echo "Май" ;; 6) echo "Июнь" ;;
        7) echo "Июль" ;; 8) echo "Август" ;; 9) echo "Сентябрь" ;;
        10) echo "Октябрь" ;; 11) echo "Ноябрь" ;; 12) echo "Декабрь" ;;
    esac
}

get_day_name() {
    case "$(date -d "$2-$1-$3" +%u 2>/dev/null || echo 0)" in
        1) echo "Пн" ;; 2) echo "Вт" ;; 3) echo "Ср" ;;
        4) echo "Чт" ;; 5) echo "Пт" ;; 6) echo "Сб" ;; 7) echo "Вс" ;;
    esac
}

show_calendar() {
    local month=$1 year=$2
    local month_name=$(get_month_name $month)
    local days_in_month=$(cal $month $year | awk 'NF {days=$NF} END {print days}')
    local first_day=$(date -d "$year-$month-1" +%u 2>/dev/null || echo 1)
    first_day=$(( (first_day + 6) % 7 ))

    printf "%s %d\n" "$month_name" "$year"
    printf "Пн Вт Ср Чт Пт Сб Вс\n"

    local day=1
    for ((i=0; i<first_day; i++)); do
        printf "   "
    done
    for ((i=first_day; i<7; i++)); do
        printf "%2d " "$day"
        ((day++))
    done
    printf "\n"
    while ((day <= days_in_month)); do
        for ((i=0; i<7 && day<=days_in_month; i++)); do
            printf "%2d " "$day"
            ((day++))
        done
        printf "\n"
    done
}

get_tasks_for_date() {
    local target=$1
    grep "^${target}|" "$TASKS_FILE" 2>/dev/null | cut -d'|' -f2-
}

add_task_full() {
    local default_date=$1
    date_input=$(echo -e "Сегодня (${default_date})\nЗавтра\nВыбрать дату..." | wofi -d -p "Когда?" -W 450 -H 250)
    [ -z "$date_input" ] && return

    case "$date_input" in
        *Сегодня*) task_date="$default_date" ;;
        *Завтра*) task_date=$(date -d "+1 day" +"%d.%m.%Y") ;;
        *Выбрать*)
            task_date=$(wofi -d -p "Дата (ДД.ММ.ГГГГ)" -W 450 -H 100)
            [ -z "$task_date" ] && return
            ;;
    esac

    task_text=$(wofi -d -p "Задача" -W 450 -H 100)
    [ -z "$task_text" ] && return
    echo "${task_date}|${task_text}" >> "$TASKS_FILE"
}

view_tasks_for_date() {
    local target=$1
    local tasks=$(get_tasks_for_date "$target")
    local display_date=$(echo "$target" | awk -F. '{print $1"."$2}')
    if [ -z "$tasks" ]; then
        wofi -d -p "Нет задач на $display_date" -W 450 -H 100
        return
    fi
    selected=$(echo "$tasks" | wofi -d -p "Задачи на $display_date" -W 500 -H 400)
    if [ -n "$selected" ]; then
        local confirm=$(echo -e "  Назад\n  Удалить эту задачу" | wofi -d -p "Действие" -W 350 -H 150)
        if echo "$confirm" | grep -q "Удалить"; then
            local full_line=$(grep "^${target}|${selected}$" "$TASKS_FILE")
            [ -n "$full_line" ] && grep -v -F "$full_line" "$TASKS_FILE" > "${TASKS_FILE}.tmp" && mv "${TASKS_FILE}.tmp" "$TASKS_FILE"
        fi
    fi
}

main_menu() {
    local month=$CURRENT_MONTH year=$CURRENT_YEAR

    while true; do
        local month_name=$(get_month_name $month)
        local tasks_count=$(wc -l < "$TASKS_FILE" 2>/dev/null || echo 0)
        local today_tasks=$(get_tasks_for_date "$CURRENT_DATE" | wc -l)

        menu="📅  ${month_name} ${year}\n"
        menu+="📋  Задач всего: ${tasks_count}  |  На сегодня: ${today_tasks}\n"
        menu+="\n"
        menu+="  📆  Смотреть календарь\n"
        menu+="  📝  Задачи на сегодня\n"
        menu+="  ➕  Добавить задачу\n"
        menu+="  📋  Все задачи\n"
        menu+="  ◀  Пред. месяц\n"
        menu+="  ▶  След. месяц\n"
        menu+="  ❌  Очистить завершённые"

        choice=$(echo -e "$menu" | wofi -d -p "Planner" -W 480 -H 420)

        case "$choice" in
            *Смотреть*)
                local cal_text=$(cal -m $month $year)
                echo "$cal_text" | wofi -d -p "Календарь" -W 480 -H 400
                ;;
            *на\ сегодня|Задачи\ на\ сегодня*)
                view_tasks_for_date "$CURRENT_DATE"
                ;;
            *Добавить*)
                add_task_full "$CURRENT_DATE"
                ;;
            *Все\ задачи*)
                if [ ! -s "$TASKS_FILE" ]; then
                    wofi -d -p "Нет задач" -W 450 -H 100
                else
                    local all_tasks=$(cat "$TASKS_FILE" | while IFS='|' read -r d t; do
                        disp=$(echo "$d" | awk -F. '{print $1"."$2}')
                        echo "  $disp → $t"
                    done)
                    local picked=$(echo -e "$all_tasks" | wofi -d -p "Все задачи" -W 550 -H 450)
                    if [ -n "$picked" ]; then
                        local task_name=$(echo "$picked" | sed 's/^  [0-9.]\+ → //')
                        local task_date=$(echo "$picked" | sed 's/^  \([0-9.]\+\) →.*/\1/')
                        [ -n "$task_date" ] && [ -n "$task_name" ] && view_tasks_for_date "$task_date"
                    fi
                fi
                ;;
            *Пред*)
                ((month--))
                [ "$month" -lt 1 ] && month=12 && ((year--))
                ;;
            *След*)
                ((month++))
                [ "$month" -gt 12 ] && month=1 && ((year++))
                ;;
            "" | *Очистить*)
                break
                ;;
        esac
    done
}

main_menu
