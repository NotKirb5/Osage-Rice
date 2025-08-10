cd $HOME

sudo pacman -S --noconfirm github-cli git playerctl rofi wayland yazi neovim networkmanager zsh kitty imagemagick pavucontrol swww swaync stow hypridle hyprlock sddm hyprland hyprpicker slurp grim dolphin dunst qt5-wayland cmus waybar

CONFIG_DIR="$HOME/.config"
DOTFILES_CONFIG="$HOME/Osage-Rice/.config"
BACKUP_SUFFIX=".bak"

echo "Backing up configuration directories in $CONFIG_DIR based on dotfiles in $DOTFILES_CONFIG"
# Change to the .config folder
cd "$CONFIG_DIR" || {
  echo "Could not access $CONFIG_DIR"
  exit 1
}

# Loop over every directory in the dotfiles repo
for dir in "$DOTFILES_CONFIG"/*/; do
  folder_name=$(basename "$dir")
  if [ -d "$CONFIG_DIR/$folder_name" ]; then
    echo "Backing up directory: $folder_name"
    mv "$CONFIG_DIR/$folder_name" "$CONFIG_DIR/${folder_name}${BACKUP_SUFFIX}"
  else
    echo "Directory $folder_name not found in $CONFIG_DIR; skipping backup"
  fi
done

FILES=(.zshrc .zshenv .tmux.conf .p10k.zsh wallpapers scripts screenshots)

echo "Backing up individual files in $HOME"
for file in "${FILES[@]}"; do
  if [ -f "$HOME/$file" ]; then
    echo "Backing up file: $file"
    mv "$HOME/$file" "$HOME/${file}${BACKUP_SUFFIX}"
  else
    echo "File $file not found; skipping backup"
  fi
done

CACHE_WAL="$HOME/.cache/wal"
CACHE_WAL_BAK="$HOME/.cache/wal.bak"

echo "Checking for $CACHE_WAL..."
if [ -d "$CACHE_WAL" ]; then
  echo "Backing up $CACHE_WAL to $CACHE_WAL_BAK"
  mv "$CACHE_WAL" "$CACHE_WAL_BAK"
else
  echo "$CACHE_WAL not found; skipping..."
fi

echo "Applying dotfiles"

cd $HOME

git clone https://github.com/NotKirb5/Osage-Rice.git

cd Osage-Rice

cp -r $HOME/Osage-Rice/.config ~

cp -r $HOME/Osage-Rice/Pictures ~

cp -r $HOME/Osage-Rice/Music ~
# Go back to home directory
cd $HOME

#add songs to cmus

cmus &

cmus_remote -C "pl-create inabakumori"
cmus_remote -C "pl-delete Default"

cmus_remote -C "add -p ~/Music/inabakumori/"

#add cmus theme

cp $HOME/Osage-Rice/cmus/inabakumori.theme $HOME/.config/cmus

cmus_remote -C "colorscheme inabakumori"

pkill cmus

echo "Do you want to install lazyvim configs (y/n)"
read -r choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  echo "Installing..."
  # required
  mv $HOME/.config/nvim{,.bak}

  # optional but recommended
  mv $HOME/.local/share/nvim{,.bak}
  mv $HOME/.local/state/nvim{,.bak}
  mv $HOME/.cache/nvim{,.bak}
  git clone https://github.com/LazyVim/starter $HOME/.config/nvim
  rm -rf $HOME/.config/nvim/.git

  cp -r $HOME/Osage-Rice/nvim/lua $HOME/.config/nvim
  cp -r $HOME/Osage-Rice/nvim/init.lua $HOME/.config/nvim

else
  echo "Skipping installation."
fi

# Install yay (AUR helper)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

yay -S --noconfirm neofetch cava battop paru wlogout

cd $HOME

wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FantasqueSansMono.zip
mkdir -p "$HOME/.local/share/fonts/FantasqueSansMonoNerd" && unzip -o -q "FantasqueSansMono.zip" -d "$HOME/.local/share/fonts/FantasqueSansMono" && echo "FantasqueSansMono installed successfully" | tee -a "$LOG"

wget -q https://github.com/adobe-fonts/source-han-sans/releases/download/2.005R/07_SourceHanSansJ.zip

mkdir -p "$HOME/.local/share/fonts/07_SourceHanSansJ.zip" && unzip -o -q "07_SourceHanSansJ.zip" -d "$HOME/.local/share/fonts/07_SourceHanSansJ" && echo "Jp font installed successfully" | tee -a "$LOG"

#add zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp -r $HOME/Osage-Rice/zsh/.zshrc $HOME
cp -r $HOME/Osage-Rice/zsh/comfyline.zsh-theme $HOME/.oh-my-zsh/themes
cp -r $HOME/Osage-Rice/zsh/oh-my-zsh.sh $HOME/.oh-my-zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cd $HOME/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.zshrc
cd $HOME

curl --proto '=https' -- tlsv1.2 -sSf https://sh.rustup.rs | sh

git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
cd target/release
chmod +x ./eww
sudo cp ./eww /usr/local/bin/

# Network Manager setup
sudo systemctl disable systemd-resolved
sudo systemctl disable systemd-networkd
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Change shell to zsh
chsh -s /usr/bin/zsh

echo "rebooting lol hope this works"

sudo reboot
