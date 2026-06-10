#!/bin/bash

prev_user=0 prev_nice=0 prev_system=0 prev_idle=0
prev_iowait=0 prev_irq=0 prev_softirq=0 prev_steal=0

while true; do
    # CPU usage delta between samples
    read -r _ user nice system idle iowait irq softirq steal _ < /proc/stat
    dt_used=$(( (user+nice+system+irq+softirq+steal) \
              - (prev_user+prev_nice+prev_system+prev_irq+prev_softirq+prev_steal) ))
    dt_idle=$(( idle+iowait - prev_idle - prev_iowait ))
    dt_total=$(( dt_used + dt_idle ))
    cpu=$(( dt_total > 0 ? dt_used * 100 / dt_total : 0 ))
    prev_user=$user; prev_nice=$nice; prev_system=$system; prev_idle=$idle
    prev_iowait=$iowait; prev_irq=$irq; prev_softirq=$softirq; prev_steal=$steal

    # Memory
    mem_total_kb=$(grep -m1 '^MemTotal:' /proc/meminfo); mem_total_kb=${mem_total_kb//[^0-9]/}
    mem_avail_kb=$(grep -m1 '^MemAvailable:' /proc/meminfo); mem_avail_kb=${mem_avail_kb//[^0-9]/}
    mem_used_mb=$(( (mem_total_kb - mem_avail_kb) / 1024 ))
    mem_total_mb=$(( mem_total_kb / 1024 ))

    date_str=$(date '+%a %d %b  %H:%M:%S')
    echo " CPU ${cpu}%   RAM ${mem_used_mb}/${mem_total_mb}M   ${date_str}"
    sleep 1
done
