#!/bin/bash
group=$1
kafkaHost=$2
kafkaPort=$3
telegrafHost=$4
telegrafPort=$5
echo Fetching metrics for the ${group} group from ${kafkaHost}:${kafkaPort} and pushing the metrics to ${telegrafHost}:${telegrafPort}
while true
do
    kafka-consumer-groups.sh --bootstrap-server ${kafkaHost}:${kafkaPort} --group ${group} --describe 2> /dev/null \
         | tail -n +3 \
         | awk -v GROUP=${group} '{print "kafka_group_lag,group="GROUP",topic="$1",partition="$2",host="$7" current_offset="$3"i,log_end_offset="$4"i,lag="$5"i"}' \
         | nc ${telegrafHost} ${telegrafPort}
         echo Sleeping for 10s
         sleep 10s
done