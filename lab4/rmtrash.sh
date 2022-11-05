#!/bin/bash
filename=$1
if [[ ! -f $filename ]]
then
    echo "Error: This file doesn't exist in the current directory!"
    exit
fi
if [[ ! -d "/home/angrydog/.trash" ]] 
then
    mkdir /home/angrydog/.trash
fi
if [[ ! -f "/home/angrydog/trash.log" ]]
then
    touch trash.log
fi
if [[ ! -f ".number" ]]
then
    touch .number
    echo "0" >> .number
fi

let linkname=1+$(cat .number |  tail -n1)
echo $linkname >> .number
ln -P $filename "/home/angrydog/.trash/$linkname"
rm $filename
path=$(realpath $filename)
echo "A path to the deleted file: $path ; a name of the created link: $linkname" >> /home/angrydog/trash.log
