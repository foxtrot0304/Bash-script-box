#!/bin/sh

source ./gomi.ini

#==============================================
# send mail
#==============================================
from="gomi@master"
subject="Today is"
contents="can & bottle trash day!!"
echo $contents | mail -s "$subject" ${mail1}
echo $contents | mail -s "$subject" ${mail2}
if [ $? -eq 1 ]; then
echo "send mail failure"
exit 1
fi
echo "send mail success"
