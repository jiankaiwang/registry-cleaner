#!/bin/bash

cd /cron
chmod 0600 crons

crontab -u root crons

cron -f