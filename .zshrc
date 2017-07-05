# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh
  zplug update
else
  source ~/.zplug/init.zsh
fi

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/debian", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Load theme file
zplug 'themes/agnoster', from:oh-my-zsh, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then zplug install; fi

zplug load

cdpath=(~ /var/www)

source ~/dotfiles/init.zsh
