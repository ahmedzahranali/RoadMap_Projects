#!/bin/bash

SOURCE="./public/"
DEST_USER="ec2-user"
DEST_HOST="98.84.182.25"
DEST_PATH="/var/www/placeholder-site/"
SSH_KEY="/home/zahran/Downloads/RoadMapSSHProject.pem"

echo "Deploying New Site Code."

rsync -avz --delete -e "ssh -i $SSH_KEY" $SOURCE $DEST_USER@$DEST_HOST:$DEST_PATH

if [ $? -eq 0 ]; then
	echo "Successfully deployeed site http://$DEST_HOST"
else
	echo "Deployment failed, check the connection."
fi
