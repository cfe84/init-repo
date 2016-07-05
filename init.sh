#!/bin/bash

REPO=$1

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

cp src/*.sh $REPO/

FILES="package.json.template version.txt .gitignore"

for FILE in $FILES; do
    [ ! -s $REPO/$FILE ] && cp bin/$FILE $REPO/$FILE
done
