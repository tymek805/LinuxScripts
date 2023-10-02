Table of contents:
- [List of extensions](#extensions)
- [Bluetooth](#bluetooth)

## Extensions
- [Blur my Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/) - Adds a blur look to different parts of the GNOME Shell, including the top panel, dash and overview
- [Click to close overview](https://extensions.gnome.org/extension/3826/click-to-close-overview/) - Close the overview by clicking empty space
- [Compact Quick Settings](https://extensions.gnome.org/extension/5527/compact-quick-settings/) - Compact quick settings menu for GNOME 43 and newer
- [[QSTweak] Quick Setting Tweaker](https://extensions.gnome.org/extension/5446/quick-settings-tweaker/) - You can add Media Controls, Notifications, Volume Mixer on quick settings and remove useless buttons!
- [Hide Activities Button](https://extensions.gnome.org/extension/744/hide-activities-button/) - Hides the Activities button from the status bar
- [Quick Settings Audio Panel](https://extensions.gnome.org/extension/5940/quick-settings-audio-panel/) - Create a new panel containing volumes and media control in the quick settings
- [Pixel Saver](https://extensions.gnome.org/extension/723/pixel-saver/) - Pixel Saver is designed to save pixel by fusing activity bar and title bar in a natural way

## Bluetooth

### Startup launch

In order to modify launch Bluetooth module on system startup you need to change a variable **AutoEnable** in file **main.conf**

```sh
sudo nano /etc/bluetooth/main.conf
```

and there change variable **AutoEnable** to desired value (true/false).
