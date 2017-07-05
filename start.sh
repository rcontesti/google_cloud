#!/bin/sh

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
PORT=8765

#TODO: Theres is an issue with the image I am not allowed to use ubuntu somehow



menu() {
    echo
    echo  "\t\t\tGoogle Cloud Menu\n"
    echo  "\t1. Check Status of resources (recommended)"
    echo  "\t2. Create Resources (Instance(VM), Disk, Address, Firewall)"
    echo  "\t3. Delete Resources"
    echo  "\t4. Connect SSH"
    echo  "\t0. Exit menu\n\n"
    echo  "\t\tEnter option: "

    read option
    echo
    echo "you pick option ${option}"
    echo
}


checkStatus() {
   
   list="disks instances addresses firewall-rules"
   
   for x in $list 
   do  
       echo "${x}:" |tr '/a-z/' '/A-Z/'
       gcloud compute ${x} list
       echo
   done

}

highMemoryInstanceFromZero(){
    #First Reserve an statis IP ADRESS to use during creation
    
    gcloud compute addresses create   $ADRESSNAME --region $REGION
    clear
    gcloud compute addresses describe $ADRESSNAME --region $REGION
    
    
    echo
    echo    
    echo "Copy and paste the adress: 107.910XXXXXX"
    read IPID
    echo $IPID
    
    
    
    gcloud compute instances create $INSTANCE \
    --machine-type n1-highmem-8 \
    --no-boot-disk-auto-delete \
    --zone $ZONE \
    --tags http-server,https-server \
    --address $IPID

    gcloud compute firewall-rules create $FIREWALL --allow tcp:$PORT


}

highMemoryInstanceWithDisk(){
    #First Reserve an statis IP ADRESS to use during creation
    
    
    gcloud compute addresses create   $ADRESSNAME --region $REGION
    clear
    gcloud compute addresses describe $ADRESSNAME --region $REGION
    
    
    echo
    echo    
    echo "Copy and paste the adress: 107.910XXXXXX"
    read IPID
    echo $IPID
    
    
    gcloud compute instances create $INSTANCE \
    --machine-type n1-highmem-8 \
    --zone $ZONE \
    --tags http-server,https-server \
    --address $IPID \
    --disk name=$DISK,boot=yes
    
    gcloud compute firewall-rules $FIREWALL --allow tcp: $PORT
}




createMenu(){
    clear
    echo
    echo  "\t\t\tCreate:\n"
    echo  "\t1. High Memory Instance from zero (No disk created before)"
    echo  "\t2. High Memory Instance with previous disk"
    echo  "\t3. Delete Resources"
    echo  "\t0. Exit menu\n\n"
    echo  "\t\tEnter option: "

    read option
    echo
    echo "you pick option ${option}"
    echo
}

create(){
    clear
    createMenu
    case $option in
    1)
    highMemoryInstanceFromZero ;;
    2)
    highMemoryInstanceWithDisk ;;
    *)
   clear ;;
    esac    
}

deleteMenu(){
    clear
    echo
    echo  "\t\t\tDelete:\n"
    echo  "\t1. Instance, Address, Disk and Firewall"
    echo  "\t2. Instance, Address,"
    echo  "\t3. Instance"
    echo  "\t4. Address, Disk"
    echo  "\t5. Address,"
    echo  "\t6. Disk"
    echo  "\t0. Exit menu\n\n"
    echo  "\t\tEnter option: "

    read option
    echo
    echo "you pick option ${option}"
    echo
}

delete(){
    clear
    deleteMenu
    case $option in
    1)
    gcloud compute addresses delete $ADRESSNAME --region $REGION
    gcloud compute instances delete $INSTANCE --zone $ZONE
    gcloud compute disks delete $DISK --zone $ZONE
    gcloud compute firewall-rules delete $FIREWALL
    ;;
    2)
    gcloud compute addresses delete $ADRESSNAME --region $REGION
    gcloud compute instances delete $INSTANCE --zone $ZONE
    ;;
    3)
    gcloud compute instances delete $INSTANCE --zone $ZONE
    ;;
    4)
    gcloud compute addresses delete $ADRESSNAME --region $REGION
    gcloud compute disks delete $DISK --zone $ZONE
    ;;
    5)
    gcloud compute addresses delete $ADRESSNAME --region $REGION
    ;;
    6)
    gcloud compute disks delete $DISK --zone $ZONE
    ;;
    *)
    clear 
    ;;
   esac    
}


connect(){
gcloud compute ssh $INSTANCE --zone=$ZONE 

}






clear
menu

case $option in
1)
    checkStatus ;;
2)
    create ;;
3)
    delete ;;
4)
    connect;;
*)
   clear ;;
esac

