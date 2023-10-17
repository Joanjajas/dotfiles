# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

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
export FZF_COMPLETION_TRIGGER='--'
export STARSHIP_CONFIG=~/.config/starship/starship.toml


alias l='exa -la --icons --no-time'
alias fd='fd -i'
alias cat=bat
alias du=dust
alias gs='git status'
alias clear='printf "\33c\e[3J"'
alias python='python3'
alias pip='python -m pip'
alias matlab='/Applications/MATLAB_R2023a.app/bin/matlab -nodesktop -nosplash'
alias f='~/scripts/fzf/open_file.sh'
alias fp='. ~/scripts/fzf/open_dir.sh'
alias ff='cd $(fd -t d . ~/ ~/Documents ~/Downloads | fzf)'
alias fa='~/scripts/fzf/find_all.sh'

# fzf stuff
_fzf_compgen_path() {
    fd -u . ~/  -E Library -E node_modules -E .vscode -E .git -E .cache -E .config/cargo/registry -E .config/rustup -E Plublic -E Pictures -E Music -E Movies -E .DS_Store
}

_fzf_compgen_dir() {
    fd -t d -u . ~/ -E Library -E node_modules -E .vscode -E .git -E .cache -E .config/cargo/registry -E .config/rustup -E Plublic -E Pictures -E Music -E Movies -E .DS_Store
}

[[ ! -f ~/.config/oh-my-zsh/custom/themes/powerlevel10k/p10k.zsh ]] || source ~/.config/oh-my-zsh/custom/themes/powerlevel10k/p10k.zsh

if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# run tmux on startup or attach to existing session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    tmux new-session -A
fi

eval "$(starship init zsh)"
