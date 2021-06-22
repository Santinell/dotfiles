## Dependencies

## Dependencies for Debian/Ubuntu:

```shell
sudo apt update -y
sudo apt install -y gawk git zsh curl wget tar bzip2 gzip zip p7zip-full gzip fasd fzf
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/nerd-fonts
~/nerd-fonts/install.sh "Meslo LG"
rm -rf ~/nerd-fonts
# Optional:
sudo apt install -y silversearcher-ag
```

## Dependencies for Arch linux:

```shell
sudo pacman -Syu
sudo pacman -S --needed --noconfirm gawk git zsh curl wget tar bzip2 gzip zip p7zip gzip fzf fasd pacaur
pacaur -S --needed --noconfirm ttf-meslo-nerd-font-powerlevel10k
# Optional:
sudo pacman -S --needed --noconfirm lsd the_silver_searcher
```

## Installing dotfiles

```shell
git clone git@github.com:Santinell/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/.zprofile ~/.zprofile
```
