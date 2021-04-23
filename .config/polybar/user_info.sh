#!/bin/sh

host="$( cat /proc/sys/kernel/hostname )"

echo $USER@$host
