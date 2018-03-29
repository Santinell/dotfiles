pacman() {
  pacmanBin=`which pacman`;
  if [ $1 = "install" ] ; then
    sudo $pacmanBin -S ${@:2}
  elif [ $1 = "update" ] ; then
    sudo $pacmanBin -Sy
  elif [ $1 = "upgrade" ] ; then
    sudo $pacmanBin -Syu
  elif [ $1 = "search" ] ; then
    $pacmanBin -Ss ${@:2}
  else
    sudo $pacmanBin $@
  fi
}

pacaur() {
  pacaurBin=`which pacaur`;
  if [ $1 = "install" ] ; then
    $pacaurBin -S ${@:2}
  elif [ $1 = "update" ] ; then
    $pacaurBin -Sy
  elif [ $1 = "upgrade" ] ; then
    $pacaurBin -Syu
  elif [ $1 = "search" ] ; then
    $pacaurBin -Ss ${@:2}
  else
    $pacaurBin $@
  fi
}

