#!/bin/bash
gcloud dataproc clusters create datascience \
--master-machine-type n1-standard-2 \
--worker-machine-type n1-standard-2 \
--zone us-east1-b \
--initialization-actions \
gs://dataproc-initialization-actions/jupyter/jupyter.sh

#Conectar el SSH
gcloud compute ssh --zone=us-east1-b \
--ssh-flag="-D 1080" --ssh-flag="-N" --ssh-flag="-n" datascience-m
#If fails add permission with chmod u+x name


gcloud compute ssh --zone=us-east1-b \
  --ssh-flag="-D" --ssh-flag="10000" --ssh-flag="-N" --ssh-flag="-n" "datascience-m" &

#Configure browser
/usr/bin/google-chrome \
    "http://datascience-m:8123" \
    --proxy-server="socks5://localhost:10000" \
    --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost" \
    --user-data-dir=/tmp/





