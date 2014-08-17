#!/bin/bash

ROLE=$1
. /home/class/.virtualenvs/$ROLE/bin/activate
cd /home/class/projects/$ROLE/current
./manage.py send_queued_mail