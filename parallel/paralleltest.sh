#!/bin/bash
 
time=`date +%Y%m%d`
#    out1=`dig @8.8.8.8 ${list} a +short`
 
for list in `cat ./domain.list`
do
#    out1=`echo "${list}" | xargs -P 10 -L 1 -I % dig @8.8.8.8 % a +short`
#    if [ ${#out1} -gt 0 ]
#    then
#        echo "${list} is ${out1}" >> ./check_results_${list}_$time
#    fi
echo "${list}" | xargs -P 10 -L 1 -I % dig @8.8.8.8 % a +short
done
