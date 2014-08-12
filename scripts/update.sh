#!/bin/bash

echo "Start"
date
ROLE=$1
BRANCH=$2
COLLECTSTATIC=$3
BASE='/home/class/projects'
RESTART_DIR="$BASE/$ROLE"
STOP_FILE="$RESTART_DIR/.stop.file"

if [ -f $STOP_FILE ]; then
    echo 'Stop file detected, exit...'
    exit
fi

DIR="$BASE/$ROLE/current"
echo cd $DIR
cd $DIR
source `which virtualenvwrapper.sh`
echo workon $ROLE
workon $ROLE
REMOTE=`git ls-remote origin -h refs/heads/$BRANCH | awk '{ print $1 }'`
LOCAL=`git log --name-status HEAD^..HEAD | head -n1 | awk '{ print $2 }'`

echo "Compare: $REMOTE vs $LOCAL"
if ! [ $REMOTE == $LOCAL ]; then
echo "Try to change branch to $BRANCH"
git checkout $BRANCH
echo "Compare again: $REMOTE vs $LOCAL"
REMOTE=`git ls-remote origin -h refs/heads/$BRANCH | awk '{ print $1 }'`
LOCAL=`git log --name-status HEAD^..HEAD | head -n1 | awk '{ print $2 }'`
echo "Compare: $REMOTE vs $LOCAL"
fi

if ! [ $REMOTE == $LOCAL ]; then
echo 'Start update...' 
git pull
make _dev_requirements
if [ $COLLECTSTATIC ]; then
    make db
    make collectstatic
    make compress
fi
echo "Restart uwsgi servers for $DIR"
echo "touch $RESTART_DIR/restart.uwsgi"
touch "$RESTART_DIR/restart.uwsgi"
echo "touch $RESTART_DIR/restart.chats"
touch "$RESTART_DIR/restart.chats"
date
echo 'Done'
fi
