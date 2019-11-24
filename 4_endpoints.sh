#!/bin/bash
#looping through the scriptsresponse directory
CUR_DIR=$(pwd)
mkdir $CUR_DIR/endpoints

for domain in $(ls $CUR_DIR/scriptsresponse)
do
        #looping through files in each domain
        mkdir $CUR_DIR/endpoints/$domain
        for file in $(ls $CUR_DIR/scriptsresponse/$domain)
        do
                ruby /home/venom/tools/relative-url-extractor/extract.rb $CUR_DIR/scriptsresponse/$domain/$file >> $CUR_DIR/endpoints/$domain/$file 
        done
done
