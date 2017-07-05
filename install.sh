#!/bin/sh

#Install from git
#sudo apt-get install git
#git clone https://github.com/rcontesti/google_cloud
#./install1.sh

sudo apt-get install unzip
sudo apt-get install bzip2
mkdir downloads
cd downloads
wget http://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh
bash Anaconda3-4.0.0-Linux-x86_64.sh
cd ..

echo "Need to exit to install"
exit






