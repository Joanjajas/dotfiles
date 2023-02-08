# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

source $ZSH/oh-my-zsh.sh

# User configuration
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Check if rust is installed
if [[ -a ~/.config/cargo ]]
then
  source ~/.config/cargo/env
fi

export CARGO_HOME=~/.config/cargo
export RUSTUP_HOME=~/.config/rustup
export HISTFILE=~/.cache/zsh/zsh_history
export XAUTHORITY=~/.config/.Xauthority
export LESSHISTFILE=-

alias l='exa -la --icons --no-time'
alias fd='fd -ui'
alias cat=bat
alias du=dust
alias gs='git status'
alias clear='printf "\33c\e[3J"'
alias python='python3'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/oh-my-zsh/custom/themes/powerlevel10k/p10k.zsh ]] || source ~/.config/oh-my-zsh/custom/themes/powerlevel10k/p10k.zsh
