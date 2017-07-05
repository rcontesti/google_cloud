# Install
GIT=https://github.com/rcontesti/google_cloud


sudo apt-get install unzip
sudo apt-get install git

git clone $GIT

sudo apt-get update
sudo apt-get install libncurses5-dev
sudo apt-get install python-dev
sudo apt-get install python-pip
sudo apt-get install libjpeg8-dev
sudo ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib
pip install pillow
sudo apt-get build-dep python-imaging
sudo apt-get install libjpeg8 libjpeg62-dev libfreetype6 libfreetype6-dev

sudo pip install virtualenv

#if python 2  
#virtualenv .env                  # Create a virtual environment
#if python 3
virtualenv -p python3 .env

source .env/bin/activate         # Activate the virtual environment
pip install -r requirements.txt  # Install dependencies
deactivate

