#!/bin/bash
echo $$ > .pid
A=1
MODE="sum"
usr1()
{
    MODE="sum"
}
usr2()
{
    MODE="multiply"
}
term()
{
    MODE="Term"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM
while true; do
    case $MODE in
        "sum")
            let A=$A+2
            echo $A
            ;;
        "multiply")
            let A=$A*2
            echo $A
            ;;
        "Term")
            echo "Stopped by SIGTERM"
            exit
            ;;
    esac
    sleep 1
done