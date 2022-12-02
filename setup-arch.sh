#!/bin/bash
# ****************************************
# *************** WARNINGS ***************
# ****************************************

# THIS SETUP IS ONLY FOR ARCH/PACMAN USERS
# DO NOT RUN THIS SCRIPT AS ROOT
# THIS SHOULD BE IN YOUR $HOME DIRECTORY

echo 'This script is not designed to be run as root'
echo 'The program will use sudo'
sleep 3;

# Making files executables

chmod +x $HOME/dotfiles/dots/polybar/launch.sh
chmod +x $HOME/dotfiles/dots/polybar/player-moc.sh
chmod +x $HOME/dotfiles/dots/config/bspwm/bspwmrc
chmod +x $HOME/dotfiles/dots/config/sxhkd/sxhkd

# installing important packages
sudo pacman -S --noconfirm sddm bspwm sxhkd rofi polybar unzip git kitty nitrogen xorg-xrdb xorg-xrandr xorg-xsetroot wget dunst > /dev/null

# installing media
sudo pacman -S --noconfirm pipewire-jack pipewire-alsa pipewire-pulse pavucontrol mpv flameshot moc > /dev/null

# installing drivers


echo "What type of graphics card you have?"
printf "nvidia, intel, amd (n/i/a) > "
read graphics

case "$graphics" in

    "i") 
    echo "Installing xf86-video-intel..."
    sleep 1
    sudo pacman -S --noconfirm xf86-video-intel > /dev/null
    ;;
    
    "n") 
    echo "The nvidia-open package will be installed"
    sleep 1
    echo "Installing nvidia-open..."
    sleep 1
    sudo pacman -S --noconfirm nvidia-open > /dev/null
    ;;
    
    "a")  
    echo "Installing xf86-video-amdgpu..."
    sleep 1
    sudo pacman -S --noconfirm xf86-video-amdgpu > /dev/null
    ;;
    
    *)
    echo "Skiping driver install..."
    ;;

esac

# installing other packages
echo "Installing other packages..."
sleep 1;
sudo pacman -S --noconfirm neovim firefox nemo zsh file-roller feh picom lxappearance > /dev/null 


# installing AUR
aur=none
printf "yay or paru (y/p/n) > "
read aur

case "$aur" in
    #case 1
    "y") 
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git > /dev/null
    mv yay ~/.yay && cd ~/.yay
    makepkg -si > /dev/null
    ;;
    
    #case 2
    "p") 
    echo "Installing paru..."
    git clone https://aur.archlinux.org/paru.git > /dev/null
    mv paru ~/.paru && cd ~/.paru
    makepkg -si > /dev/null
    ;;
      
    #case 3
    *)  
    echo "Skiping AUR install..."
    sleep 1
    ;;
esac

cd $HOME

mkdir -p $HOME/.local/share/rofi/themes
mkdir -p $HOME/.config
mkdir -p $HOME/.icons
mkdir -p $HOME/.themes
mkdir -p $HOME/.wallpapers

# Coping dotfiles
printf "Coping dotfiles"
cp -r $HOME/dotfiles/dots/config/* $HOME/.config
printf "."
cp -r $HOME/dotfiles/dots/wallpapers/* $HOME/.wallpapers
printf "."
cp -r $HOME/dotfiles/dots/Xresources $HOME/.Xresources
cp -r $HOME/dotfiles/dots/.zshrc $HOME/.zshrc
printf ". \n"
chmod +x $HOME/.zshrc
cp -r $HOME/dotfiles/dots/rofi/* $HOME/.local/share/rofi/themes
echo "Files copied."

sudo mkdir -p /usr/share/fonts/NerdFonts/{JetBrains,FiraCode,UbuntuMono}

# installing fonts (system wide)
echo "Installing fonts..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip > /dev/null 
sudo unzip FiraCode.zip -d /usr/share/fonts/NerdFonts/FiraCode/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/UbuntuMono.zip > /dev/null
sudo unzip UbuntuMono.zip -d /usr/share/fonts/NerdFonts/UbuntuMono/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip > /dev/null
sudo unzip JetBrainsMono.zip -d /usr/share/fonts/NerdFonts/JetBrains/
rm -rf JetBrainsMono.zip FiraCode.zip UbuntuMono.zip
echo "Fonts Installed."

# installing sddm theme
echo "Installing sddm theme..."
git clone https://github.com/gabretana/simplicity-sddm-theme > /dev/null
sudo mv simplicity-sddm-theme/simplicity /usr/share/sddm/themes
rm -rf $HOME/simplicity-sddm-theme
echo "Theme Installed."

packages = "1/2312"
print "Enter any other packages you wish to install >"
if "$packages" != "1/2312"; then
    pacman -S --noconfirm "$packages"
fi

reboot=0
echo 
echo "The installer has finished!"
echo
echo "Remember to add"
echo "[Theme]"
echo "Current=simplicity"
echo "in /usr/lib/sddm/sddm.conf.d/default.conf or /etc/sddm.conf"
echo "and to enable & start sddm.service"
echo "also change your shell to ZSH (chsh)"
echo
printf "Do you want to reboot (y/n) > "
read reboot

case "$reboot" in

    "y") echo "Goodbye";sleep 1;reboot;;

    
    *) echo "Goodbye"

esac
