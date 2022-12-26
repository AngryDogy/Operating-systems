#!/bin/bash
memory="onlyMemory.txt"
pid="onlyPID.txt"
swap="onlySwap.txt"
arrMemory=()
arrPid=()
arrSwap=()
data=$(cat $memory)
echo $data
