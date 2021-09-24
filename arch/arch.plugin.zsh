pacman() {
  if [ $1 = "install" ] ; then
    sudo /usr/bin/pacman -S ${@:2}
  elif [ $1 = "update" ] ; then
    sudo /usr/bin/pacman -Sy
  elif [ $1 = "upgrade" ] ; then
    sudo /usr/bin/pacman -Syyuu
  elif [ $1 = "search" ] ; then
    /usr/bin/pacman -Ss ${@:2}
  elif [ $1 = "remove" -o $1 = "purge" ] ; then
    sudo /usr/bin/pacman -Rs ${@:2}
  elif [ $1 = "autoremove" ] ; then
    sudo /usr/bin/pacman -Rcns $(pacman -Qdtq)
  else
    sudo /usr/bin/pacman $@
  fi
}

trizen() {
  if [ $1 = "install" ] ; then
    /usr/bin/trizen -S --needed --noedit ${@:2}
  elif [ $1 = "update" ] ; then
    /usr/bin/trizen -Sy
  elif [ $1 = "upgrade" ] ; then
    /usr/bin/trizen -Syyuu
  elif [ $1 = "search" ] ; then
    /usr/bin/trizen -Ss ${@:2}
  elif [ $1 = "remove" -o $1 = "purge" ] ; then
    /usr/bin/trizen -Rns ${@:2}
  elif [ $1 = "autoremove" ] ; then
    /usr/bin/trizen -Rcns $(trizen -Qdtq)
  else
    /usr/bin/trizen $@
  fi
}

pacaur() {
  if [ $1 = "install" ] ; then
    /usr/bin/pacaur -S --noedit ${@:2}
  elif [ $1 = "update" ] ; then
    /usr/bin/pacaur -Sy
  elif [ $1 = "upgrade" ] ; then
    /usr/bin/pacaur -Syyuu
  elif [ $1 = "search" ] ; then
    /usr/bin/pacaur -Ss ${@:2}
  elif [ $1 = "remove" -o $1 = "purge" ] ; then
    /usr/bin/pacaur -Rs ${@:2}
  elif [ $1 = "autoremove" ] ; then
    /usr/bin/pacaur -Rcns $(/usr/bin/pacaur -Qdtq)
  else
    /usr/bin/pacaur $@
  fi
}
