#!/bin/bash

code=${1}
year=`date +%Y`
month=`date +%m`
#day=`date +%d`
day=23
tmp=tmpfile.txt

if [ ${#} -lt 1 ] ; then
    echo "there is no argument"
    exit 1
fi

wget "http://info.finance.yahoo.co.jp/history/?code=${code}.T&sy=${year}&sm=${month}&sd=${day}&ey=${year}&em=${month}&ed=${day}&tm=d" -o dummy

grep -A 1 "調整後終値\*" ./index.html* > $tmp

awk "NR==2 {print}" ./tmpfile.txt | awk -F '[<>]' '{print $7,$11,$15,$19,$23}'

rm -f index*
rm -f dummy
