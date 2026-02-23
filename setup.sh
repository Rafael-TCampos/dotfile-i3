#!/bin/bash

# 1. Atualizar o sistema
sudo apt update

# 2. Instalar programas essenciais e o FALKON (navegador leve)
sudo apt install -y i3 rofi htop alacritty picom pipewire \
                    fonts-font-awesome wget git python3-pip \
                    falkon lm-sensors

# 3. Instalar o Google Chrome (para desenvolvimento)
if ! command -v google-chrome-stable &> /dev/null; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    rm ./google-chrome-stable_current_amd64.deb
fi

# 4. Configurar o Link Simbólico do i3 (caso rode em outro PC no futuro)
mkdir -p ~/.config
if [ ! -L ~/.config/i3 ]; then
    rm -rf ~/.config/i3
    ln -s ~/dotfile-i3 ~/.config/i3
    echo "Link simbólico do i3 criado com sucesso!"
fi

# 5. Detectar sensores de temperatura (Samsung 300E)
sudo sensors-detect --auto

echo "Setup concluído! Reinicie o i3 (Mod+Shift+R) para ver as mudanças."
