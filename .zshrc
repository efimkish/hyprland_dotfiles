# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting colored-man-pages)
source $ZSH/oh-my-zsh.sh

# Алиасы (твои настройки)
alias ll='ls -lah'
alias gs='git status'
alias gp='git pull'
alias gd='git diff'
alias suhiddify='sudo -E WAYLAND_DISPLAY=$WAYLAND_DISPLAY hiddify'
alias myclock='tty-clock -c -C 7 -d -T'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR=nano
export VISUAL=nano
