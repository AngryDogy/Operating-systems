
#!/bin/bash

input="4out"
output="5out"

cat $input | awk '
BEGIN {
    curr_ppid = -1
    curr_count = 0
    curr_sum = 0
}
function checkline() {
    if (curr_ppid != proc[4]) {
	if (curr_count > 0) {
	    res = curr_sum / curr_count
	    { print "Average_Running_Children_of_ParentID = " curr_ppid " is " res }
	}
	curr_ppid = proc[4]
	curr_count = 1
	curr_sum = proc[6]
    } else {
	curr_count += 1
	curr_sum += proc[6]
    }
}
{
    split($0,proc,":")
    checkline()
    { print $0 }
}
END {
    
}' > $output

