#/bin/bash

logFile=/tmp/clean_registry.log

echo $(date) > $logFile
/cron/registry garbage-collect -m /etc/docker/registry/gc.yaml >> $logFile