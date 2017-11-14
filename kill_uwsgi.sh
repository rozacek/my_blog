#!/bin/bash

#for pid in `ps -ef | grep uwsgi | grep -v grep | awk '{print $2}'`
#do
#    echo killing $pid
#    kill -s 9 $pid
#done
killall -SIGKILL uwsgi

