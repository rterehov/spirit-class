#!/bin/bash

ROLE=$1
DATA=$2
source `which virtualenvwrapper.sh`
workon $ROLE
cd /home/class/projects/$ROLE/current
./manage.py loaddata $DATA