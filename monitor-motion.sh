#!/bin/sh

if ! curl --head -s http://cubie:8081 | head -1 | grep "200 OK" > /dev/null; then
  # motion not active
  disk=$(mount|grep "/media/disk-20g")
  if [ -z "$disk" ]; then
    sudo mount -L disk-20g /media/disk-20g
  fi

  sudo /media/disk-20g/archive-motion

  sudo service motion restart
fi
