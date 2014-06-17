#!/bin/bash

echo "Start update-develop.sh"
date

ROLE=$1
cd /home/class/projects/$ROLE/current
. `which virtualenvwrapper.sh`
workon $ROLE

REMOTE=`git ls-remote origin -h refs/heads/develop | awk '{ print $1 }'`
LOCAL=`git log --name-status HEAD^..HEAD | head -n1 | awk '{ print $2 }'`

echo "Compare: $REMOTE vs $LOCAL"
if ! [ $REMOTE == $LOCAL ]; then
echo "Start update..."
git checkout develop
git pull
echo "Ok"
echo "Start make..."
make dev.class
make db
echo "Ok"
echo "Restart server..."
touch restart.uwsgi
echo "Ok"
fi
date
echo "End update.sh"

# python manage.py collectstatic --noinput -l
