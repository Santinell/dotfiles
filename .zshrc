export LC_COLLATE="C"
export PROMPT_EOL_MARK=""
export TERM="xterm-256color"
export PATH=$PATH:~/.local/bin
export EDITOR=/usr/bin/nano
export VISUAL=/usr/bin/nano

# Check if zplug is installed
if [[ ! -d ~/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen ~/.zgen
fi

source ~/.zgen/zgen.zsh

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/fzf
    zgen oh-my-zsh plugins/fasd
    zgen load zdharma-continuum/fast-syntax-highlighting
    if [ -x "$(command -v pacman)" ]; then
      zgen load ~/dotfiles/arch
    fi

    # Load theme file
    zgen load romkatv/powerlevel10k powerlevel10k
    zgen save
fi

cdpath=(~ /var/www)

source ~/dotfiles/init.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time time)
unset POWERLEVEL9K_VCS_CONTENT_EXPANSION
unset POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING
unset POWERLEVEL9K_ICON_PADDING
unset POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION
