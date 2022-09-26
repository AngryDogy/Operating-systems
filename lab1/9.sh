#!/bin/bash
#file=$(find "/var/log" -iname "log")
#echo $file
file=$(find "/var/log" -maxdepth 1  -iname "*log")
sudo cat $file | wc -l
