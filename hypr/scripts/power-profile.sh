#!/bin/bash
CURRENT=$(cat /sys/firmware/acpi/platform_profile 2>/dev/null || echo "balanced")
case "$CURRENT" in
    performance) echo " PERF" ;;
    balanced) echo " BAL" ;;
    low-power) echo " SAVE" ;;
    power-saver) echo " SAVE" ;;
    *) echo " $CURRENT" ;;
esac
