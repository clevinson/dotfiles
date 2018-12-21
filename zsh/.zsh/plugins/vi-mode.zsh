# Functions / helpers for setting cursor shape
function print_dcs
{
  print -n -- "\EP$1;\E$2\E\\"
}

function set_cursor_shape
{
  if [ -n "$TMUX" ]; then
    # tmux will only forward escape sequences to the terminal if surrounded by
    # a DCS sequence
    print_dcs tmux "\E]50;CursorShape=$1\C-G"
  else
    print -n -- "\E]50;CursorShape=$1\C-G"
  fi
}
#{
#  RPROMPT=""
#  [[ $KEYMAP = vicmd ]] && RPROMPT="%{$fg[red]%}[COMMAND]%{$reset_color%}"
#  () { return $__prompt_status }
#  zle reset-prompt
#}

function set_tmux_cursor_variable {
  if [ -n "$TMUX" ]; then
    tmux setenv -g TMUX_CURSOR_SHAPE_$(tmux display -p "#I_#D" | tr -d %) $1
  fi
}

function zle-line-init zle-line-finish zle-keymap-select {
  case $KEYMAP in
    vicmd)      set_tmux_cursor_variable 0 && set_cursor_shape 0;; # block cursor
    viins|main) set_tmux_cursor_variable 2 && set_cursor_shape 2;; # line cursor
  esac
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish
zle -N edit-command-line

bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^r' history-incremental-search-backward

# allow ctrl-a, ctrl-e for shortcuts to beginning & end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# allow ctrl-h, ctrl-w, ctrl-?, ctrl-[[3~ for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '[3~' delete-char
