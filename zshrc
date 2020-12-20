# prefer findutils
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

# prefer coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# prefer gnu-sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

# Assure that the .rbenv -related have higher precedence (i.e. when using tmux)
# then de-dup PATH variable.
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
typeset -U PATH

autoload -U compinit
compinit

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

# control-r search
bindkey "^R" history-incremental-search-backward

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

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

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"

source $HOME/.asdf/asdf.sh

# Java support
source $HOME/.asdf/plugins/java/set-java-home.zsh

# Dotnet support
source $HOME/.asdf/plugins/dotnet-core/set-dotnet-home.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bkaney/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bkaney/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bkaney/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bkaney/google-cloud-sdk/completion.zsh.inc'; fi
