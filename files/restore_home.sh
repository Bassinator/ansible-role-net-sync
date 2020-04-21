#!/bin/bash

unison home_sync -root /home/pi -root ssh://syncuser@epicraspberries.ddns.net//mnt/usb/$(hostname) -force ssh://syncuser@epicraspberries.ddns.net//mnt/usb/$(hostname)
