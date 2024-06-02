#!/bin/bash

echoheader() {
  echo -e "\n$1\n---"
}

lsfolder() {
  find $1 -type f | xargs ls -al
}

#show detail for cronjobs
for i in /etc/crontab /etc/anacrontab /etc/cron.d/*
do
  echoheader "${i}"
  cat "${i}" | grep -Ev '^#|^$'
done

#show script name in cron.hourly and so on
for i in hourly daily weekly monthly yearly
do
  echoheader  "/etc/cron.${i}/"
  lsfolder "/etc/cron.${i}/"
done

#show at jobs
echoheader "atq"
test -x /usr/bin/atq && atq || echo "atq: command not found"

#show systemd timer
echoheader "systemd timer"
systemctl list-timers

#show user's cronjobs
echoheader "user cronjob (need sudo pd)"
sudo find /var/spool/cron/crontabs/ -maxdepth 1 -type f | xargs sudo grep -H -Ev '^#|^$'
