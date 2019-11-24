#!/bin/bash
CURRENT_PATH=$(pwd)
mkdir $CURRENT_PATH/headers
mkdir $CURRENT_PATH/responsebody

for x in $(cat $1)
do
        NAME=$(echo $x | awk -F/ '{print $3}')
        curl -X GET -H "X-Forwarded-For: evil.com" $x -I > "$CURRENT_PATH/headers/$NAME"
        curl -s -X GET -H "X-Forwarded-For: evil.com" -L $x > "$CURRENT_PATH/responsebody/$NAME"
done
