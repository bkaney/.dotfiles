export PATH=$HOME/.bin:/usr/local/bin:/usr/local/bin:$PATH

# Assure that the .rbenv -related have higher precedence (i.e. when using tmux)
# then de-dup PATH variable.
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
typeset -U PATH

autoload -U compinit
compinit

# rbenv start
eval "$(rbenv init -)"

# use vim as an editor
export EDITOR=vim

# use vim mode
set -o vi

# color support for less/more
export LESS="--ignore-case --quiet --chop-long-lines --quit-if-one-screen --no-init --raw-control-chars"

# awesome cd movements from zshkit
setopt autocd
setopt autopushd pushdminus pushdsilent pushdtohome
setopt cdablevars

# Try to correct command line spelling
setopt correct correct_all

# Enable extended globbing
setopt extended_glob

# History-related
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.zsh_history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY

export IRBRC=$HOME/.irbrc

# additional configuration
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

if [ -e "$HOME/.hitch" ]; then
  source "$HOME/.hitch"
fi

if [ -e "$HOME/.dockerrc" ]; then
  source "$HOME/.dockerrc"
fi

if [ -e "$HOME/.promptrc" ]; then
  source "$HOME/.promptrc"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
