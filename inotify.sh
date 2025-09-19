#!/bin/bash

/usr/bin/inotifywait -e create,move -mrq /tmp/new-files | while read line; do
DIRECTORY=`echo $line | awk '{print $1}'`
FILE=`echo $line | awk '{print $3}'`

PATHFILE=${DIRECTORY}${FILE}

#curl -X POST https://controller.jferre.local/api/v2/job_templates/9/launch/ -H "Content-Type: application/json" -H "Authorization: Bearer uuH7feLbMYRA4Wk1DgiRb7ELaHeNjC" --data "{\"extra_vars\": {\"path_file\": \"$PATHFILE\" } }"
curl --header "Content-Type: application/json" --request POST --data "{\"path_file\": \"$PATHFILE\" }" eda.jferre.local:5001

done
