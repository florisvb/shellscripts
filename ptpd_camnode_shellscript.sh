# check NTP is NOT running
#ntpq -p
# There should be some output here indicating at least one NTP server with some offset and jitter.
# (If there is an error or no servers are listed, see below.) (Also of interest is the output
#  of "ntpdc -c kern").

# Run PTPd and disable frequency scaling:
# (The options below mean: identifier NTP, stratum 2, do not adjust system clock.)
#sudo -s -H
echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
killall ptpd
nice -n -19 ptpd -b eth1
echo "ptpd running"
