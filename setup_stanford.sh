#!/bin/bash

echo "Please choose an option"
read -p "What is your name? " name 

#Instance Params
PROJECT="cbp100"
#data-science1
INSTANCE="high-memory-instance"
ZONE="us-east1-d"
GIT="https://github.com/rcontesti/google_cloud"
ADRESSNAME="notebook"
REGION="us-east1"
FIREWALL="notebook-rules"
DISK="high-memory-instance"
IMAGE="ubuntu-1604-xenial-v20170619a"


#If project not created
#TODO:Add an if
#gcloud projects create $PROJECT
'''
#First Reserve an statis IP ADRESS to use during creation
#gcloud compute addresses create $ADRESSNAME --region $REGION
gcloud compute addresses describe $ADRESSNAME --region $REGION
echo "Copy and paste the adress: 107.910XXXXXX"
read IPID
echo $IPID

#Create Instance(If disk Already Exist)

gcloud compute instances create $INSTANCE \
--machine-type n1-highmem-8 \
--zone $ZONE \
--tags http-server,https-server \
--address $IPID \
--disk name=$DISK,boot=yes
'''
#Create Instance(If disk does not exist)
#gcloud compute instances create $INSTANCE \
#--machine-type n1-highmem-8 \
#--zone $ZONE \
#--image $IMAGE  
#--no-boot-disk-auto-delete \
#--tags http-server,https-server \
#--address $IPID

#Connect
echo "-----------------------ACA SE CONECTA----------------"
gcloud compute ssh --zone=$ZONE $INSTANCE

#Create Firewall rule 

gcloud compute firewall-rules create $FIREWALL --allow tcp:7000



#gcloud compute addresses delete $ADRESSNAME --region us-east1
#gcloud compute instances delete $INSTANCE
#gcloud compute disks delete $INSTANCE

