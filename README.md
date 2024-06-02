# showcron
show schedule jobs in debian

In a team setting, the use of scheduled tasks on Linux should be standardized. For example, all scheduled tasks should be written in /etc/cron.d. If some people write in /etc/crontab and others write in their own account under /var/spool/cron/crontabs/, it can lead to confusion, such as modifying the wrong scheduled tasks or tasks running multiple times. IT is not just a technical issue; once it reaches a certain scale, it also becomes a management issue.

The showcron.sh script helps us quickly list the details of commonly used scheduled tasks on Debian systems. By comparing it with the scheduling status of a clean system, we can review and manage scheduled tasks effectively.

# check list
- /etc/crontab
- /etc/anacrontab
- /etc/cron.d/*
- /etc//etc/cron.hourly 
- /etc//etc/cron.daily 
- /etc//etc/cron.weekly 
- /etc//etc/cron.monthly 
- /etc//etc/cron.yearly
- atq
- systemctl list-timers
- /var/spool/cron/crontabs/
