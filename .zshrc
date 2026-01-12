export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

fastfetch -c ~/.config/fastfetch/config.jsonc

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

setwall() { 
    matugen image "$1"
    spicetify update
    pkill -USR1 ghostty
}

source <(fzf --zsh)
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/catppuccin.omp.json)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export PATH=$PATH:$HOME/.spicetify