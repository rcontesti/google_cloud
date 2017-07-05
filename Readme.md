Instructions


'''
1) Run a_start to create/delete everything

2)Then after connecting
#sudo apt-get install git
#git clone https://github.com/rcontesti/google_cloud

3)Run b_install (unless disk already exists)

4)Then config

'''
#cd
#jupyter notebook --generate-config
#nano /home/rcontesti/.jupyter/jupyter_notebook_config.py
'''

Add these lines after configurable configuration

c = get_config()
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8765
'''

'''
5)then run
#jupyter-notebook --no-browser --port=8765


'''
