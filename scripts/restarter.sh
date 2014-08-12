#!/bin/bash

ROLE=$1
BASE='/home/class/projects'
FILE_UWSGI="$BASE/$ROLE/restart.uwsgi"
if [ -f $FILE_UWSGI ]
then
    rm $FILE_UWSGI
    date
    echo "Restart uwsgi $ROLE"
    service uwsgi restart $ROLE
fi