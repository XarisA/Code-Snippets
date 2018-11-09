#!/bin/bash

echo -e "Enter the name of the disk that you want to clear the win shit."
read dir
d1sks=/media/$dir/
echo "I'll clean desktop.ini , Thumbs.db and I'll log it in ClWinshit_log.txt"
find  $d1sks -name desktop.ini -print -exec rm -f {} \;  >> ClWinshit_log.txt ;
find  $d1sks -name Thumbs.db -print -exec rm -f {} \; >> ClWinshit_log.txt

