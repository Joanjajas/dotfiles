# keybinds
bindkey -v
bindkey -M viins kj vi-cmd-mode
bindkey -v '^?' backward-delete-char
bindkey -M emacs '^P' fzf-history-widget
bindkey -M viins '^P' fzf-history-widget

# env vars
export LESSHISTFILE=-
export EDITOR=nvim
export FZF_COMPLETION_TRIGGER='--'
export CARGO_HOME=~/.config/cargo
export RUSTUP_HOME=~/.config/rustup
export HISTFILE=~/.cache/zsh/zsh_history
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# aliases
alias cat=bat
alias du=dust
alias nv=nvim

alias gd='git diff'
alias gs='git status'
alias gr='git restore .'
alias gc='$HOME/scripts/git/git_commit_push.sh'

alias ..='cd ..'
alias clear='printf "\33c\e[3J"'
alias l='exa -la --icons --no-time'

alias pip='python -m pip'
alias python='/opt/homebrew/bin/python3'

alias f='. $HOME/scripts/fzf/open_git_file'
alias fa='. $HOME/scripts/fzf/open_file_all'
alias fgs='. $HOME/scripts/fzf/open_git_status'
alias ff='. $HOME/scripts/fzf/cd_dir'
alias fp='. $HOME/scripts/fzf/open_file'

# autocomplete when completing a path with fzf
_fzf_compgen_path() {
    $HOME/scripts/fzf/completion_path
}

# autocomplete when completing a directory with fzf
_fzf_compgen_dir() {
    $HOME/scripts/fzf/completion_dir
}

source "/opt/homebrew/opt/fzf/shell/completion.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
source "$HOME/.config/cargo/env"

eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# run tmux on startup or attach to existing session
if [ -z "$TMUX" ]; then
    tmux new-session -A
fi
