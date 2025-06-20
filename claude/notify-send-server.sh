#!/bin/bash
# ~/notify-server.sh
PORT=45678
while true; do
  nc -l -p $PORT | while read line; do
    notify-send "💌 リモート通知" "$line"
  done
done

