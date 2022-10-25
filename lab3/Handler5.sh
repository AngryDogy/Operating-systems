#!/bin/bash
let var="1"
mode="sum"
(tail -f pipe) |
while true; do
    read LINE;
    if [[ $LINE == "QUIT" ]]
    then
        echo "exit"
        killall tail
        exit
    fi
    if [[ $LINE == "+" ]] 
    then
        mode="sum"
        continue
    fi
    if [[ $LINE == "x" ]]
    then
        mode="multiply"
        continue
    fi
    if [[ $LINE =~ ^[0-9]+$ ]]
    then
        if [[ $mode == "sum" ]]
        then
            let var="$var + $LINE"
        else
            let var="$var * $LINE"
        fi
    else
        echo "wrong input"
        killall tail
        exit
    fi
    echo $var
done