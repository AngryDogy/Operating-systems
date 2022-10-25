#!/bin/bash
mkdir "test" && (touch "report" ; echo "catalog test was created successfully" >> "report" ; touch "test/$(date)")
ping "www.net_nikogo.ru" || (touch "report" ; echo "($(date)  www.net_nikogo.ru is unreachable" >> "report") 