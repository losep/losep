#!/bin/sh
sleep 10
while true ; do
    echo 0 widget_tell mystatusbar clock text `date +'%H:%M:%S'`
    echo ""
    sleep 1
done 

