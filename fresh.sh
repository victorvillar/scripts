#! /bin/bash

su -c 'apt-get install -y sudo && echo "fenrir    ALL=(ALL:ALL) ALL" >> /etc/sudoers' # sigh...

cd
sudo apt-get update
sudo apt-get install -y make emacs texlive-full python3 unzip aptitude # Programming and misc 
sudo apt-get install -y git zsh terminator terminology guake # Terminal-related

git clone https://github.com/victorvillar/emacs.git # My emacs conf
mv emacs/.emacs.d/ ~ && rm -rf emacs/               # -------------

sudo apt-get install -y thunderbird # Install thunderbird

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
wget http://ftp.es.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u6_amd64.deb -O ssl1.0.deb
sudo dpkg -i ssl1.0.deb
rm ssl1.0.deb
sudo apt-get update
sudo apt-get install -y spotify-client # Spotify

wget https://telegram.org/dl/desktop/linux -O telegram.tar.xz
tar xJf telegram.tar.xz
sudo ln -s ~/telegram/Telegram /usr/bin/telegram # Telegram

echo "alias zshconfig=\"emacs ~/.zshrc\"
alias yes=\"echo Nope\"
alias c=\"clear\"
alias ohmyzsh=\"emacs ~/.oh-my-zsh\"
alias l=\"ls -lah\"
alias p=\"ping 8.8.8.8\"
extract ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.tar.xz)    tar xJf $1   ;;
            *)           echo \"'$1' cannot be extracted via ex()\" ;;
        esac
    else
        echo \"'$1' is not a valid file\"
    fi
}
" | tee -a .zshrc # aliases
sed -i 's/robbyrussell/bira/g' .zshrc # Set bira theme
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" # Install Oh My Zsh
exec zsh
