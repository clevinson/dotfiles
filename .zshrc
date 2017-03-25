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
export KEYTIMEOUT=1

# Pluginzzzz
. $HOME/.zsh/plugins/bd/bd.zsh # bd via the spotify Luigi dude
. $HOME/.zsh/plugins/zsh-git-prompt/zshrc.sh # via github.com/oliververdier/zsh-git-prompt
. $HOME/.zsh/plugins/vi-mode.zsh # vi-mode / edited by meee
#. /Users/cory/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

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

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# add gem bin path from nix's gem binary
# GEM_BIN=$(gem env | grep EXECUTABLE\ DIRECTORY | sed 's;.*EXECUTABLE DIRECTORY: \(.*\);\1;g')
export GOPATH=$HOME/.go
export PATH=$HOME/.local/bin:$HOME/.cabal/bin:$HOME/anaconda/bin:$HOME/bin:$GOPATH/bin:/usr/local/bin:$PATH
export SBT_OPTS=-XX:MaxPermSize=512m
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

alias docker-clean='docker rm -v $(docker ps -a -q -f status=exited)'
alias denv='eval $(docker-machine env default)'
alias l='ls -lh'
alias vim='nvim'

mount-whatbox() {
  umount /Volumes/Whatbox
  mkdir -p /Volumes/Whatbox
  sshfs -o reconnect -o volname=Whatbox famusmockingbird@soup.whatbox.ca:files /Volumes/Whatbox
}

# The next line updates PATH for the Google Cloud SDK.
source '/Users/cory/Code/google/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/cory/Code/google/google-cloud-sdk/completion.zsh.inc'

export CLICOLOR=1
export LSCOLORS="exBxfxdxDxexfxGxHxExEx"
export PS1="%{$fg[green]%}%1~ %{$reset_color%}; "

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'di=34:ln=1;31:so=35:pi=33:ex=1;33:bd=34:cd=35:su=1;36:sg=1;37:tw=1;34:ow=1;34'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
