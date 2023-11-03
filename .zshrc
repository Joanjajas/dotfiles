# keybinds
bindkey -v
bindkey -M viins kj vi-cmd-mode
bindkey -v '^?' backward-delete-char
bindkey -M emacs '^P' fzf-history-widget
bindkey -M viins '^P' fzf-history-widget

# env vars
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export HISTFILE=~/.cache/zsh/zsh_history
export RUSTUP_HOME=~/.config/rustup
export CARGO_HOME=~/.config/cargo
export FZF_COMPLETION_TRIGGER='--'
export LESSHISTFILE=-

# aliases
alias cat=bat
alias du=dust
alias nv=nvim
alias ..='cd ..'
alias l='exa -la --icons --no-time'
alias gs='git status'
alias pip='python -m pip'
alias python='/opt/homebrew/bin/python3'
alias gd='git diff'
alias gc='~/scripts/git/git_commit_push.sh'
alias clear='printf "\33c\e[3J"'
alias f='~/scripts/fzf/open_file.sh'
alias fa='~/scripts/fzf/open_all.sh'
alias fp='. ~/scripts/fzf/open_dir.sh'
alias ff='. ~/scripts/fzf/find_dir.sh'

# autocomplete when completing a path with fzf
_fzf_compgen_path() {
    ~/scripts/fzf/completion_path.sh
}

# autocomplete when completing a directory with fzf
_fzf_compgen_dir() {
    ~/scripts/fzf/completion_dir.sh
}

# fzf completion and keybinds
source "/opt/homebrew/opt/fzf/shell/completion.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# evals
eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# run tmux on startup or attach to existing session
if [ -z "$TMUX" ]; then
    tmux new-session -A
fi
