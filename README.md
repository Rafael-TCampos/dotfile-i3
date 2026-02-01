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
├─ polybar/ # config da Polybar
├─ .zshrc # aliases e configuração do shell
├─ fonts/ # Nerd Fonts
├─ setup.sh # script de instalação automática
├─ README.md # este arquivo


---


## ⚡ Instalação rápida em outro PC

1. **Clonar o repositório:**

```bash
git clone https://github.com/Rafael-TCampos/dotfile-i3.git ~/dotfiles




## ⚡ Rodar o script de instalacao
cd ~/dotfiles
./setup.sh


O setup.sh vai:

Instalar programas essenciais (i3, Polybar, Picom, Kitty, Alacritty, ls++, Zsh, Starship, etc.)

Copiar todas as configs e criar os symlinks automaticamente

Instalar Nerd Fonts e atualizar cache de fontes

Deixar seu ambiente pronto para uso


## ⚡ Observacoes

Após rodar o script, reinicie o i3 (Mod+Shift+R) para aplicar a nova configuração.

Abra um novo terminal para aplicar o Zsh e o Starship.

Se quiser atualizar os dotfiles no futuro, basta entrar no diretório e fazer


cd ~/dotfiles
git pull origin main
./setup.sh
