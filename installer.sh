#!/bin/bash

users=$(ls /home)

#update
sudo apt update
sudo apt upgrade -y

#Downloads and extract debs debs
wget https://github.com/CeroaRAGZ/ubuntusetup/releases/download/v1/debs.tar -O /home/${users}/Downloads/debs.tar
tar -xf /home/${users}/Downloads/debs.tar -C /home/${users}/Downloads

#unpack then run xdm installer
tar -xf /home/${users}/Downloads/xdm-setup-7.2.11.tar.xz -C /home/${users}/Downloads
sudo sh /home/${users}/Downloads/install.sh
rm /home/${users}/Downloads/install.sh
rm /home/${users}/Downloads/readme.txt
sudo rm /home/${users}/Downloads/xdm-setup-7.2.11.tar.xz

#install and erase downloaded debs
sudo apt install /home/${users}/Downloads/lutris_0.5.12_all.deb -y
sudo rm /home/${users}/Downloads/lutris_0.5.12_all.deb
sudo apt install /home/${users}/Downloads/teamviewer_15.38.3_amd64.deb -y
sudo rm /home/${users}/Downloads/teamviewer_15.38.3_amd64.deb
sudo apt install /home/${users}/Downloads/Dopamine-3.0.0-preview.19.deb -y
sudo rm /home/${users}/Downloads/Dopamine-3.0.0-preview.19.deb
sudo apt install /home/${users}/Downloads/ffdec_18.3.5.deb -y
sudo rm /home/${users}/Downloads/ffdec_18.3.5.deb
sudo apt install /home/${users}/Downloads/peazip_9.0.0.LINUX.GTK2-1_amd64.deb -y
sudo rm /home/${users}/Downloads/peazip_9.0.0.LINUX.GTK2-1_amd64.deb
sudo apt install /home/${users}/Downloads/megasync-xUbuntu_22.10_amd64.deb -y
sudo rm /home/${users}/Downloads/megasync-xUbuntu_22.10_amd64.deb
sudo apt install /home/${users}/Downloads/mnautilus-megasync-xUbuntu_22.10_amd64.deb -y
sudo rm /home/${users}/Downloads/mnautilus-megasync-xUbuntu_22.10_amd64.deb
sudo apt install /home/${users}/Downloads/xp-pen.deb -y
sudo rm /home/${users}/Downloads/xp-pen.deb
sudo apt install /home/${users}/Downloads/multimc_1.6-1.deb
sudo rm /home/${users}/Downloads/multimc_1.6-1.deb
sudo apt install /home/${users}/Downloads/cnrdrvcups-ufr2lt-uk_5.00-1_amd64.deb
sudo rm /home/${users}/Downloads/cnrdrvcups-ufr2lt-uk_5.00-1_amd64.deb

#remove shitty xp pen shortcut
sudo rm /etc/xdg/autostart/xppentablet.desktop

#install software from repos
sudo apt install gnome-boxes unrar pavucontrol unzip p7zip-full file-roller gameconqueror gimp goverlay mangohud handbrake krita libreoffice hunspell-hu hyphen-hu obs-studio steam-installer timeshift thunar gnome-tweaks totem vlc mpv winetricks wine flatpak gnome-software-plugin-flatpak git apktool shotcut kdenlive gthumb adb fastboot fish micro mlocate neofetch openjdk-18-jre audacity dconf-editor yt-dlp inkscape blender qbittorrent curl ffmpegthumbnailer keepassxc bleachbit torbrowser-launcher easyeffects -y

#remove kde dogshit and useless software
sudo apt remove kdeconnect gnome-logs remmina -y
sudo apt autoremove -y

#snap install stuff
sudo snap refresh
sudo snap install starship
sudo snap install android-studio --classic

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.raggesilver.BlackBox net.davidotek.pupgui2 org.nickvision.tagger com.mattjakeman.ExtensionManager com.discordapp.Discord com.spotify.Client -y

mkdir /home/${users}/.icons
sudo chown ${users} /home/${users}/.icons

#change shell and set up fish
#wget https://github.com/CeroaRAGZ/cool-starship-preset/blob/main/my_aliases_config.fish -O /home/${users}/.config/fish/config.fish
#wget https://github.com/CeroaRAGZ/cool-starship-preset/blob/main/starship.toml -O /home/${users}/.config/starship.toml
#chsh -s /usr/bin/fish ${users}

#sudo chown ${users} /home/${users}/.config/starship.toml
#sudo chown ${users} /home/${users}/.config/fish/config.fish