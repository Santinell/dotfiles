setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""
export SHELL=/usr/bin/zsh

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh
  zplug update
else
  source ~/.zplug/init.zsh
fi

zplug "plugins/sudo", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "zdharma/fast-syntax-highlighting"

# Load theme file
zplug 'themes/agnoster', from:oh-my-zsh, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then zplug install; fi

zplug load

cdpath=(~ /var/www)

source ~/dotfiles/init.zsh
