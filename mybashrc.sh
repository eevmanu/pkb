# INSTRUCTIONS

# To load this instructions in your terminal

# 1.
# source this file at user'sn $HOME/.bashrc file
# (https://stackoverflow.com/questions/4952177/include-additional-files-in-bashrc)
# add lines below at the end of $HOME/.bashrc file
# if [ -f $HOME/mybashrc.sh ]; then
#     . $HOME/mybashrc.sh
# fi

# 2.
# create a symbolic file at user's $HOME folder, pointing to this file
# $ ln -sT $(pwd)/mybashrc.sh $HOME/mybashrc.sh

# ====================== "bin" folders

# add bin directory from user's $HOME to $PATH
PATH="$PATH:$HOME/.local/bin"

# add personal bin folder (where I put personal useful binaries) to $PATH
PATH="$PATH:$HOME/bin"

# if `snap` is installed
# add snap bin folder to $PATH
# PATH="$PATH:/snap/bin"

# add exiftool bin folder to $PATH
# if you don't have `su` access, you can run ExifTool in your own account by
# moving "exiftool" and its "lib" directory to any convenient location,
# preferably somewhere in your PATH.
# PATH="$PATH:$HOME/bin/exiftool"
# https://exiftool.org/install.html#Unix
# docs - https://exiftool.org/exiftool_pod.html
# releases - https://github.com/exiftool/exiftool/releases

# ===============================================

# ====================== Python

# pip
# if `pip` is installed locally
# add $HOME/.local/bin/ to $PATH
# PATH="$PATH:$HOME/.local/bin"

# virtualenv + virtualenvwrapper
# ------------------------------------------------
# when `python` command location is at /usr/bin/python and, most commonly, point to Python 2
# and pip is installed globally
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
# export WORKON_HOME=$HOME/Envs
# mkdir -p $WORKON_HOME
# source /usr/local/bin/virtualenvwrapper.sh
# ------------------------------------------------
# when `python` command location is at /usr/bin/python and, most commonly, point to Python 3
# and pip is installed globally
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# export WORKON_HOME=$HOME/Envs
# mkdir -p $WORKON_HOME
# source /usr/local/bin/virtualenvwrapper.sh
# ------------------------------------------------
# when pip is installed locally
# export VIRTUALENVWRAPPER_PYTHON=$HOME/bin/python
# export WORKON_HOME=$HOME/Envs
# mkdir -p $WORKON_HOME
# source $HOME/.local/bin/virtualenvwrapper.sh
# ------------------------------------------------

# pyenv
# PYENV_DEBUG
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
fi
# PYENV_VERSION

# pipenv
# export PIPENV_VENV_IN_PROJECT=True

# ===============================================

# ====================== Go (Golang)

export GOROOT=/usr/local/go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
# export PATH=$PATH:$(go env GOPATH)/bin
# export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

alias gosrc="cd $HOME/go/src"

# ===============================================

# ====================== Google Cloud SDK

# https://cloud.google.com/sdk/docs/downloads-apt-get
# https://cloud.google.com/sdk/docs/downloads-snap
# https://cloud.google.com/sdk/docs/downloads-docker

# alias to connect a GCP server
# alias srv="gcloud \
#   --project {{ project name}} \
#   compute ssh \
#     --zone {{ server zone}} \
#     {{ server name}} \
#       -- '{{ command to execute}}'"

# ===============================================

# ====================== Docker Engine & Docker Compose

function dockerpid() {
  docker inspect --format '{{ .State.Pid }}' $1
}

function dockerip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1
}

alias dc="docker-compose"
alias dcup="docker-compose up -d"
alias dcstop="docker-compose stop"
alias dcrun="docker-compose run"
alias dcrm="docker-compose rm -f"
alias dclogs="docker-compose logs -ft --tail=10"

# function dclogs() {
#   if [ $# -eq 0 ]; then
#     docker-compose logs -ft --tail=10
#   else
#     docker-compose logs -ft --tail=10 $1
#   fi
# }

# ===============================================

# ====================== Colorful ever-changing prompt

