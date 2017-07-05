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

jupyter notebook --generate-config


'''
Add these lines after configurable configuration

c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8765
'''

'''
then run
jupyter-notebook --no-browser --port= 8765





