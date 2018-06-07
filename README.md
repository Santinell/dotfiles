# Install

## Dependencies

### Debian/Ubuntu

```shell
sudo apt update
sudo apt install gawk git zsh nano mc curl wget tar bzip2 gzip zip p7zip-full gzip
```

### Arch linux

```shell
sudo pacman -Syu
sudo pacman -S --needed --noconfirm gawk git zsh nano mc curl wget tar bzip2 gzip zip p7zip gzip pacaur
```

## Powerline fonts

```shell
git clone https://github.com/powerline/fonts.git ~/powerline_fonts
~/powerline_fonts/install.sh
rm -rf ~/powerline_fonts
```

## Dotfiles

```shell
git clone https://github.com/Santinell/dotfiles ~/dotfiles
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

## Extra soft list

```shell
sudo pacman -S --needed --noconfirm nodejs-lts-carbon guake openssh chromium xdotool variety
gpg --recv-keys 8F0871F202119294 // For discord
pacaur -S --needed --noconfirm discord atom-editor-bin flameshot-git ccat devdocs-desktop
```
