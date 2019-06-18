export CLICOLOR=1
export LSCOLORS="exBxfxdxDxexfxGxHxExEx"
export PS1="%{$fg[green]%}%1~ %{$reset_color%}; "
export EDITOR=vim

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration
# export KEYTIMEOUT=1

# enable colors in prompt
autoload -U colors && colors

# export PATH stuffs
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# History
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.


export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias docker-clean='docker rm -v $(docker ps -a -q -f status=exited)'
alias denv='eval $(docker-machine env default)'
alias l='ls -lh'
alias vim='nvim'

mount-whatbox() {
  umount /Volumes/Whatbox
  mkdir -p /Volumes/Whatbox
  sshfs -o reconnect -o volname=Whatbox famusmockingbird@rosetta.whatbox.ca:files /Volumes/Whatbox
}

whatbox-down() {
  rsync -avh --progress --iconv=utf-8-mac,utf-8 rosetta:~/files/music/ ~/Music/soup
  find ~/Music/soup -name "*flac" -exec ffmpeg -i {} -ab 320k -map_metadata 0 -id3v2_version 3 {}.mp3 \;

  ITUNES_DIR=$(find ~/Music/ -name "Automatically Add*")

  find ~/Music/soup -name "*.mp3" -exec mv {} "$ITUNES_DIR" \;
}

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'di=34:ln=1;31:so=35:pi=33:ex=1;33:bd=34:cd=35:su=1;36:sg=1;37:tw=1;34:ow=1;34'

# Plugins (edit via .zsh_plugins.txt)
source ~/.zsh_plugins.sh

# vi-mode plugin
. $HOME/.zsh/plugins/vi-mode.zsh

# load NVM lazily
nvm() {
  if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    source "${NVM_DIR}/nvm.sh"
    if [[ -e ~/.nvm/alias/default ]]; then
      NVM_BIN=$(npm config --global get prefix)/bin
      PATH=$PATH:$NVM_BIN
    fi
    # invoke the real nvm function now
    nvm "$@"
  else
    echo "nvm is not installed" >&2
    return 1
  fi
}

source ~/.rvm/scripts/rvm

export GOPATH=$HOME/.go
export CABALPATH=$HOME/Library/Haskell/bin
export PYTHONPATH=$HOME/anaconda3/bin
export RVMPATH=$HOME/.rvm/bin

export PATH=$PYTHONPATH:/usr/local/bin:$HOME/.local/bin:$CABALPATH:$NPMPATH:$RVMPATH:$HOME/bin:$GOPATH/bin:$PATH
