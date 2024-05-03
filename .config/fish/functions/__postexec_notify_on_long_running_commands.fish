function __postexec_notify_on_long_running_commands --on-event fish_postexec
    set --function interactive_commands 'nvim'
    set --function command (string split ' ' $argv[1])
    if contains $command $interactive_commands
        # We quit interactive commands manually,
        # no need for a notification.
        return
    end

    if test $CMD_DURATION -gt 5000
        notify-send -i ~/Pictures/kitty_icon.png 'Command Completed' "$argv"
    end
end
