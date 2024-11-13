export LC_COLLATE="C"
export PROMPT_EOL_MARK=""
export TERM="xterm-256color"
export PATH=$PATH:~/.local/bin

# Check if zplug is installed
if [[ ! -d ~/.zgenom ]]; then
  git clone https://github.com/jandamm/zgenom.git ~/.zgenom
fi
source ~/.zgenom/zgenom.zsh

# if the init scipt doesn't exist
if ! zgenom saved; then
    echo "Creating a zgen save"
    zgenom oh-my-zsh
    zgenom ohmyzsh --completion plugins/git
    zgenom oh-my-zsh plugins/sudo
    zgenom oh-my-zsh plugins/docker
    zgenom oh-my-zsh plugins/fzf
    zgenom oh-my-zsh plugins/fasd
    zgenom load lukechilds/zsh-better-npm-completion
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-completions
    if [ -x "$(command -v pacman)" ]; then
      zgenom load ~/dotfiles/arch
    fi

    # Load theme file
    zgenom load romkatv/powerlevel10k powerlevel10k
    zgenom save
fi

cdpath=(~ /var/www)

source ~/dotfiles/init.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time time)
unset POWERLEVEL9K_VCS_CONTENT_EXPANSION
unset POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING
unset POWERLEVEL9K_ICON_PADDING
unset POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION
