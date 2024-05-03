function ba --wraps='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to full|percentage"' --description 'alias ba=upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to full|percentage"'
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to full|percentage" $argv
        
end
