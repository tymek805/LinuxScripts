# Ubuntu Setup Cheat Sheet

## Table of contents:
- [Extensions](#extensions)
- [External packages](#external-packages)
- [Bluetooth](#bluetooth)
- [Apps](#apps)
- [Discord](#discord)
- [Dock](#dock)
- [Built-in](#builtin)

## Extensions
- [Blur my Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/) - Adds a blur look to different parts of the GNOME Shell, including the top panel, dash and overview
- [Click to close overview](https://extensions.gnome.org/extension/3826/click-to-close-overview/) - Close the overview by clicking empty space
- [Compact Quick Settings](https://extensions.gnome.org/extension/5527/compact-quick-settings/) - Compact quick settings menu for GNOME 43 and newer
- [[QSTweak] Quick Setting Tweaker](https://extensions.gnome.org/extension/5446/quick-settings-tweaker/) - You can add Media Controls, Notifications, Volume Mixer on quick settings and remove useless buttons!
- [Hide Activities Button](https://extensions.gnome.org/extension/744/hide-activities-button/) - Hides the Activities button from the status bar
- [Quick Settings Audio Panel](https://extensions.gnome.org/extension/5940/quick-settings-audio-panel/) - Create a new panel containing volumes and media control in the quick settings
- [Pixel Saver](https://extensions.gnome.org/extension/723/pixel-saver/) - Pixel Saver is designed to save pixel by fusing activity bar and title bar in a natural way

## External packages

- [Autorandr](https://github.com/phillipberndt/autorandr) - Automatically select a display configuration based on connected devices
- [Envycontrol](https://github.com/bayasdev/envycontrol) - EnvyControl provides an easy way to switch between GPU modes on Nvidia Optimus systems under Linux.

## Bluetooth

### Startup launch

In order to modify launch Bluetooth module on system startup you need to change a variable "**AutoEnable**" in file **main.conf**

```sh
sudo nano /etc/bluetooth/main.conf
```

and there change variable "**AutoEnable**" to desired value (true/false).

## Apps

### Discord

#### Discord wants latest version

![Discord wants latest version - image](https://nixos.wiki/images/4/40/Discord_update_latest.png)

```sh
nano ~/.config/discord/settings.json
```
and change `"SKIP_HOST_UPDATE"` to `true` \
\
Whole line should look like this: \
`SKIP_HOST_UPDATE: true`
> Remember to add coma to the previous value

### Steam

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
