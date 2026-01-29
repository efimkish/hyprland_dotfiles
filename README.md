Великий и ужасный вайбкодер (я) перешел на хайпепрленд на арче



### СКРИНЫ
<img width="1920" height="1080" alt="изображение" src="https://github.com/user-attachments/assets/92d2ecdc-2f01-40b4-8f16-646d0ffdd136" /> 
<img width="1920" height="1080" alt="изображение" src="https://github.com/user-attachments/assets/cb76e462-732a-4bb6-9540-4dda38884cc1" /> 
<img width="1920" height="1080" alt="изображение" src="https://github.com/user-attachments/assets/552487d2-191c-419b-9313-ce2d95a2062a" />



### 1. Ядро системы и Hyprland

```
sudo pacman -S --needed base base-devel linux linux-headers linux-firmware hyprland hyprlock hyprpaper xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-gnome qt5-wayland qt6-wayland
```

### 2. Интерфейс и шрифты 


```
# Шрифты из официальных репо
sudo pacman -S --needed ttf-jetbrains-mono-nerd otf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-dejavu ttf-liberation ttf-opensans

# Шрифты из AUR (Критичны для твоего Waybar и Zsh)
yay -S --needed ttf-all-the-icons ttf-icomoon-feather ttf-meslo-nerd-font-powerlevel10k
```

### 3. Утилиты для горячих клавиш (Keybindings)

```
sudo pacman -S --needed kitty nautilus rofi-wayland waybar swaybg swaync cliphist wl-clipboard grim slurp brightnessctl pamixer pavucontrol nm-applet nwg-look bluez bluez-utils blueman python-requests jq wtype
```

- **Терминал**: `kitty`.
    
- **Скриншоты**: `grim` + `slurp`.
    
- **Буфер обмена**: `cliphist` + `wl-clipboard`.
    
- **Звук и Яркость**: `pamixer`, `brightnessctl`, `pavucontrol`.
    

### 4. Сеть и Прокси (v2rayA)

```
# Официальные репо
sudo pacman -S --needed networkmanager network-manager-applet v2ray xray
# AUR
yay -S --needed v2raya hiddify nekobox
```

### 5. Пользовательские приложения


```
# Официальные репо
sudo pacman -S --needed firefox discord obsidian mpv yt-dlp zathura zathura-pdf-mupdf xournalpp lutris flatpak rsync fastfetch yazi
# AUR
yay -S --needed materialgram-bin vesktop tlauncher-installer tty-clock gapless
```

### 6. Темы и оформление (GTK/QT)

```
sudo pacman -S --needed arc-gtk-theme papirus-icon-theme qt5ct qt6ct
# AUR
yay -S --needed sddm-sugar-candy-git
```

### 7. Shell (Zsh и терминал)

```
sudo pacman -S --needed zsh zsh-autosuggestions zsh-syntax-highlighting bash-completion
```


## ⌨️ Горячие клавиши (Control Room)

| Комбинация        | Действие                           |
| ----------------- | ---------------------------------- |
| `Mod + RETURN`    | Запустить Терминал (**Kitty**)     |
| `Mod + Q`         | Закрыть текущее окно               |
| `Mod + SHIFT + W` | Меню приложений (**Rofi**)         |
| `Mod + SHIFT + B` | Браузер (**Firefox**)              |
| `Mod + SHIFT + E` | Проводник (**Nautilus**)           |
| `Mod + SHIFT + T` | Мессенджер (**Telegram**)          |
| `Mod + V`         | **История буфера обмена**          |
| `Print`           | Скриншот области                   |
| `Mod + SHIFT + L` | Заблокировать экран (**Hyprlock**) |
| `Mod + SPACE`     | Переключить режим «Плавающее окно» |
| `Mod + F`         | Полный экран                       |


### Навигация (Vim-style)

- `Mod + H / L` — Влево / Вправо
    
- `Mod + K / J` — Вверх / Вниз
    
- `Mod + 1-0` — Переключение рабочих столов 
