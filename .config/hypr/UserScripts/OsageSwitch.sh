#!/usr/bin/env zsh
lofi="$LOFI"
echo "$LOFI"

if [[ "$lofi" == "false" ]]; then
    lofi="true"
else
    lofi="false"
fi


echo "$lofi"
pkill cmus
kitty -e cmus &
sleep 0.2
echo "loaded cmus"
cmus-remote -C "clear"
if [[ "$lofi" == "true" ]]; then
  cmus-remote -C "add -q ~/Music/lofi"
else
  cmus-remote -C "add -q ~/Music/inabakumori"
fi
cmus-remote -n
cmus-remote -p
sed -i '/^export LOFI=/d' ~/.zshrc

# Add new export line
echo "export LOFI=\"$lofi\"" >> ~/.zshrc

export LOFI="$lofi"
source ~/.zshrc
