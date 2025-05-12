#!/bin/bash
sudo apt update
clear
echo "Welcome to $(hostname)"
echo "Distribution: $(lsb_release -si)"
echo "Version: $(lsb_release -sr)"
echo "Uptime: $(uptime -p)"
echo "Current Time: $(date)"
# Fetch weather information for Monterrey, Nuevo Leon
WEATHER_DATA=$(curl -s "wttr.in/Monterrey?format=3")
if [ $? -eq 0 ]; then
  echo "Weather in Monterrey, Nuevo Leon:"
  echo "$WEATHER_DATA" | awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9}'
else
  echo "Weather: Unable to fetch weather information for Monterrey, Nuevo Leon."
fi
# Check if reboot is required
if [ -f /usr/lib/update-notifier/reboot-required ]; then
  echo "Reboot Required: Yes"
else
  echo "Reboot Required: No"
fi
echo "System Information:"
screenfetch
