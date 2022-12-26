#!/bin/bash
./mem.sh &
pid=$(echo $!)
echo $pid
> top1.txt
top -b -d 20 -p $pid -n 100 >> top1.txt
kill $pid
