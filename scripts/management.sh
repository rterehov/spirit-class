#!/bin/bash

ROLE=$1
COMMAND=$2
. /home/class/.virtualenvs/$ROLE/bin/activate
cd /home/class/projects/$ROLE/current

if [ "$ROLE" == "dev.class" ];
then
echo "RUN DEV MANAGEMENT COMMAND: $COMMAND"
elif [ "$ROLE" == "st.class" ];
then
echo "RUN ST MANAGEMENT COMMAND: $COMMAND"
fi
./manage.py $COMMAND