# https://twitter.com/captainsafia/status/868104255059750913
function prompt_party {
  # when using virtual envs
  # match string until first space so could catch another string
  ENV_NAME=`echo $PS1 | awk '{print $1}'`
  ENV_NAME="$ENV_NAME "

  # sudo apt install athena-jot
  # PS1="\[\033[38;5;$(jot -r 1 1 256)m\]\u\[\033[00m\]"
  # PS1="$PS1\[\033[38;5;$(jot -r 1 1 256)m\]@\[\033[00m\]"
  # PS1="$PS1\[\033[38;5;$(jot -r 1 1 256)m\]\h\[\033[00m\] "
  # PS1="$PS1\[\033[38;5;$(jot -r 1 1 256)m\]\w\[\033[00m\]> "

  # with shuf
  # PS1="\[\033[38;5;$(shuf -i1-256 -n1)m\]\u\[\033[00m\]"
  # PS1="$PS1\[\033[38;5;$(shuf -i1-256 -n1)m\]@\[\033[00m\]"
  # PS1="$PS1\[\033[38;5;$(shuf -i1-256 -n1)m\]\h\[\033[00m\] "
  # PS1="$PS1\[\033[38;5;$(shuf -i1-256 -n1)m\]\w\[\033[00m\]> "

  # with RANDOM
  PS1="\[\033[38;5;$(($(($RANDOM%$256))+1))m\]\u\[\033[00m\]"
  PS1="$PS1\[\033[38;5;$(($(($RANDOM%$256))+1))m\]@\[\033[00m\]"
  PS1="$PS1\[\033[38;5;$(($(($RANDOM%$256))+1))m\]\h\[\033[00m\] "
  PS1="$PS1\[\033[38;5;$(($(($RANDOM%$256))+1))m\]\w\[\033[00m\]> "
  PS1="$ENV_NAME$PS1"
}
PROMPT_COMMAND=prompt_party

# ===============================================

# =============== "history" command

HISTSIZE=1000000
HISTFILESIZE=2000000
HISTINGORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T - '

# ===============================================

# =============== "z" command

. $HOME/bin/z.sh

# ===============================================

# =============== Git

# in case miswrite `git`
alias gti="git"

git config --global alias.st status
alias gitst="git status"

gitlogformat="log \
  --pretty=format:'[%C(auto)%h] - %d %s %Cgreen(%cr) %C(bold blue)<%an> %Creset' \
  --graph \
  --abbrev-commit"
git config --global alias.lg "$gitlogformat"
alias gitlg="git $gitlogformat"

alias gitft="git fetch --all; git fetch --prune"

# ===============================================

# ====================== Manage updates

alias myupdate="sudo apt update; apt list --upgradable"
# -a gives too much info (rows / versions) for some packages, like code and code-insiders
# alias myupdate="sudo apt update; apt list --upgradable -a"
alias myupgrade="sudo apt upgrade -y; sudo apt autoremove -y"

# ===============================================

# ====================== EXTRAS

myts() {
  echo "$(date +"%Y-%m-%d_%H-%M-%S")" | xclip -quiet -selection clipboard
  # echo "$(date +"%Y-%m-%d %H:%M:%S")" | xclip -selection clipboard
}
myday() {
  echo "$(date +"%Y-%m-%d")" | xclip -quiet -selection clipboard
}
# TODO
# mytsdk() {
#   echo "$(date +"%Y-%m-%d_%H-%-%S")" | xclip -selection clipboard
# }
# [Desktop Entry]
# Type=Application
# Version=0.0.1
# Name=My Timestamp
# Comment=Copy timestamp to clipboard
# Exec=mytsdk
# Terminal=false
# Categories=Utility;
# touch $HOME/.local/share/applications/mytsdk.desktop
# nano $HOME/.local/share/applications/mytsdk.desktop
# update-desktop-database $HOME/.local/share/applications/

myip() {
  curl -4 ifconfig.co
}

alias dw="cd $HOME/Downloads"

alias ytmp4="youtube-dl -f 'mp4[height=720]+bestaudio'"
alias ytmp3="youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0"

alias open=xdg-open

# ===============================================

if [ -f extras.sh ]; then
  . extras.sh
fi
