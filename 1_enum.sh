##!/bin/bash
#starting sublist3r
CUR_DIR=$(pwd)
sublist3r -d $1 -v -o $CUR_DIR/domains.txt
#running assetfinder
assetfinder --subs-only $1 | tee -a $CUR_DIR/domains.txt
#removing duplicate entries
sort -u domains.txt -o $CUR_DIR/domains.txt
#checking for alive domains
echo "\n\n[+] Checking for alive domains..\n"
cat domains.txt | httprobe | tee -a $CUR_DIR/alive.txt
#formatting the data to json
cat $CUR_DIR/alive.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > $CUR_DIR/alive.json
cat $CUR_DIR/domains.txt | python -c "import sys; import json; print (json.dumps({'domains':list(sys.stdin)}))" > $CUR_DIR/domains.json
