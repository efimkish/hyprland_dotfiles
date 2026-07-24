# Мгновенная загрузка Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Путь к Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Тема и Плагины
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Запуск Oh My Zsh
source $ZSH/oh-my-zsh.sh

# --- АЛИАСЫ (Твои быстрые команды) ---

# Обновление системы одной командой (Fedora style)
alias update='sudo dnf upgrade --refresh -y'

# Навигация и красота
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'

# Быстрый доступ к конфигам
alias zshconfig="nano ~/.zshrc"
alias reload="source ~/.zshrc"
alias mp3test="ffprobe -v error -select_streams a:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1:nokey=1"
alias settags='find . -type f -name "*.flac" -exec metaflac --remove-tag="ALBUMARTIST" --remove-tag="ALBUM ARTIST" --set-tag="ALBUMARTIST=${PWD##*/}" --set-tag="ALBUM ARTIST=${PWD##*/}" {} +'
# Исправление опечаток (если стоит пакет 'thefuck')
# eval $(thefuck --alias)

# Подгрузка настроек темы
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# opencode
export PATH=/home/septumman/.opencode/bin:$PATH
