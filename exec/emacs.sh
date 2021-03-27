#!/bin/sh

runemacs() {
    echo $(PWD)
    target=$1
    
    # [ -n $target ]
    exec &> $HQ_EMACS_LOGDIR/$(date +%Y-%m-%d).log
    if [ -z $target ]; then
        /Applications/Emacs.app/Contents/MacOS/Emacs &
    else
        case $target in
          /*) 
              # echo "absolute path" 
              ;;
          *) 
              # echo "something else"
              target=$(PWD)/$target
              ;;
        esac
        /Applications/Emacs.app/Contents/MacOS/Emacs $target &
        echo $target
    fi
}

runemacs $1
