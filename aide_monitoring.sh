#!/bin/bash

aide --check &>/dev/null

if ! grep "Looks okay" /var/log/aide/aide.log &>/dev/null
then
	
   SERVERNAME=`hostname`
   PATHS=`grep '^f++' /var/log/aide/aide.log | awk '{print $2}'| jq -R | jq -s`

   echo $PATHS
   
   #curl --header "Content-Type: application/json" --request POST --data "{\"server\": \"${SERVERNAME}\", \"path_files\": $PATHS }" bastion.jferre.local:5001
   curl --header "Content-Type: application/json" --request POST --data "{\"server\": \"${SERVERNAME}\", \"path_files\": $PATHS }" eda.jferre.local:5001

fi
