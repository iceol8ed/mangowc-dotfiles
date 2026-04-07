#!/bin/sh

# Replicated Autostart for MangoWM

# Environment setup
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=mango
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY

# Polkit agent
/usr/lib/polkit-kde-authentication-agent-1 &

# Wallpaper
swaybg -i ~/.config/bg.jpg -m fill &

# Daemons
autotiling-rs &
ydotoold &
wl-clip-persist --clipboard regular &
wl-paste --watch cliphist store &

# Appearance Settings
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Cursor Theme & Size (Sway settings translated to environment for Mango)
# Replaces: seat seat0 xcursor_theme Bibata-Modern-Classic 20
export XCURSOR_THEME=Bibata-Modern-Classic
export XCURSOR_SIZE=20
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
gsettings set org.gnome.desktop.interface cursor-size 20
