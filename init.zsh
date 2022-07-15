setopt PROMPT_CR
setopt PROMPT_SP
setopt extendedglob
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt menucomplete

alias grep='grep --color=auto'
alias psg='ps aux | grep -v grep | grep'
alias hisg='h 10000 | grep'
alias sendtext='curl -F "f:1=<-" ix.io'
alias dirsize='sudo du -xhd1 2>/dev/null | sort -hr | head -25'
alias back='cd $OLDPWD'
if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd -lah --group-dirs=first'
else
  alias ls='ls --color -lah --group-directories-first'
fi
alias npg="npm list -g --depth=0 2>/dev/null"
alias npl="npm list --depth=0 2>/dev/null"
alias eslint="npx eslint"
alias tap="npx tap"
alias nodemon="npx nodemon"
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'

bindkey -r '^P'
bindkey -r '^N'
# Alt+X = Clear line
bindkey -s '^[x' '^U'
# Alt+A = Git Add
bindkey -s '^[a' '^Ugit add '
# Alt+R = Git rebase
bindkey -s '^[r' '^Ugit rebase '
# Alt+T = Git reset
bindkey -s '^[t' '^Ugit reset '
# Alt+C = Git commit
bindkey -s '^[c' '^Ugit commit -m ""'
# Alt+G = Git pull
bindkey -s '^[g' '^Ugit pull '
# Alt+P = Git push
bindkey -s '^[p' '^Ugit push '
# Alt+S = Git status
bindkey -s '^[s' '^Ugit status^M'
# Alt+D = Git diff
bindkey -s '^[d' '^Ugit diff '
# Alt+M = Git merge
bindkey -s '^[m' '^Ugit merge '
# Alt+L = Git log
bindkey -s '^[l' '^Ugit log^M'
# Alt+B = Git Checkout
bindkey -s '^[b' '^Ugit checkout '

git config --global push.default current 2>/dev/null
git config --global pull.rebase false

h() {
  if [ $# -eq 0 ]; then
    fc -l
    return;
  else
    fc -l -$1
  fi
}

help () {
  curl cht.sh/$1/$2
}

countlines () {
  glob=' -name "*.*"'
  ignore=''
  globs=()
  ignors=("*/node_modules/*" "*/.git/*")

  while getopts "hfi:" opt; do
    case "$opt" in
    h)  echo "Example: countlines [-f *.js] [-i build]"
        exit 0
        ;;
    f)  globs+=($OPTARG)
        ;;
    i)  ignors+=($OPTARG)
        ;;
    esac
  done

  for i in "${ignors[@]}"
  do
    ignore+=" -not -path \"${i}\""
  done

  if [ ${#globs[@]} -gt 0 ]; then
    glob=""
    for g in "${globs[@]}"
    do
      glob+=" -name \"${g}\""
    done
  fi

  eval "find .$ignore -type f$glob -print | xargs wc -l"
}

writeiso () {
  if [ $1 ] ; then
    sudo dd bs=8M if=$1 of=$2 status=progress oflag=sync
  else
    echo "Example: writeiso /path/to/file /dev/devName"
  fi
}

compress () {
  if [ $1 ] ; then
    case $1 in
      tbz)  tar cjvf $2.tar.bz2 $2   ;;
      tgz)  tar czvf $2.tar.gz  $2   ;;
      tar)  tar cpvf $2.tar  $2      ;;
      bz2)  bzip $2                  ;;
      gz)   gzip -c -9 -n $2 > $2.gz ;;
      zip)  zip -r $2.zip $2         ;;
      7z)   7z a $2.7z $2            ;;
      *)    echo "'$1' cannot be packed via >compress<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.tar.xz)  tar xvfJ $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

sendfile() {
  if [ $# -eq 0 ]; then
    echo -e "No arguments specified. Usage:\nsendfile ./test.md";
    return 1;
  fi
  tmpfile=$( mktemp -t transferXXX );
  if tty -s; then
    basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
    curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
  else
    curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
  fi;
  cat $tmpfile;
  rm -f $tmpfile;
  echo "";
}
