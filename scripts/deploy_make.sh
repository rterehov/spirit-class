#!/bin/bash

echo "Start deploy_make.sh"
VIRTENV=$1
TASK=$2
. /usr/local/bin/virtualenvwrapper.sh
if workon | grep -q $VIRTENV
then
  echo "Virtualenv $VIRTENV already exists..."
else
  echo "Virtualenv $VIRTENV not exists. Create..."
  mkvirtualenv $VIRTENV
fi
workon $VIRTENV
task=$VIRTENV
if [ $TASK ]
then
task=$TASK
fi
echo make $task
make $task