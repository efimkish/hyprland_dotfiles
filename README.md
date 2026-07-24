<img src="wallpapers/синий.jpg" width="100%"/>

---

<p align="center">
  <img src="https://img.shields.io/badge/WM-Hyprland-1e1e2e?style=for-the-badge&logo=hyprland&logoColor=cba6f7"/>
  <img src="https://img.shields.io/badge/OS-Fedora-1e1e2e?style=for-the-badge&logo=fedora&logoColor=89b4fa"/>
  <img src="https://img.shields.io/badge/Shell-ZSH-1e1e2e?style=for-the-badge&logo=gnu-bash&logoColor=a6e3a1"/>
  <img src="https://img.shields.io/badge/Terminal-Kitty-1e1e2e?style=for-the-badge&logo=kitty&logoColor=f5c2e7"/>
  <img src="https://img.shields.io/badge/Bar-Waybar-1e1e2e?style=for-the-badge&logo=wayland&logoColor=fab387"/>
</p>

<p align="center">
  <code>catppuccin-mocha-mauve</code> × <code>JetBrainsMono Nerd Font</code>
</p>

---

## 📋 Содержание

- [🚀 Быстрое восстановление](#-быстрое-восстановление)
- [📦 Все зависимости](#-все-зависимости)
- [⌨️ Все комбинации клавиш](#️-все-комбинации-клавиш)
  - [Запуск приложений](#запуск-приложений)
  - [Управление окнами](#управление-окнами)
  - [Фокус (Vim-навигация)](#фокус-vim-навигация)
  - [Рабочие столы](#рабочие-столы)
  - [Перенос окон](#перенос-окон)
  - [Скриншоты и запись](#скриншоты-и-запись)
  - [Мультимедиа](#мультимедиа)
  - [Система](#система)
- [📁 Структура конфигов](#-структура-конфигов)
- [🎨 Темы](#-темы)

---

## 🚀 Быстрое восстановление

```bash
# 1. Скопировать все конфиги
cp -rf dotfiles/hypr        ~/.config/
cp -rf dotfiles/kitty       ~/.config/
cp -rf dotfiles/waybar      ~/.config/
cp -rf dotfiles/wofi        ~/.config/
cp -rf dotfiles/cava        ~/.config/
cp -rf dotfiles/gtk/gtk-3.0 ~/.config/gtk-3.0/
cp -rf dotfiles/gtk/gtk-4.0 ~/.config/gtk-4.0/
cp -rf dotfiles/gtk/gtk-2.0 ~/.config/gtk-2.0/
cp     dotfiles/gtk/.gtkrc-2.0 ~/
cp     dotfiles/shell/.zshrc    ~/
cp     dotfiles/shell/.zprofile ~/
cp     dotfiles/shell/.bashrc   ~/
cp     dotfiles/shell/.p10k.zsh ~/
cp     dotfiles/git/.gitconfig  ~/
cp -rf dotfiles/wallpapers  ~/Pictures/
cp     dotfiles/scripts/screenrecord ~/.local/bin/

# 2. Keyd (требует sudo)
sudo mkdir -p /etc/keyd
sudo cp dotfiles/keyd/default.conf /etc/keyd/
sudo systemctl enable --now keyd

# 3. Тема GTK
sudo cp -rf dotfiles/themes/catppuccin-mocha-mauve-standard+default /usr/share/themes/

# 4. Autostart
cp dotfiles/autostart/*.desktop ~/.config/autostart/
```

---

## 📦 Все зависимости

### Система (Fedora)

```bash
# Hyprland и окружение
sudo dnf install hyprland hyprlock hyprpolkitagent waybar wofi kitty
sudo dnf install swww grim slurp wl-clipboard cliphist wf-recorder
sudo dnf install brightnessctl network-manager-applet nm-connection-editor
sudo dnf install pavucontrol pulseaudio-utils pipewire-pulseaudio
sudo dnf install nautilus discord
sudo dnf install power-profiles-daemon
sudo dnf install keyd

# Шрифты
sudo dnf install jetbrains-mono-fonts-all
# Или вручную скачать JetBrainsMono Nerd Font

# Скриншоты
sudo dnf install grim slurp wl-clipboard

# Утилиты
sudo dnf install wtype unzip
```

### Flatpak

```bash
flatpak install md.obsidian.Obsidian
flatpak install com.github.flxzt.rnote
flatpak install com.github.neithern.g4music
flatpak install com.github.tenderowl.frog
```

### Oh My Zsh + тема

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### opencode (AI-ассистент)

```bash
pip install opencode
# Или curl -fsSL https://opencode.ai/install.sh | sh
```

---

## ⌨️ Все комбинации клавиш

> **Super** = `⊞ Win` / `⌘ Cmd`

### Запуск приложений

| Комбинация | Действие |
|------------|----------|
| `Super + Enter` | Терминал (Kitty) |
| `Super + Shift + W` | Меню приложений (Wofi) |
| `Super + Shift + E` | Файловый менеджер (Nautilus) |
| `Super + Shift + B` | Браузер (Firefox) |
| `Super + Shift + T` | Telegram |
| `Super + Shift + O` | Obsidian |
| `Super + Shift + R` | Rnote (заметки) |
| `Super + Shift + M` | G4Music (плеер) |
| `Super + Shift + F` | Frog (OCR-распознавание текста) |
| `Super + Shift + D` | Discord |
| `Super + V` | История буфера обмена (cliphist + wofi) |

### Управление окнами

| Комбинация | Действие |
|------------|----------|
| `Super + Q` | Закрыть окно |
| `Super + Space` | Переключить плавающий режим |
| `Super + F` | Полный экран |
| `Super + мышь` (перетаскивание) | Переместить окно |
| `Super + правая кнопка` | Изменить размер окна |

### Фокус (Vim-навигация)

| Комбинация | Действие |
|------------|----------|
| `Super + H` | Фокус влево |
| `Super + J` | Фокус вниз |
| `Super + K` | Фокус вверх |
| `Super + L` | Фокус вправо |

### Рабочие столы

| Комбинация | Действие |
|------------|----------|
| `Super + 1–0` | Перейти на рабочий стол 1–10 |

### Перенос окон

| Комбинация | Действие |
|------------|----------|
| `Super + Shift + 1–0` | Перенести окно на стол 1–10 |

### Скриншоты

| Комбинация | Действие |
|------------|----------|
| `Print` | Скриншот области (grim + slurp → ~/Pictures/screenshot/) |
| `Shift + Print` | Запись экрана (wf-recorder + slurp) |
| `Super + Delete` | Остановить запись экрана |

### Мультимедиа

| Клавиша | Действие |
|---------|----------|
| `XF86AudioRaiseVolume` | Громче (wpctl) |
| `XF86AudioLowerVolume` | Тише |
| `XF86AudioMute` | Выключить звук |
| `XF86AudioMicMute` | Выключить микрофон |
| `XF86MonBrightnessUp` | Ярче (brightnessctl) |
| `XF86MonBrightnessDown` | Темнее |

### Система

| Комбинация | Действие |
|------------|----------|
| `Super + Shift + L` | Заблокировать экран (hyprlock — подхватывает текущие обои) |
| `Super + Shift + P` | Выбрать обои (wofi + swww) |
| `Super + Escape` | Меню питания (Shutdown / Reboot / Suspend / Lock) |
| `Super + B` | Режимы батареи (Performance / Balanced / Power Saver) |
| `Super + Shift + Backspace` | Выйти из Hyprland |

---

## 📁 Структура конфигов

```
dotfiles/
├── hypr/                         # Hyprland — оконный менеджер
│   ├── hyprland.conf             # Главный — собирает всё source
│   ├── hyprlock.conf             # Экран блокировки
│   ├── mocha.conf                # Цвета Catppuccin Mocha (26 переменных)
│   ├── conf/
│   │   ├── autostart.conf        # Автозапуск: waybar, cliphist, swww, nm-applet, gsettings
│   │   ├── binds.conf            # 96 строк хоткеев
│   │   ├── env.conf              # Переменные окружения, монитор, $terminal/$browser/$menu
│   │   ├── input.conf            # Клавиатура (us,ru), мышь, тачпад, жесты
│   │   └── visuals.conf          # Гапсы, рамки, blur, тени, анимации
│   └── scripts/
│       ├── lock.sh               # Блокировка с текущими обоями из swww
│       ├── wallpaper.sh          # Выбор обоев через wofi + swww
│       ├── power-profile.sh      # Текущий профиль питания
│       ├── wifi-status.sh        # SSID через nmcli
│       ├── cava-waybar.sh        # Аудиовизуализация (опционально)
│       ├── wofi-emoji.sh         # Палитра эмодзи
│       └── wofi/
│           ├── wofi-battery.sh   # Переключение профилей + статус батареи
│           ├── wofi-power.sh     # Shutdown/Reboot/Suspend/Lock
│           ├── wofi-powerprofile.sh
│           ├── wofi-calendar.sh  # Календарь-планировщик (160 строк)
│           └── wofi-wifi.sh      # Выбор Wi-Fi сети (с запросом пароля)
│
├── kitty/kitty.conf              # Терминал: Catppuccin Mocha, JetBrainsMono Nerd Font
│
├── waybar/                       # Верхняя панель
│   ├── config.jsonc              # Модули: workspaces, mpris, calendar, network, sound, brightness, battery, tray
│   ├── style.css                 # Floating pills, Catppuccin (206 строк)
│   └── scripts/
│       ├── calendar.sh           # Переключение часы/дата
│       ├── power.sh              # Алиас на wofi-battery.sh
│       └── wifi.sh               # Алиас на wofi-wifi.sh
│
├── wofi/                         # Меню запуска
│   ├── config                    # drun, 30% ширина
│   └── style.css                 # Catppuccin, скругления, 68 строк
│
├── cava/                         # Аудиовизуализатор
│   ├── config
│   └── shaders/
│       ├── bar_spectrum.frag     # Шейдер спектра
│       ├── northern_lights.frag  # Шейдер "северное сияние"
│       └── pass_through.vert
│
├── gtk/                          # Темы GTK2/3/4
│   ├── .gtkrc-2.0
│   ├── gtk-2.0/gtkfilechooser.ini
│   ├── gtk-3.0/settings.ini
│   └── gtk-4.0/settings.ini
│
├── shell/                        # Оболочки
│   ├── .zshrc                    # Oh My Zsh + Powerlevel10k
│   ├── .zprofile                 # Автозапуск Hyprland на tty1
│   ├── .bashrc
│   └── .p10k.zsh                 # Настройки темы Powerlevel10k
│
├── keyd/default.conf             # Переназначение клавиш (/etc/keyd/)
├── git/.gitconfig                # Настройки Git
├── autostart/FlClashX.desktop    # Автозапуск VPN
├── themes/                       # index.theme (остальное — из пакета)
├── wallpapers/                   # 8 обоев (jpg/png)
├── scripts/screenrecord          # Скрипт записи экрана (wf-recorder + slurp)
└── opencode/opencode.jsonc       # opencode config
```

---

## 🎨 Темы

| Компонент | Тема |
|-----------|------|
| **GTK3/GTK4** | `catppuccin-mocha-mauve-standard+default` |
| **Hyprland** | Catppuccin Mocha (26 цветовых переменных в `mocha.conf`) |
| **Kitty** | Catppuccin Mocha — кастомная ручная раскладка |
| **Waybar** | Catppuccin Mocha — floating pills без теней |
| **Wofi** | Catppuccin Mocha — скруглённые элементы |
| **Hyprlock** | Ледяной голубой акцент на тёмном фоне |
| **GTK2** | Catppuccin Mocha |
| **Иконки** | Adwaita (стандартные) |
| **Курсор** | default |

### Цветовая палитра (Catppuccin Mocha)

```
 ■ Rosewater  f5e0dc    ■ Mauve      cba6f7    ■ Teal       94e2d5
 ■ Flamingo   f2cdcd    ■ Red        f38ba8    ■ Sky        89dceb
 ■ Pink       f5c2e7    ■ Maroon     eba0ac    ■ Sapphire   74c7ec
                       ■ Peach      fab387    ■ Blue       89b4fa
                       ■ Yellow     f9e2af    ■ Lavender   b4befe
                       ■ Green      a6e3a1
```

---

<p align="center">
  <sub>Сделано с ❄️ в Fedora • 2026</sub>
</p>
