## Dependencies

## Dependencies for Debian/Ubuntu:

```shell
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt update
sudo apt install gawk git zsh mc curl wget tar bzip2 gzip zip p7zip-full gzip fasd
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts ~/nerd-fonts
~/nerd-fonts/install.sh Hack
rm -rf ~/nerd-fonts
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Dependencies for Arch linux:

```shell
sudo pacman -Syu
sudo pacman -S --needed --noconfirm gawk git zsh mc curl wget tar bzip2 gzip zip p7zip gzip fzf pacaur fasd noto-fonts-emoji
pacaur -S --needed --noconfirm nerd-fonts-hack
```

## Installing dotfiles

```shell
git clone https://github.com/Santinell/dotfiles ~/dotfiles
ln -s ~/dotfiles/.zshrc ~/.zshrc
```
