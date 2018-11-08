# Deploy Scipts
#
# Chi Charles Xu (xuchi.int@gmail.com)
#


# Initiate a cloud instance
# Some settings
# modify /etc/ssh/sshd_config on Password Authentication

# Add user and modify password
# sudo adduser cloud
# sudo passwd


# Populating disk space
# install "cloud-guest-utils" if it is not installed already
sudo apt install cloud-guest-utils

# resize partition
sudo growpart /dev/xvda 1
# resize filesystem
sudo resize2fs /dev/xvda1


#update
sudo apt update

#install
sudo apt install git python-pip


#install docker-ce
#https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable edge"

sudo apt-get update

sudo apt-get install docker-ce

#install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


#configure git
git config --global user.email "you@example.com"
git config --global user.name "name"

#git clone
git clone https://github.com/charlesxuuu/WebODM.git

#update
git pull https://github.com/OpenDroneMap/WebODM.git

sudo bash webodm.sh update
sudo bash webodm.sh start


#devenv
sudo bash devenv.sh down
sudo bash devenv.sh start