## Dependencies

## Dependencies for Debian/Ubuntu:

```shell
sudo apt update -y
sudo apt install -y gawk git zsh curl wget tar bzip2 gzip zip p7zip-full gzip fasd fzf
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/nerd-fonts
~/nerd-fonts/install.sh Hack
rm -rf ~/nerd-fonts
```

## Dependencies for Arch linux:

```shell
sudo pacman -Syu
sudo pacman -S --needed --noconfirm gawk git zsh curl wget tar bzip2 gzip zip p7zip gzip fzf fasd nerd-fonts-noto-sans-mono
```

## Installing dotfiles

```shell
git clone git@github.com:Santinell/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/.profile ~/.profile
```
