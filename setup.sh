#! /bin/sh
#
# setup.sh
# Copyright (C) 2021 Peter Lau <superpeterlau@outlook.com>
#
# Distributed under terms of the MIT license.
#


alias rawemacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
FEM_HOME=$(PWD)

fem () {
  rawemacs -q --no-splash --load $FEM_HOME/init.el $@ &
  # rawemacs --no-splash --load $FEM_HOME/init.el $1 &
}

initemacsconf() {
  mkdir -p auto-save-list \
  backup \
  elpa \
  log \
  packages \
  session
}
