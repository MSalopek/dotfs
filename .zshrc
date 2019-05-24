export ZPLUG_HOME=$HOME/.zplug
if [[ ! -d $ZPLUG_HOME ]]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

source $ZPLUG_HOME/init.zsh

if [[ -f $HOME/.zshrc.local ]]; then
	source $HOME/.zshrc.local
fi


zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
# zplug "zsh-users/zsh-autosuggestions"

#d prints the contents of the directory stack.
#1 ... 9 changes the directory to the n previous one.
zplug "zsh-users/prezto", use:"modules/{utility,directory,git,environment,editor,history,completion}"

# zplug 'eendroroy/alien-minimal', as:theme
zplug "dracula/zsh", as:theme
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'cursor' \
  'root'
zplug "plugins/wd",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/colored-man-pages",   from:oh-my-zsh
zplug "plugins/fasd",   from:oh-my-zsh
zplug "djui/alias-tips"
zplug "unixorn/git-extra-commands"
zplug "clvv/fasd", as:command, hook-build:"PREFIX=$HOME/.local make install"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "junegunn/fzf", use:"shell/key-bindings.zsh", defer:3
fpath=($HOME/.zplug/repos/littleq0903/gcloud-zsh-completion/src $fpath)

zplug load #--verbose
zplug check --verbose
if [ ! $? -eq 0 ]; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

export HISTSIZE=1000000
export SAVEHIST=1000000

zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
setopt no_complete_aliases
setopt HIST_IGNORE_DUPS

for p in "$HOME/.local/bin" "$HOME/bin" "$ZPLUG_BIN"; do
  if [ -d $p ]; then
    export PATH=$p:$PATH
  fi
done

for p in "$HOME/.local/man" "$HOME/.local/share/man"; do
  if [ -d $p ]; then
    export MANPATH=$p:$MANPATH
  fi
done

ZSH_THEME="dracula"

# setup golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
PATH=$PATH:$GOPATH:$GOBIN
export PATH

# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# set aliasing
alias ls='ls -a --color=auto'
alias gia='git add'
alias gc='git commit'
alias gp='git push'
alias gss='git status'
alias gst='git stash'
alias cd..='cd ..'
alias top='htop'

unsetopt correct

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
