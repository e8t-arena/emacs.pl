#!/bin/sh

# which osascript > /dev/null 2>&1 && osascript -e 'tell application "Emacs" to activate'
# emacsclient -c "$@"

run_emacsclient () {
  exec &> $HQ_EMACS_LOGDIR/$(date +%Y-%m-%d).log
	emacsclient -cqu -a '' $@
}

run_emacsclient $@ &
