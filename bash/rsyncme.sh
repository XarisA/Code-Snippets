#! /bin/bash
# My simple rsync script



echo -e "Enter the directory that you want to back up"
read dir

echo "I 'll Back It up in the Data disk"

#SOURCEDIR=/media/868ABEC68ABEB253/Users/Admin/$dir

SOURCEDIR=/media/Multimedia/$dir
DESTDIR=/media/Data/

rsync -avrh --exclude="*.bak" $SOURCEDIR $DESTDIR

#chmod u=rwx,g=rx,o=rx script.sh
