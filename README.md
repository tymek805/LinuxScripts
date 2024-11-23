# Ubuntu Setup Cheat Sheet
## Extensions
- [DM Theme Changer](https://extensions.gnome.org/extension/7379/dm-theme-changer/) - Automatically change theme styles when dark mode is enabled or disabled.
- [User Themes](https://extensions.gnome.org/extension/19/user-themes/) - Load shell themes from user directory.
- [Blur my Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/) - Adds a blur look to different parts of the GNOME Shell, including the top panel, dash and overview
- [Click to close overview](https://extensions.gnome.org/extension/3826/click-to-close-overview/) - Close the overview by clicking empty space
- [Dynamic Calendar, Clocks and Weather Icons](https://extensions.gnome.org/extension/5550/dynamic-calendar-and-clocks-icons/) - Let Calendar, Clocks and Weather icons show current date, time and weather.

- [[QSTweak] Quick Setting Tweaker](https://extensions.gnome.org/extension/5446/quick-settings-tweaker/) - You can add Media Controls, Notifications, Volume Mixer on quick settings and remove useless buttons!
- [Quick Settings Audio Panel](https://extensions.gnome.org/extension/5940/quick-settings-audio-panel/) - Create a new panel containing volumes and media control in the quick settings
- [Pixel Saver](https://extensions.gnome.org/extension/723/pixel-saver/) - Pixel Saver is designed to save pixel by fusing activity bar and title bar in a natural way
- [No overview](https://extensions.gnome.org/extension/4099/no-overview/) - No overview at start-up. Nothing more.

## External packages
- [Autorandr](https://github.com/phillipberndt/autorandr) - Automatically select a display configuration based on connected devices
- [Envycontrol](https://github.com/bayasdev/envycontrol) - EnvyControl provides an easy way to switch between GPU modes on Nvidia Optimus systems under Linux.

## Disable ABM

Open a terminal and edit the GRUB configuration file:
```sh
sudo nano /etc/default/grub
```
In line `GRUB_CMDLINE_LINUX_DEFAULT` append `amdgpu.abmlevel=0`. For example:
```sh
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amdgpu.abmlevel=0"
```
After saving the changes, update the GRUB configuration:
```sh
sudo update-grub
```
and reboot to apply changes.

## Bluetooth

### Startup launch

In order to modify launch Bluetooth module on system startup you need to change a variable "**AutoEnable**" in file **main.conf**

```sh
sudo nano /etc/bluetooth/main.conf
```

and there change variable "**AutoEnable**" to desired value (true/false).

## Dock

### Minimize on click

1. Always minimize on click
```sh
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```
2. Minimize on click or show previews
```sh
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
```

> More flexible solution

## Builtin

### Prompt for password

```sh
pkexec [command]
```

### Using custom theme

Change **gnome-shell.css** file in the `/usr/share/themes/Yaru-prussiangreen/gnome-shell/` and set **Shell** in the GNOME Tweaks app in the Appearance section to required theme. 

In order to do so you have to have enabled [User Themes](https://extensions.gnome.org/extension/19/user-themes/) extension.
> Dark mode may be not working

### Calendar display language

Execute command `sudo locale-gen pl_PL` and `sudo locale-gen pl_PL.UTF-8`. Use command `locale` to identify what language is currently used. To change calendar display language execute `sudo update-locale LC_TIME="pl_PL.UTF-8"` and logout to commit changes.

### Disk mount at startup

Add this command to Startup Applications `udisksctl mount -b /dev/<partition_path>`

### Wrong time on dualboot

To solve this problem you have to tell your Linux system to use hardware clock (RTC). You do that with the `set-local-rtc` option:
```sh
timedatectl set-local-rtc 1
```
