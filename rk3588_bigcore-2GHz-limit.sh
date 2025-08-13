#!/usr/local/bin/bash
#
# for RK3588 SoC BigCore limitter
#
# Big.Core cpu4-7
# Cortex-A76 @ 2.2-2.4 GHz
#
# little.Core cpu 0-3
# Cortex-A55 @ 1.8 GHz
#

for c in 4 5 6 7; do
  echo 2000000 | sudo tee /sys/devices/system/cpu/cpu$c/cpufreq/scaling_max_freq
done


exit 0
