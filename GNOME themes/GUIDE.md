# Themes for GNOME - currently version 46

## Yaru

It is special theme customized to change log in screen, making it more similar to GNOME 45 (transparent user selector). For it to change install `gdm-settings` and `libglib2.0-dev`.
```sh
sudo apt install gdm-settings libglib2.0-dev
```

Currently:
 - **gnome-shell.css.old** is just orginal theme from Ubuntu 24.04 LTS
 - **gnome-shell.css** is modified theme for Ubuntu 24.04 LTS

## Yaru-prussiangreen

It is custom theme for daily use that offers less saturated quick settings toggles.

Currently:
 - **gnome-shell.css.old** is modified theme from Ubuntu 23.10
 - **gnome-shell.css** is modified theme for Ubuntu 24.04 LTS

## Classes that were modified:
 - In Yaru:
   - **.login-dialog-user-list-view** (class for main login screen and user selection)
   - **.login-dialog-not-listed-button** (class to change "Not listed?" button)
 - In Yaru-prussiangreen:
