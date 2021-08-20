#!/bin/bash -xe

clear_bluetooth_devices() {
    printf "clearing bluetooth devices ....\n"
    sudo rm -f /Library/Preferences/com.apple.Bluetooth.plist
    sudo rm -f /Users/"$(whoami)"/Library/Preferences/ByHost/com.apple.Bluetooth.*.plist
    sudo shutdown -r now
}

clear_bluetooth_devices "$@"
