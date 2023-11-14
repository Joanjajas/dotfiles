# keybinds
bindkey -v
bindkey -M viins kj vi-cmd-mode
bindkey -v '^?' backward-delete-char
bindkey -M emacs '^P' fzf-history-widget
bindkey -M viins '^P' fzf-history-widget

# env vars
export EDITOR=nvim
export LESSHISTFILE=-
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup
export HISTFILE=$HOME/.cache/zsh/zsh_history
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export FZF_COMPLETION_TRIGGER='--'

# aliases
alias cat=bat
alias du=dust
alias nv=nvim

alias gd='git diff'
alias gs='git status'
alias gr='git restore .'
alias gc='$HOME/scripts/git/git_commit_push'

alias ..='cd ..'
alias clear='printf "\33c\e[3J"'
alias l='exa -la --icons --no-time'

alias pip='python -m pip'
alias python='/opt/homebrew/bin/python3'

alias fp='. $HOME/scripts/fzf/open_git_file'
alias fa='. $HOME/scripts/fzf/open_file_all'
alias fgs='. $HOME/scripts/fzf/open_git_status'
alias ff='. $HOME/scripts/fzf/cd_dir'
alias f='. $HOME/scripts/fzf/open_file'

# sources
source "/opt/homebrew/opt/fzf/shell/completion.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
source "$HOME/.config/cargo/env"

# evals
eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# zsh options
setopt HIST_IGNORE_SPACE

# case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit -d $HOME/.cache/zsh/zcompdump

# autocomplete when completing a path with fzf
_fzf_compgen_path() {
    $HOME/scripts/fzf/completion_path
}

# autocomplete when completing a directory with fzf
_fzf_compgen_dir() {
    $HOME/scripts/fzf/completion_dir
}


# run tmux on startup or attach to existing session
if [ -z "$TMUX" ]; then
    tmux new-session -A
fi
