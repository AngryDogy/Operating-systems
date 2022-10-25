#!/bin/bash
pid1=$(cat .pid1)
cpulimit -l 10 -p $pid1 &