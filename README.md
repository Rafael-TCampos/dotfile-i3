# Dotfiles do i3wm

Meus arquivos de configuração do i3wm, terminal e outros programas que uso no Linux Mint.

---

## 🖥️ Programas instalados

- **i3wm** - gerenciador de janelas
- **Picom** - compositor para transparência e sombras
- **Kitty** - terminal
- **Alacritty** - terminal (opcional)
- **ls++** - ls com cores e ícones Nerd Font
- **Zsh** - shell
- **Thunar** - gerenciador de arquivos
- **Pavucontrol** - controle de áudio
- **Nerd Fonts** - fontes para ícones
- **Rofi** - lancador de janela de apps 
- **Arandr** - gerenciador de monitor
- **Feh** -  para wallpapers
- **Polybar** - barra de status
---

## 📁 Estrutura do repositório
dotfile-i3/
├─ alacritty/ # configs do Alacritty
├─ i3/ # config do i3
├─ kitty/ # configs do Kitty
├─ picom.conf # config do Picom
├─ .zshrc # aliases e configuração do shell
├─ README.md # este arquivo


---

## ⚡ Instalação rápida

1. Clonar o repositório:

```bash
git clone https://github.com/Rafael-TCampos/dotfile-i3.git ~/dotfiles

## ⚡ Criar symlinks para usar as configs

ln -s ~/dotfiles/i3/config ~/.config/i3/config
ln -s ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/dotfiles/picom.conf ~/.config/picom/picom.conf
ln -s ~/dotfiles/.zshrc ~/.zshrc




