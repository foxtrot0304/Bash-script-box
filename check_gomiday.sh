#!/bin/sh

#環境によってはfullpathにすること
source ./gomi.ini

#==============================================
# check date
#
# 金曜日かどうかの判定と、第何金曜日なのかを判定する
# 第1,3金曜日は缶瓶の日。第2,4金曜日は燃えないゴミ、ペットボトルの日
#==============================================

export LANG=C

today=`date +"%d"`
youbi=`date +"%A"`

if [ "${youbi}" = "Friday" ] || [ "${youbi}" = "friday" ]; then
    if [ `expr ${today} / 7` -eq 0 ] || [ `expr ${today} / 7` -eq 2 ]; then
        contents="can & binn trash day!!" 
    elif [ `expr ${today} / 7` -eq 1 ] || [ `expr ${today} / 7` -eq 3 ]; then
        contents="Don't barn & petbottle trash day!!"
    fi    
else
    exit 0
fi

#==============================================
# send message
#==============================================
from="gomi@master"
subject="Today is"
echo $contents | mail -s "$subject" ${mail1}
echo $contents | mail -s "$subject" ${mail2}
if [ $? -eq 1 ]; then
#    echo "send mail failure"
    exit 1
fi
#echo "send mail success"
