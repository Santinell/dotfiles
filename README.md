# Install

## Dependencies
```shell
sudo apt update
sudo apt install gawk git zsh nano mc curl wget tar bzip2 gzip zip p7zip-full gzip
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
