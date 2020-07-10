## Kali post install script
## Author: Cybathreat
##

## Update, upgrade, levelup....
echo 'Update, upgrade, levelup....'
apt clean && apt update && apt upgrade -y && apt dist-upgrade -y && apt clean -y && apt autoremove
## Install packages:
echo 'Installing needed packages....'
apt install git iptraf arpwatch netdiscover htop nethogs gdebi openssh-server aria2  iftop nethogs htop xrdp xrdp-sesman xorgxrdp tigervnc -y
apt install etherape 

## SSh at boot with key authenticatiopns
echo 'setting up ssh...'
cd /root
echo '''PermitRootLogin YES
LogLevel VERBOSE''' >> /etc/ssh/sshd_config
systemctl start ssh
update-rc.d ssh remove
update-rc.d -f ssh defaults
systemctl restart ssh
systemctl enable sshd.service

##xrdp
systemctl start xrdp
systemctl start xrdp-sesman
systemctl enable xrdp
systemctl enable xrdp-sesman



## Install Oh_my_ZSH
echo 'setting aliases'
cd /root
echo '''alias levelup="apt clean && apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove"
alias getme="aria2c -s 16 -x 16 -V -c" ''' >> .bash_aliases
