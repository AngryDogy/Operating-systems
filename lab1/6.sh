#!/bin/bash
path="/var/log/Xorg.0.log"
file="full.log"
awk '$3 == "(WW)" {print}' $path > $file
awk '$3 == "(II)" {print}' $path >> $file
sed -i -e 's/(WW)/(WARNING)/; s/(II)/(INFORMATION)/' $file
