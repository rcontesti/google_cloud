Instructions


<<<<<<< HEAD
En total se tarda entre 5 y 10 min

1) Run start>create
2) Run start>connect

=======
1) Run [a_start] to create/delete everything
>>>>>>> e8a0eaf320b04a98e4b37632dfd8fb0dbc3d9971

3)Then after connecting
#sudo apt-get install git
#git clone https://github.com/rcontesti/google_cloud
#cd google_cloud
#chmod 777 install.sh
4) Run start>install
5) Run start>connect
5) Run start>config and add those lines

<<<<<<< HEAD
=======
3)Run b_install (unless disk already exists)

4)Then config

#cd
#jupyter notebook --generate-config
#nano /home/rcontesti/.jupyter/jupyter_notebook_config.py
'''
>>>>>>> e8a0eaf320b04a98e4b37632dfd8fb0dbc3d9971

Add these lines after configurable configuration

'''
c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8765
'''
6) Run start>config
7)then run start>jup




