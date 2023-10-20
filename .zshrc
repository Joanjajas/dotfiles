# Source cargo binaries 
if [[ -a ~/.config/cargo ]]
then
  source ~/.config/cargo/env
fi

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export HISTFILE=~/.cache/zsh/zsh_history
export RUSTUP_HOME=~/.config/rustup
export CARGO_HOME=~/.config/cargo
export FZF_COMPLETION_TRIGGER='--'
export LESSHISTFILE=-

alias l='exa -la --icons --no-time'
alias fd='fd -i'
alias cat=bat
alias du=dust
alias gs='git status'
alias clear='printf "\33c\e[3J"'
alias python='python3'
alias pip='python -m pip'

alias f='~/scripts/fzf/open_file.sh'
alias fa='~/scripts/fzf/find_all.sh'
alias fp='. ~/scripts/fzf/open_dir.sh'
alias ff='cd $(fd -t d . ~/ ~/Documents ~/Downloads | fzf)'

# fzf stuff
_fzf_compgen_path() {
    fd -u . ~/  -E Library -E node_modules -E .vscode -E .git -E .cache -E .config/cargo/registry -E .config/rustup -E Plublic -E Pictures -E Music -E Movies -E .DS_Store
}

_fzf_compgen_dir() {
    fd -t d -u . ~/ -E Library -E node_modules -E .vscode -E .git -E .cache -E .config/cargo/registry -E .config/rustup -E Plublic -E Pictures -E Music -E Movies -E .DS_Store
}

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
