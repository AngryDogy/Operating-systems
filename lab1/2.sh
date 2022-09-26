#!/bin/bash
output=""
stop="q"
input=""
read input
while [[ $input != $stop ]]
do
output="$output $input"
read input
done
echo $output

