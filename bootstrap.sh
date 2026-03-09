#!/usr/bin/env bash

# ============================================
# Bootstrap Dotfiles Ultra Automático - Rafael-TCampos
# ============================================

# Função para instalar pacotes se não estiverem
install_if_missing() {
    for pkg in "$@"; do
        if ! dpkg -s "$pkg" &> /dev/null; then
            echo "Instalando $pkg..."
            sudo apt install -y "$pkg"
        else
            echo "$pkg já instalado."
        fi
    done
}

# 1️⃣ Atualizar sistema
sudo apt update && sudo apt upgrade -y

# 2️⃣ Instalar pacotes essenciais
ESSENTIAL_PACKAGES=(i3 rofi htop alacritty picom pipewire \
    fonts-font-awesome wget git python3-pip falkon lm-sensors \
    brightnessctl curl zsh tmux unzip fontconfig)
install_if_missing "${ESSENTIAL_PACKAGES[@]}"

# 3️⃣ Instalar Google Chrome
if ! command -v google-chrome-stable &> /dev/null; then
    echo "Instalando Google Chrome..."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    rm ./google-chrome-stable_current_amd64.deb
else
    echo "Google Chrome já instalado."
fi

# 4️⃣ Clonar repo se ainda não existir
DOTFILES_DIR=~/dotfile-i3
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone https://github.com/Rafael-TCampos/dotfile-i3.git "$DOTFILES_DIR"
fi

# 5️⃣ Criar ~/.config se não existir
mkdir -p ~/.config

# 6️⃣ Criar symlinks de configs
for dir in i3 nvim polybar kitty alacritty rofi picom; do
    if [ -d "$DOTFILES_DIR/config/$dir" ]; then
        rm -rf ~/.config/$dir
        ln -s "$DOTFILES_DIR/config/$dir" ~/.config/$dir
        echo "Link simbólico de $dir criado!"
    fi
done

# 7️⃣ Symlink tmux.conf
if [ -f "$DOTFILES_DIR/config/tmux/.tmux.conf" ]; then
    ln -sf "$DOTFILES_DIR/config/tmux/.tmux.conf" ~/.tmux.conf
    echo "Link simbólico do tmux.conf criado!"
fi

# 8️⃣ Instalar Zsh + oh-my-zsh
install_if_missing zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Instalando oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 9️⃣ Detectar sensores automaticamente (sem prompt)
sudo sensors-detect --auto

# 🔹 Finalização
echo
echo "============================================"
echo "Bootstrap automático concluído!"
echo "Reinicie o i3 (Mod+Shift+R) e abra um terminal para usar Zsh + oh-my-zsh."
echo "============================================"
