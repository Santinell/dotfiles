pacman() {
  if [ $1 = "install" ] ; then
    sudo /usr/bin/pacman -S ${@:2}
  elif [ $1 = "update" ] ; then
    sudo /usr/bin/pacman -Sy
  elif [ $1 = "upgrade" ] ; then
    sudo /usr/bin/pacman -Suyy
  elif [ $1 = "search" ] ; then
    /usr/bin/pacman -Ss ${@:2}
  elif [ $1 = "remove" -o $1 = "purge" ] ; then
    sudo /usr/bin/pacman -Rs ${@:2}
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
    /usr/bin/pacaur -Suyy
  elif [ $1 = "search" ] ; then
    /usr/bin/pacaur -Ss ${@:2}
  elif [ $1 = "remove" -o $1 = "purge" ] ; then
    sudo /usr/bin/pacaur -Rs ${@:2}
  else
    /usr/bin/pacaur $@
  fi
}
