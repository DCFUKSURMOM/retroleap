#!/bin/sh

# LF1000 doesn't have this file and uses kernel-side power management.
if [[ -f /sys/devices/platform/lf2000-power/shutdown ]]; then
    while `true`
    do
      if [ "`cat /sys/devices/platform/lf2000-power/shutdown`" -eq "1" ]; then
        logger -s "Starting user-requested shutdown!"
        sync
        poweroff
        # If we trigger poweroff, we're done.
        exit
      fi
      # Only check every second or so to avoid unnecessary system load.
      sleep 1
    done
fi