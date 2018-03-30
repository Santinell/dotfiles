pacman() {
  if [ $1 = "install" ] ; then
    sudo /usr/bin/pacman -S ${@:2}
  elif [ $1 = "update" ] ; then
    sudo /usr/bin/pacman -Sy
  elif [ $1 = "upgrade" ] ; then
    sudo /usr/bin/pacman -Syu
  elif [ $1 = "search" ] ; then
    /usr/bin/pacman -Ss ${@:2}
  else
    sudo /usr/bin/pacman $@
  fi
}

pacaur() {
  if [ $1 = "install" ] ; then
    /usr/bin/pacaur -S ${@:2}
  elif [ $1 = "update" ] ; then
    /usr/bin/pacaur -Sy
  elif [ $1 = "upgrade" ] ; then
    /usr/bin/pacaur -Syu
  elif [ $1 = "search" ] ; then
    /usr/bin/pacaur -Ss ${@:2}
  else
    /usr/bin/pacaur $@
  fi
}
