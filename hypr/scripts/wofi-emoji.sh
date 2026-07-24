#!/bin/bash

if ! command -v wtype &>/dev/null; then
    notify-send -u critical "Emoji" "wtype не установлен"
    exit 1
fi

EMOJI_FILE="/usr/share/unicode/emoji/emoji-test.txt"

if [ -f "$EMOJI_FILE" ]; then
    chosen=$(grep '; fully-qualified' "$EMOJI_FILE" | grep -oP '# \K\S+' | head -400 | \
        wofi -d -p "Emoji" -W 450 -H 400)
else
    chosen=$(printf '😀 😁 😂 🤣 😃 😄 😅 😆 😉 😊 😋 😎 😍 🥰 😘 😗 😙 😚 🤩 🥳\n👍 👎 👊 ✊ 🤛 🤜 🤞 🖕 ✌️ 🤟 🤘 👌 🤏\n❤️ 🧡 💛 💚 💙 💜 🖤 🤍 🤎 💔 ❤️‍🔥 ❤️‍🩹\n🔥 ⭐ ✨ 🌟 💫 ⚡ 💥 💯 🎯 🏆 🎉 🎊 🎈 🎁' | tr ' ' '\n' | \
        wofi -d -p "Emoji" -W 450 -H 400)
fi

[ -z "$chosen" ] && exit 0

emoji=$(echo "$chosen" | awk '{print $1}')

echo -n "$emoji" | wl-copy
wtype "$emoji"
