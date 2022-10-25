#!/bin/bash
echo $$ > .pid2
A=0
while true; do
    let A=$A + 1
done