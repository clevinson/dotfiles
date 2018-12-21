#!/bin/sh

# cd into .tmux dir so logs get created there
# create new 'sebald' session if it doesn't already exist
#rm -f ~/.tmux/logs/* && cd ~/.tmux/logs && tmux -v new -d -s sebald -c ~ &> /dev/null
tmux new -A -s sebald -c ~ &> /dev/null

## set tmux server log file env-var
#TMUX_SERVER_PID=$(tmux display -p "#{pid}")
#TMUX_LOG=tmux-server-$TMUX_SERVER_PID.log
#
## Functions / helpers for setting cursor shape
#function print_dcs {
#  printf "\\033P$1;\\033$2\\033\\" > $(tmux display -p '#{pane_tty}')
#}
#
#function set_cursor_shape {
#  print_dcs tmux "\\033]1337;CursorShape=$1\\007"
#}
#
## tails tmux server logs and calls to update cursor shape
## whenever the active pane / window changes
#function tmux_cursor_checker {
#  echo "$$" > /tmp/tmux_cursor_checker.pid
#  tail -f $TMUX_LOG | \
#    grep --line-buffered -E "select-(window|pane)" | \
#    while read line
#    do
#      if [[ $(tmux display -p '#{pane_current_command}') != 'vim' || $(tmux display -p '#{pane_current_command}') != 'nvim' ]]; then
#        set_cursor_shape $( \
#          tmux showenv -g TMUX_CURSOR_SHAPE_$(tmux display -p "#I_#D" | tr -d %) | \
#          sed 's/^.*=//' \
#        )
#      fi
#    done
#}
#
## run tmux cursor checker in background
#tmux_cursor_checker &
#
## attach to 'sebald' session
#tmux attach -t sebald
#
#
## helper for finding all descendent processes
#list_descendants() {
#  local children=$(pgrep -P "$1")
#
#  for pid in $children
#  do
#    list_descendants "$pid"
#  done
#
#  echo "$children"
#}
#
## cleanup function to kill all descendent processes
#function cleanup() {
#  kill $(list_descendants $$)
#}
#
#
## call cleanup function on EXIT
#trap cleanup EXIT
