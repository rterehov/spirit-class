#!/bin/bash

ROLE=$1
source `which virtualenvwrapper.sh`
workon $ROLE
cd /home/class/projects/$ROLE/current
./manage.py send_queued_mail