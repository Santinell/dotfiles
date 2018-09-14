export PROMPT_EOL_MARK=""
export EDITOR=/bin/nano
export VISUAL=/bin/nano
export TERM="xterm-256color"
export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

# Check if zplug is installed
if [[ ! -d ~/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen ~/.zgen
fi

source ~/.zgen/zgen.zsh

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh lib/completion.zsh
    zgen oh-my-zsh lib/key-bindings.zsh
    zgen oh-my-zsh lib/history.zsh
    zgen load zdharma/fast-syntax-highlighting
    zgen load ~/dotfiles/arch

    # Load theme file
    zgen load bhilburn/powerlevel9k powerlevel9k
    zgen save
fi

cdpath=(~ /var/www)

source ~/dotfiles/init.zsh
