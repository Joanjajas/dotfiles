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
export FZF_COMPLETION_TRIGGER='__'
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
            eza -la --icons --no-time --git --colour=always {};
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
alias l='eza -la --icons --no-time --git'
alias matlab='/Applications/MATLAB_R2024a.app/bin/matlab -nodesktop -nosplash'

# python
alias pip='pip3'
alias python='python3'
alias da='conda deactivate'
alias pa='. $HOME/scripts/conda'

# git and github
alias gd='git diff'
alias gs='git status'
alias ghe='gh copilot explain'
alias ghs='gh copilot suggest'
alias ghb='gh browse'
alias gra='git restore .'
alias gc='. $HOME/scripts/git/clone'
alias gp='$HOME/scripts/git/commit_and_push'
alias gr='$HOME/scripts/git/restore'
alias or='$HOME/scripts/git/open_repo'

# file opening
alias f='. $HOME/scripts/fs/open'
alias ff='. $HOME/scripts/fs/cd'
alias fgs='$HOME/scripts/git/status'
alias frg='$HOME/scripts/fs/ripgrep'

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
# Startup
################################################################################

# run tmux on startup or attach to existing session
if [ -z "$TMUX" ]; then
    tmux new-session -A
fi

# conda
__conda_setup="$('/Users/joan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

