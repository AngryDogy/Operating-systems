#!/bin/bash
maxSize=$1
i=0
arr=()
while true; do
    for (( val=0; val<10; val++ ))
    do
        arr+=($val)
    done
    let i=$i+1
    size=${#arr[*]}
    if [[ $size -gt $maxSize ]]
    then
        exit
    fi
done