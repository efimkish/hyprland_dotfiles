#!/bin/bash
case "$(powerprofilesctl get)" in
  performance) echo " PERF" ;;
  balanced) echo " BAL" ;;
  power-saver) echo " SAVE" ;;
esac
