#!/usr/bin/env bash
weather=$(curl wttr.in/Santiago,%20Chile?format='%c%t')
[ ${#weather} -gt 10 ] && exit 1
[ -z "$weather" ] && exit 1
echo " $weather "

