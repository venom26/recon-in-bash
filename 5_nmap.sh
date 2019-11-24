#!/bin/bash
CUR_DIR=$(pwd)
mkdir $CUR_DIR/nmapscans
for domain in $(cat $1)
do
        nmap -sC -sV $domain | tee $CUR_DIR/nmapscans/$domain
done
