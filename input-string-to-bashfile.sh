#!/bin/bash
#
# input-string-to-bashfile.sh
#
# https://codechacha.com/ja/shell-script-loop/
#

OUTPUTFILE='outputfile.txt'
# echo "" > $OUTPUTFILE
# echo " PS1=[" >> $OUTPUTFILE
rm -f $OUTPUTFILE
touch $OUTPUTFILE

#--------------------------
# Build a basic file.
#--------------------------
a=0
while [ "$a" -lt 5 ]
do
    a=$(expr $a + 1)
    echo $a >> $OUTPUTFILE
done

# seq 1 5 > $OUTPUTFILE

#---------------------------
# Delete lines 2 and 5
#---------------------------
# cat $OUTPUTFILE | tee tmp.txt | grep -v -e 2 -e 5 > $OUTPUTFILE 
cat $OUTPUTFILE | (rm $OUTPUTFILE; grep -v -e 2 -e 5 > $OUTPUTFILE)

#         PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
TMP=" \ \ PS1=\'\$\{debian_chroot:+\(\$debian_chroot\)}\\\[\033[01\;32m\\\]\\\u@\\\h\\\[033[00m"
sed -i -e "2i $TMP" $OUTPUTFILE
# sed -i -e "3i h" $OUTPUTFILE
# sed -i -e "3a haa" $OUTPUTFILE
# sed -i -e "4i hogehoge" $OUTPUTFILE

cat $OUTPUTFILE