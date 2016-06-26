#!/bin/bash

# By T.c 2016.03
#
# Script for fs auto retsart

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

# Variable
fs_path='/fs'
fs_bin='fs.jar'
timestamp_path='/tmp/fs_restart_timestamp'
# debug_file='/root/fs_restart_debug'
min_time=60 #min
max_time=230 #min
# 

# Main
if [ -f $timestamp_path ]
then
    last_restart_time=`cat $timestamp_path`
    take_time=$[ $[ `date +%s` - $last_restart_time ] / 60 ]
else
    date +%s > $timestamp_path
    exit 0
fi

if [ $take_time -lt $min_time ]
then
#   echo "[`date`]  less then $min_time min exit" >> $debug_file
    exit 0
fi

if [ $take_time -gt $max_time ]
then
    ${fs_path}/restart.sh &> /dev/null
    date +%s > $timestamp_path
#   echo "[`date`]  over $max_time min autorestart" >> $debug_file
    exit 0
fi

fs_pid=`ps aux | grep $fs_bin | grep -v grep | gawk '{print $2}'`
netstat -tunp | grep $fs_pid &> /dev/null
resault=`echo $?`
# echo "[`date`]  test resault is $resault" >> $debug_file

if [ $resault -eq 1 ]
then
    ${fs_path}/restart.sh &> /dev/null
    date +%s > $timestamp_path
#   echo "[`date`]  no one use autorestart" >> $debug_file
fi

exit 0

