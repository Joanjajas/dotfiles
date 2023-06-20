#!/bin/sh

# Colors
RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[33m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')

main() {
    initial_check
    pacman_config
    core_packages
    copy_dotfiles
    window_manager
    terminal_setup
    nvim_setup
    post_installation
}

initial_check() {
    # Check if the script is being runned as root
    if [ "$(id -u)" = 0 ]; then
        printf "%s\n##################################################################\n"     $RED
        printf     "##           This script MUST NOT be run as root user           ##\n"
        printf     "##         You will be asked when root privileges needed        ##\n"
        printf     "##################################################################\n%s\n" $RESET
        exit 1
    fi

    # Check internet connection
    if ! ping -q -c 2 -W 2 archlinux.org >/dev/null 2>&1; then
        printf "%s\n########################################################################\n"     $RED
        printf     "##  You need to have internet connection in order to run this script  ##\n"
        printf     "##               Please check your network and try again              ##\n"
        printf     "########################################################################\n%s\n" $RESET
        exit 1
    fi

    # Warn the user before running the scipt
    printf "%s\n#################################################################################\n"     $RED
    printf     "##   This script is supossed to be runned on a newly clean arch installation,  ##\n"
    printf     "## otherwise it can delete some user configuration files, so be careful unless ##\n"
    printf     "##                          you know what yo are doing                         ##\n"
    printf     "#################################################################################\n%s\n" $RESET

    # User confirmation
    read -p "Install Joan dotfiles? [y/n]: " -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo
        exit 1
    fi
}

pacman_config() {
    # Edit /etc/pacman.conf to improve pacman look and performance
    sudo sed -i 's/#Color/Color/' /etc/pacman.conf
    sudo sed -i '38s/.*/ILoveCandy\n/' /etc/pacman.conf
    sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf
}

core_packages() {
    # Install basic and core packages
    sudo pacman --noconfirm --needed -S xorg xorg-xinit 2>/dev/null
    sudo pacman --noconfirm --needed -S firefox alacritty ranger neovim 2>/dev/null
    sudo pacman --noconfirm --needed -S brightnessctl alsa-utils picom feh dmenu 2>/dev/null
    sudo pacman --noconfirm --needed -S zsh exa bat fd dust arc-gtk-theme 2>/dev/null
}

copy_dotfiles() {
    # Delete any previous configuration files
    [ -d ~/.git ] && rm -rf ~/.git
    [ -d ~/.cache/nvim ] && rm -rf ~/.config/nvim
    [ -d ~/.config/nvim ] && rm -rf ~/.config/nvim
    [ -d ~/.config/oh-my-zsh ] && rm -rf ~/.config/oh-my-zsh
    [ -d ~/.local/share/nvim ] && rm -rf ~/.local/share/nvim

    # Create all necessary directories
    [ ! -d ~/.local/share/nvim ] && mkdir -p ~/.local/share/nvim
    [ ! -d ~/.local/share/fonts ] && mkdir -p ~/.local/share/fonts
    [ ! -d ~/dotfiles ] && git clone https://github.com/joanjajas/dotfiles ~/dotfiles

    # Copy config files
    cp -rT ~/dotfiles ~/
}

window_manager() {
    git clone https://github.com/joanjajas/dwm ~/dwm >/dev/null
    sudo cp ~/dwm/dwm /usr/local/bin
}

terminal_setup() {
    # Install ohmyzsh
    echo -ne '\n' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >/dev/null

    # Remove ohmyzsh auto generated .zshrc
    [ -f ~/.zshrc ] && rm -rf ~/.zshrc
    [ -f ~/.zshrc.pre-oh-my-zsh ] && mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
    [ -d ~/.oh-my-zsh ] && mv ~/.oh-my-zsh ~/.config/oh-my-zsh

    # Install powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/oh-my-zsh/custom/themes/powerlevel10k
    cp ~/.config/general/p10k.zsh ~/.config/oh-my-zsh/custom/themes/powerlevel10k

    # Change default .zcompdump files directory
    sed -i 's/ZDOTDIR:-$HOME/ZSH_CACHE_DIR/' ~/.config/oh-my-zsh/oh-my-zsh.sh

    # Create custom zsh cache directory
    [ ! -d ~/.cache/zsh ] && mkdir -p ~/.cache/zsh

    # Download terminal font
    curl -sSL https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Bold/complete/Caskaydia%20Cove%20Bold%20Nerd%20Font%20Complete.otf --output ~/.local/share/fonts/Caskaydia\ Cove\ Bold\ Nerd\ Font\ Complete.otf

    # Change default shell to zsh
    if [ ! "$(basename -- "$SHELL")" = "zsh" ]; then
      while ! chsh -s /usr/bin/zsh
      do
        :
      done
    fi
}

nvim_setup() {
    # Clone Paq
    git clone --depth=1 https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

    # Install plugins
    nvim --headless +PaqInstall +qa 2>/dev/null
    sleep 3
}

post_installation() {
    sudo cp ~/.config/general/30-touchpad.conf /etc/X11/xorg.conf.d

    [ -d ~/dwm ] && rm -rf ~/dwm
    [ -f ~/.bashrc ] && rm -rf ~/.bashrc
    [ -d ~/dotfiles ] && rm -rf ~/dotfiles
    [ -f ~/.bash_logout ] && rm -rf ~/.bash_logout
    [ -f ~/.bash_profile ] && rm -rf ~/.bash_profile
    [ -f ~/.bash_history ] && rm -rf ~/.bash_history

    sleep 5
    sudo reboot
}

main
