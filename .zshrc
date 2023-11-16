################################################################################
# keybinds
################################################################################
bindkey -v
bindkey -M viins kj vi-cmd-mode
bindkey -v '^?' backward-delete-char
bindkey -M emacs '^P' fzf-history-widget
bindkey -M viins '^P' fzf-history-widget

################################################################################
# env vars
################################################################################
export EDITOR=nvim
export LESSHISTFILE=-
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup
export HISTFILE=$HOME/.cache/zsh/zsh_history
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export FZF_COMPLETION_TRIGGER='--'

################################################################################
# aliases
################################################################################

# general
alias cat=bat
alias du=dust
alias nv=nvim
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias clear='printf "\33c\e[3J"'
alias l='exa -la --icons --no-time'

# python
alias pip='python -m pip'
alias python='/opt/homebrew/bin/python3'

# git and github
alias gd='git diff'
alias gs='git status'
alias gr='git restore .'
alias gl='git clone'
alias ghe='gh copilot explain'
alias ghs='gh copilot suggest'
alias gc='$HOME/scripts/git/git_commit_push'

# fzf
alias fp='. $HOME/scripts/fzf/open_git_file'
alias fa='. $HOME/scripts/fzf/open_file_all'
alias fgs='. $HOME/scripts/fzf/open_git_status'
alias ff='. $HOME/scripts/fzf/cd_dir'
alias f='. $HOME/scripts/fzf/open_file'

################################################################################
# zsh options
################################################################################

# ignore commands starting with space
setopt HIST_IGNORE_SPACE

# case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit -d $HOME/.cache/zsh/zcompdump

################################################################################
# fzf options
################################################################################

# fzf complete path
_fzf_compgen_path() {
    $HOME/scripts/fzf/completion_path
}

# fzf complete dir
_fzf_compgen_dir() {
    $HOME/scripts/fzf/completion_dir
}

################################################################################
# sources
################################################################################
source "/opt/homebrew/opt/fzf/shell/completion.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
source "$HOME/.config/cargo/env"

# Completion sources
fpath=($HOME/scripts/zsh_completions/ $fpath)

################################################################################
# evals
################################################################################
eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

################################################################################
# startup
################################################################################

# run tmux on startup or attach to existing session
if [ -z "$TMUX" ]; then
    tmux new-session -A
fi
