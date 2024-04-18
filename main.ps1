function up_and_down {
    $last_shutdown_time = (Get-WinEvent -FilterHashtable @{Logname = 'System'; ID = 1974} -MaxEvents 1 -ErrorAction SilentlyContinue).TimeCreated
    $os_info = GetCimInstance Win32_OperatingSystem
    $boot_time = $os_info.LastBootUpTime
    $down_time = $boot_time - $last_shutdown_time
    $current_time = $os_info.LocalDateTime
    $uptime = $current_time - $boot_time

    "Last Shutdown:`t{0}" -f $last_shutdown_time
    "Boot Time:`t{0}" -f $boot_time
    "Down Time:`t{0}h {1}m {2}s" -f $down_time.Hours, $down_time.Minutes, $down_time.Seconds
    "UpTime:`t{0}h {1}m {2}s" -f $uptime.Hours, $uptime.Minutes, $uptime.Seconds
}

up_and_down
