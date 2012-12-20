export PATH=$HOME/bin:/usr/local/heroku/bin:/usr/local/bin:$PATH

autoload -U compinit
compinit

eval "$(rbenv init -)"

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# awesome cd movements from zshkit
setopt autocd
setopt autopushd pushdminus pushdsilent pushdtohome
setopt cdablevars

# Try to correct command line spelling
setopt correct correct_all

# Enable extended globbing
setopt extended_glob

# Hisotry-related
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.zsh_history

setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_verify
setopt extended_history

set -o vi
