#
# ~/.zshrc
#

# EXPORTS
export PATH=$PATH:$HOME/.local/bin:$HOME/.scripts 

# HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory


[[ $- != *i* ]] && return
# ALIASES
alias pacrm="sudo pacman -Runs $(pacman -Qdtq)"
alias yay='paru'
alias udate="sudo pacman -Syyuu && flatpak update && paru -Syu"
alias v='nvim'
alias ls='ls -lah --color=auto'

# PROMPT
PS1='meinps%'
eval $(starship init zsh)
neofetch
