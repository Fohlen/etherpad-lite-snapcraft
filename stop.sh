#!/bin/sh
NAME=etherpad-lite

stop() {
  echo "Stopping etherpad-lite... "
  if test -f /var/run/$NAME.pid; then
    while test -d /proc/$(cat /var/run/$NAME.pid); do
      killtree $(cat /var/run/$NAME.pid) 15
      sleep 0.5
    done
    rm /var/run/$NAME.pid
  fi
  echo "done"
}
