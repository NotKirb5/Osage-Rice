# Osage-Rice
Arch Hyprland Rice based off of Inabakumori

Disclaimer: this is a rice made for my laptop and any bugs that that may occur due to diffrent monitor resolutions, input or output settings will probably not be very high on my priority list (basically i just wanna make a pretty desktop

- Distro: Arch
- DE: Hyprland
- File Manager: Yazi/Dolphin
- Terminal: Kitty
- Shell: zsh
- top bar: eww
- App Launcher: rofi
- Music Player: cmus (others like yt music works)


includes nvim configs if you like the trans colors

# Screenshots

<img width="1920" height="1200" alt="Screenshot_21-Aug_12-02-06_31974" src="https://github.com/user-attachments/assets/495f59f7-acc0-402f-984d-d57c28077a29" />
<img width="1920" height="1200" alt="Screenshot_21-Aug_12-03-11_16303" src="https://github.com/user-attachments/assets/bdf181dc-18a3-48e8-b450-0c57f82643d1" />
<img width="1920" height="1200" alt="Screenshot_21-Aug_12-02-32_17119" src="https://github.com/user-attachments/assets/fae08c69-4e5d-47fc-8752-123481cf85b5" />

# Installation

Only made and tested for Arch Linux other distros i recomend copying dotfiles manually

(You may have to do a little bit of tinkering to get everything)

Clone the repo and cd into it

```
git clone https://github.com/NotKirb5/Osage-Rice.git
cd Osage-Rice
```

Give the install script permissions and run it

```
chmod +x install.sh
./install.sh
```

If you want to use cmus as your music player

Run cmus

```cmus```

go to the playlist view (press 3 in cmus)

Create a new playlist

``` :pl-create inabakumori ```

select the new playlist (navagate to the playlist and press the spacebar)

add your new songs

``` :add -p ~/Music/inabakumori ```

# Known Issues mostly with install script

Fonts might not install correctly just do it manually if it doesnt
oh-my-zsh plugins might not install correctly, also just do that manually

# Keybinds 

this will be breif but all keybinds are in the hyprland.conf file if you dont like it change it

### Launch Applications

| Action                 | Keybind                    | Description                          |
|------------------------|----------------------------|--------------------------------------|
| Terminal (tiled)       | `SUPER + RETURN`           | Launch terminal          |
| Browser                | `SUPER + B`                | Launch your default browser          |
| App Launcher / Menu    | `SUPER + D`            | Launch rofi    |

---

### System Scripts

| Action                  | Keybind                  | Description                            |
|-------------------------|--------------------------|----------------------------------------|
| Power Menu              | `CTRL + ALT + P`              | open wlogout         |
| Lock Screen              | `CTRL + ALT + L`              | open Hyprlock      |
| Mute Volume              | `SUPER + F1`              | Toggles Mute      |
| Lower Volume              | `SUPER + F2`              | Lowers Volume      |
| Raise Volume              | `SUPER + F3`              | Raises Volume      |
| Pause Music             | `SUPER + K`              | Pauses with playerctl      |
| Previous Song             | `SUPER + J`              | Previous with playerctl      |
| Skip Song             | `SUPER + L`              | Skips with playerctl      |


---

### Window Actions

| Action            | Keybind           | Description                           |
|-------------------|-------------------|---------------------------------------|
| Kill Window       | `SUPER + Q`       | Close the currently focused window    |
| Toggle Floating   | `SUPER + Space`       | Toggle floating mode for active window|
| Toggle Split      | `SUPER + H`       | Toggle split orientation (vertical/horizontal) |
| Fake Fullscreen        | `SUPER + CTRL + F`       | Toggle fake fullscreen mode                |
| Fullscreen        | `SUPER + SHIFT + F`       | Toggle fullscreen mode                |

---

###  Window Focus
Use `SUPER + arrow key` to change focus between tiled windows:


### Move Tiled Window
Use `SUPER + CTRL + arrow key` to move a focused window in the specified direction:
Also `SUPER + ALT + arrow key` swaps window positions


### Resize Tiled Window
Use `SUPER + SHIFT + arrow key` to resize the focused window:



