#!/bin/bash

REPO=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! $REPO ]; then
    echo "Usage: init.sh REPONAME"
    exit 1
fi

echo "Creating directories"

DIRECTORIES="bin test src"

for DIRECTORY in $DIRECTORIES; do
    [ ! -d $REPO/$DIRECTORY ] && mkdir $REPO/$DIRECTORY
done

echo "Copying files"

cp $DIR/src/*.sh $REPO/

FILES="package.json.template version.txt .gitignore"

for FILE in $FILES; do
    [ ! -s $REPO/$FILE ] && cp $DIR/src/$FILE $REPO/$FILE
done
