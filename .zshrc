: '

      ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄▄ 
     █       █       █  █ █  █   ▄  █ █       █
     █▄▄▄▄   █  ▄▄▄▄▄█  █▄█  █  █ █ █ █       █
      ▄▄▄▄█  █ █▄▄▄▄▄█       █   █▄▄█▄█     ▄▄█
 ▄▄▄ █ ▄▄▄▄▄▄█▄▄▄▄▄  █   ▄   █    ▄▄  █    █   
█   ██ █▄▄▄▄▄ ▄▄▄▄▄█ █  █ █  █   █  █ █    █▄▄ 
█▄▄▄██▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█▄▄▄█  █▄█▄▄▄▄▄▄▄█


Dotfiles by @joanjajas

https://github.com/joanjajas/dotfiles

'

################################################################################
# Keybinds
################################################################################
bindkey -v
bindkey -v '^?' backward-delete-char
bindkey -M viins kj vi-cmd-mode
bindkey -M emacs '^P' fzf-history-widget
bindkey -M viins '^P' fzf-history-widget

################################################################################
# Env vars
################################################################################
export EDITOR=nvim
export LESSHISTFILE=-
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup
export HISTFILE=$HOME/.cache/zsh/zsh_history
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export MANPAGER='nvim +Man!'
export FZF_COMPLETION_TRIGGER='--'
export FZF_CTRL_R_OPTS="
  --preview 'echo {}'
  --preview-window hidden:wrap
  --bind 'ctrl-o:toggle-preview'
"
export FZF_DEFAULT_OPTS="
    --reverse
    --height 100%
    --bind 'ctrl-o:toggle-preview'
    --preview-window '<91(0%)'
    --preview
        'if [ -f {} ]; then
            bat {} --color=always;
        elif [ -d {} ]; then
            exa -la --icons --no-time --git {};
        fi'
"

################################################################################
# Aliases
################################################################################

# general
alias cat=bat
alias du=dust
alias nv=nvim
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias clear='printf "\33c\e[3J"'
alias l='exa -la --icons --no-time --git'

# python
alias pip='python -m pip'
alias python='/opt/homebrew/bin/python3'

# git and github
alias gd='git diff'
alias gs='git status'
alias gl='git clone'
alias ghe='gh copilot explain'
alias ghs='gh copilot suggest'
alias gra='git restore .'
alias gc='$HOME/scripts/git/git_commit_push'
alias gr='$HOME/scripts/fzf/git_restore'

# fzf
alias f='$HOME/scripts/fzf/open_file'
alias fp='. $HOME/scripts/fzf/open_git_file'
alias ff='. $HOME/scripts/fzf/cd_dir'
alias fgs='$HOME/scripts/fzf/git_status'
alias frg='$HOME/scripts/fzf/ripgrep'

################################################################################
# Sources
################################################################################
source "/opt/homebrew/opt/fzf/shell/completion.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
source "$HOME/.config/cargo/env"

################################################################################
# Evals
################################################################################
eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

################################################################################
# Zsh options
################################################################################

# ignore commands starting with space
setopt HIST_IGNORE_SPACE

# case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit -d $HOME/.cache/zsh/zcompdump

################################################################################
# Fzf options
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
# Startup
################################################################################

# run tmux on startup or attach to existing session
if [ -z "$TMUX" ]; then
    tmux new-session -A
fi
