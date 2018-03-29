export PROMPT_EOL_MARK=""
export EDITOR=/bin/nano
export VISUAL=/bin/nano
export TERM="xterm-256color"
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh
  zplug update
else
  source ~/.zplug/init.zsh
fi

zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "zdharma/fast-syntax-highlighting"
zplug "~/dotfiles/arch", from:local, if:"(( $+commands[pacman] ))"
zplug "~/dotfiles/temp", from:local, if:"(( $+commands[sensors] )) && (( $+commands[hddtemp] ))"

# Load theme file
#zplug 'themes/agnoster', from:oh-my-zsh, as:theme
zplug 'bhilburn/powerlevel9k', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then zplug install; fi

zplug load

cdpath=(~ /var/www)

source ~/dotfiles/init.zsh
