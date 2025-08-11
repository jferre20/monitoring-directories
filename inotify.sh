#!/bin/bash

/usr/bin/inotifywait -e create,move -mrq /tmp/new-files | while read line; do
DIRECTORY=`echo $line | /usr/bin/awk '{print $1}'`
FILENAME=`echo $line | /usr/bin/awk '{print $3}'`

PATH_FILE="${DIRECTORY}${FILENAME}"

curl -X POST https://controller.jferre.local/api/v2/job_templates/9/launch/ -H "Authorization: Bearer YOUR_TOKEN_HERE" --data "{\"extra_vars\": {\"path_file\": $PATH_FILE } }"

done
