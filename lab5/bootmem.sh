#!/bin/bash
n=$1
k=$2
echo $n
echo $k
for (( val=0; val<$k; val++ ))
do
    ./newmem.sh $n &
    echo $val
    sleep 1
done