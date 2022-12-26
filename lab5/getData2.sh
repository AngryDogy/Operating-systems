#!/bin/bash
./mem2.sh &
pid=$(echo $!)
echo $pid
> top2.txt
top -b -d 20 -p $pid -n 100 >> top2.txt
kill $pid
