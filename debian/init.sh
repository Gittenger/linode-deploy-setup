apt update
apt -y upgrade
apt -y install git plocate tree neofetch keychain
apt -y install psmisc build-essential xz-utils libglib2.0-dev libncurses5-dev libncursesw5-dev libslang2 libslang2-dev libglib2.0-dev

###
# Install Midnight Commander
###
cd /opt
wget -c http://ftp.midnight-commander.org/mc-4.8.30.tar.bz2 -O - | tar -xjvf -
cd /opt/mc-4.8.30 && \
 ./configure && \
 make && \
 make install
cd /

useradd -m john
usermod --append -G sudo -s /bin/bash john
echo "john:password" | chpasswd

apt install -y zsh
chsh -s $(which zsh) john