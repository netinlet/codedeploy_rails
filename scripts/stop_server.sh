#!/bin/bash -ex


if pgrep -u ec2-user supervisord > /dev/null; then

  SUPERVISORD_PID=$(pgrep -u ec2-user supervisord)

  COUNTER=0

  kill -SIGTERM $SUPERVISORD_PID

  while [[ ( -d /proc/$SUPERVISORD_PID ) && ( -z `grep zombie /proc/$SUPERVISORD_PID/status` ) && ( $COUNTER -lt 15 ) ]]; do
    let COUNTER=COUNTER+1
    echo [$COUNTER] Waiting for supervisord to complete...
    sleep 1
  done

  if pgrep -u ec2-user supervisord > /dev/null; then
    echo Force Killing SUPERVISORD
    kill -KILL $SUPERVISORD_PID
  fi

fi
