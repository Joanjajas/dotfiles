#!/bin/sh

# Colors
RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[33m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')


#------------------------------------------ Warning messages -------------------------------------------------


# Advertising the user to not run this script as root
if [ "$(id -u)" = 0 ]; then
  printf "%s\n##################################################################\n"     $RED
  printf     "##         This script MUST NOT be run as root user             ##\n"
  printf     "##        You will be asked when root privileges needed         ##\n"
  printf     "##################################################################\n%s\n" $RESET
  exit 1
fi


printf "%s\n#################################################################################\n"     $RED
printf     "##  This script is supossed to be runned in a newly clear arch installation,   ##\n"
printf     "## otherwise it can delete some user configuration files, so be careful if you ##\n"
printf     "##                 run it on a not new arch installation                       ##\n"
printf     "#################################################################################\n%s\n" $RESET


# User confirmation
read -p "Install Joan dotfiles? [Y/n]: " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	echo
	exit 1
fi


#-------------------------------------------- Installtion ----------------------------------------------------


# Internet connection check
printf "%s\nCheking internet connection\n%s" $BLUE $RESET

if ! ping -q -c 2 -W 2 archlinux.org >/dev/null 2>&1; then
  printf "%s\n##################################################################\n"     $RED
  printf     "##    You need to have internet connection to run this script   ##\n"
  printf     "##           Please check your network and try again            ##\n"
  printf     "##################################################################\n%s\n" $RESET
  exit 1
fi


printf "%s\n##################################################################\n"     $BLUE
printf     "##                    Starting insallation                      ##\n"
printf     "##################################################################\n%s\n" $RESET

# Removing any previous configuration
printf "%sRemoving any previous configuration\n%s" $RED $RESET

[ -d ~/.git ] && rm -rf ~/.git
[ -d ~/.oh-my-zsh ] && rm -rf ~/.oh-my-zsh
[ -d ~/.config/nvim ] && rm -rf ~/.config/nvim
[ -d ~/.config/gtk-3.0 ] && rm -rf ~/.config/gtk-3.0
[ -d ~/.config/oh-my-zsh ] && rm -rf ~/.config/oh-my-zsh
[ -d ~/.local/share/nvim ] && rm -rf ~/.local/share/nvim
[ -d ~/.config/alacritty ] && rm -rf ~/.config/alacritty

# Creating all necessary directories
printf "%sImporting dotfiles\n%s" $BLUE $RESET

[ ! -d ~/Documents ] && mkdir ~/Documents
[ ! -d ~/.local/share/nvim ] && mkdir -p ~/.local/share/nvim
[ ! -d ~/.local/share/fonts ] && mkdir -p ~/.local/share/fonts
[ ! -d ~/dotfiles ] && git clone https://github.com/joanjajas/dotfiles ~/dotfiles

# Moving config files
cp -rT ~/dotfiles ~/


printf "%s\n##################################################################\n"     $BLUE
printf     "##                    Configuring Pacman                        ##\n"
printf     "##################################################################\n%s\n" $RESET

# Editing /etc/pacman.conf to improve pacman look and performance
sudo sed -i 's/#Color/Color/' /etc/pacman.conf
sudo sed -i '38s/.*/ILoveCandy\n/' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf

# Syncing repositories
echo -ne '\n' | sudo pacman -Syyu 2>/dev/null


printf "%s\n##################################################################\n"     $BLUE
printf     "##                   Installing core packages                   ##\n"
printf     "##################################################################\n%s\n" $RESET

# Installing basic and core packages needed for the setup
sudo pacman --noconfirm --needed -S xorg xorg-xinit libev libconfig picom polkit 2>/dev/null
sudo pacman --noconfirm --needed -S feh neofetch htop dmenu macchanger 2>/dev/null
sudo pacman --noconfirm --needed -S firefox alacritty ranger neovim 2>/dev/null
sudo pacman --noconfirm --needed -S brightnessctl alsa-utils 2>/dev/null
sudo pacman --noconfirm --needed -S zsh lsd bat dust arc-gtk-theme 2>/dev/null


printf "%s\n##################################################################\n"     $BLUE
printf     "##                  Setting up the terminal                     ##\n"
printf     "##################################################################\n%s" $RESET

# Changing default shell to zsh
if [ ! "$(basename -- "$SHELL")" = "zsh" ]; then
  printf "%s\nChanging default shell to zsh\n%s" $BLUE $RESET

  while ! chsh -s /usr/bin/zsh
  do
	:
  done
fi


# Downloading terminal font
curl -sSL https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Bold/complete/Caskaydia%20Cove%20Bold%20Nerd%20Font%20Complete.otf --output ~/.local/share/fonts/Caskaydia\ Cove\ Bold\ Nerd\ Font\ Complete.otf


# Installing ohmyzsh
printf "%s\nInstalling ohmyzsh%s\n" $BLUE $RESET
echo -ne '\n' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >/dev/null

# Removing ohmyzsh auto generated .zshrc
[ -f ~/.zshrc ] && rm -rf ~/.zshrc
[ -f ~/.zshrc.pre-oh-my-zsh ] && mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
[ -d ~/.oh-my-zsh ] && mv ~/.oh-my-zsh ~/.config/oh-my-zsh


# Installing powerlevel10k
printf "%s\nInstalling powerlevel10k\n%s" $BLUE $RESET
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/oh-my-zsh/custom/themes/powerlevel10k
cp ~/.config/general/p10k.zsh ~/.config/oh-my-zsh/custom/themes/powerlevel10k


# Changing default .zcompdump files directory and creading a custom dirctory for zsh history
sed -i 's/ZDOTDIR:-$HOME/ZSH_CACHE_DIR/' ~/.config/oh-my-zsh/oh-my-zsh.sh
[ ! -d ~/.cache/zsh ] && mkdir -p ~/.cache/zsh


printf "%s\n##################################################################\n"     $BLUE
printf     "##                     Installing neovim                        ##\n"
printf     "##################################################################\n%s\n" $RESET

# Cloning Paq
printf "%sInstalling Paq\n%s" $BLUE $RESET
git clone --depth=1 https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim

# Installing plugins
printf "%s\nInstalling Plugins\n%s" $BLUE $RESET
nvim --headless +PaqInstall +qa 2>/dev/null
sleep 3


#------------------------------------------- Post Installation -----------------------------------------------


printf "%s\nDoing some post-installation stuff\n%s" $GREEN $RESET

sudo cp ~/.config/dwm/dwm /usr/local/bin
sudo cp ~/.config/general/30-touchpad.conf /etc/X11/xorg.conf.d

[ -f ~/.bashrc ] && rm -rf ~/.bashrc
[ -d ~/dotfiles ] && rm -rf ~/dotfiles
[ -f ~/.bash_logout ] && rm -rf ~/.bash_logout
[ -f ~/.bash_profile ] && rm -rf ~/.bash_profile
[ -f ~/.bash_history ] && rm -rf ~/.bash_history


printf "%s\n##################################################################\n"     $GREEN
printf     "##                   Installation complete                      ##\n"
printf     "##################################################################\n%s\n" $RESET

printf "%sRebooting...\n\n%s" $GREEN $RESET
sleep 5
reboot
