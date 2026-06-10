#!/bin/bash

i3-nagbar -t warning -m 'Power menu' \
    -B 'Shutdown'  'systemctl poweroff' \
    -B 'Reboot'    'systemctl reboot' \
    -B 'Suspend'   'systemctl suspend' \
    -B 'Logout'    'i3-msg exit'
