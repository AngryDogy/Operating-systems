#!/bin/bash
mail="[a-zA-Z0-9_.]+@[a-zA-Z0-9_]+(\\.[a-zA-Z]+)+"
grep -E -h -s -o -w $mail /etc/* | awk '{print $1","}' > emails.lst