# keybinds
bindkey -v
bindkey -v '^?' backward-delete-char
bindkey -M viins ^P fzf-history-widget
bindkey -M viins kj vi-cmd-mode
bindkey -M emacs '^P' fzf-history-widget

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
alias ..='cd ..'
alias l='exa -la --icons --no-time'
alias gs='git status'
alias gp='git_commit_push'
alias pip='python -m pip'
alias python='/opt/homebrew/bin/python3'
alias clear='printf "\33c\e[3J"'
alias f='~/scripts/fzf/open_file.sh'
alias fa='~/scripts/fzf/find_all.sh'
alias fp='. ~/scripts/fzf/open_dir.sh'
alias ff='cd $(fd -t d . ~/ ~/Documents ~/Downloads | fzf)'

# commit and push to git
function git_commit_push() {
    message=$*
    if [ -z "$message" ]; then
        printf "Commit message: "
        read message
    fi
    git add .
    git commit -m "$message"
    git push
}

# autocomplete when completing a path with fzf
_fzf_compgen_path() {
    fd -u . ~/ \
       -E Library \
       -E node_modules \
       -E .vscode \
       -E .git \
       -E .cache \
       -E .config/cargo/registry \
       -E .config/rustup \
       -E Public \
       -E Pictures \
       -E Music \
       -E Movies \
       -E .DS_Store
}

# autocomplete when completing a directory with fzf
_fzf_compgen_dir() {
    fd -t d -u . ~/ \
       -E Library \
       -E node_modules \
       -E .vscode \
       -E .git \
       -E .cache \
       -E .config/cargo/registry \
       -E .config/rustup \
       -E Public \
       -E Pictures \
       -E Music \
       -E Movies \
       -E .DS_Store
}

# add fzf to path
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# fzf completions
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# fzf keybindings
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# run tmux on startup or attach to existing session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    tmux new-session -A
fi

# starship prompt
eval "$(starship init zsh)"
