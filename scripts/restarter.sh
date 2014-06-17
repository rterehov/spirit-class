#!/bin/bash

ROLE=$1
BASE='/home/class/projects'
FILE_UWSGI="$BASE/$ROLE/restart.uwsgi"
FILE_CHATS="$BASE/$ROLE/restart.chats"
if [ -f $FILE_UWSGI ]
then
    rm $FILE_UWSGI
    date
    echo "Restart uwsgi $ROLE"
    service uwsgi restart $ROLE
fi

if [ -f $FILE_CHATS ]
then
    rm $FILE_CHATS
    date
    echo "Restart chats $ROLE"
    svc -t /etc/service/$ROLE.tornado.chat.*
fi
