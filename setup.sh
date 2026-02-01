#!/bin/bash
set -e

echo "=== Atualizando sistema ==="
sudo apt update && sudo apt upgrade -y

echo "=== Instalando pacotes essenciais ==="
sudo apt install -y i3 polybar picom kitty alacritty thunar pavucontrol zsh git cmake build-essential wget fonts-powerline

echo "=== Instalando ls++ ==="
if ! command -v ls++ &> /dev/null; then
    sudo wget -q4 https://github.com/terroo/lspp/releases/download/v0.0.2/ls++ -O /usr/local/bin/ls++
    sudo chmod +x /usr/local/bin/ls++
fi

echo "=== Clonando/Atualizando dotfiles ==="
DOTFILES=~/dotfiles
if [ ! -d "$DOTFILES" ]; then
    git clone https://github.com/Rafael-TCampos/dotfile-i3.git "$DOTFILES"
else
    cd "$DOTFILES"
    git pull origin main
fi

echo "=== Criando symlinks das configurações ==="

# i3
mkdir -p ~/.config/i3
ln -sf "$DOTFILES/config" ~/.config/i3/config

# Kitty
mkdir -p ~/.config/kitty
ln -sf "$DOTFILES/kitty/kitty.conf" ~/.config/kitty/kitty.conf

# Picom
mkdir -p ~/.config/picom
ln -sf "$DOTFILES/picom.conf" ~/.config/picom/picom.conf

# Polybar
mkdir -p ~/.config/polybar
ln -sf "$DOTFILES/polybar/config.ini" ~/.config/polybar/config.ini

# Zsh
ln -sf "$DOTFILES/.zshrc" ~/.zshrc

echo "=== Instalando Nerd Fonts ==="
mkdir -p ~/.local/share/fonts
if [ -d "$DOTFILES/fonts" ]; then
    cp "$DOTFILES/fonts/"*.ttf ~/.local/share/fonts/
    fc-cache -fv
fi

echo "=== Finalizando ==="
echo "Instalação completa! Reinicie o i3 (Mod+Shift+R) e abra um novo terminal para aplicar o Zsh e Starship."
