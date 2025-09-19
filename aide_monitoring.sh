#!/bin/bash

aide --check &>/dev/null

if ! grep "Looks okay" /var/log/aide/aide.log &>/dev/null
then

   SERVERNAME=`hostname`
   PATHS=`grep '^f++' /var/log/aide/aide.log | awk '{print $2}'| jq -R | jq -s`

   #curl --header "Content-Type: application/json" --request POST --data "{\"server\": \"${SERVERNAME}\", \"path_files\": $PATHS }" eda.jferre.local:5001
   curl -X POST https://controller.jferre.local/api/v2/job_templates/9/launch/ -H "Content-Type: application/json" -H "Authorization: Bearer uuH7feLbMYRA4Wk1DgiRb7ELaHeNjC" --data "{\"extra_vars\": {\"path_file\": $PATHS } }"

fi
