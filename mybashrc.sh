# To import this file from .bashrc
# 1. add sourcing on $HOME/.bashrc file (https://stackoverflow.com/questions/4952177/include-additional-files-in-bashrc)
# at the end of $HOME/.bashrc file, add:
# if [ -f $HOME/mybashrc.sh ]; then
#     . $HOME/mybashrc.sh
# fi
# 2. create symbolic file
# ln -sT $(pwd)/mybashrc.sh $HOME/mybashrc.sh

# ====================== "bin" folders

# add user bin directories to PATH
# install pip in local $HOME folder
PATH="$PATH:$HOME/.local/bin"
# install my personal stuffs I want to add in my PATH
PATH="$PATH:$HOME/bin"

# add exiftool bin to PATH
# https://exiftool.org/install.html#Unix
# docs - https://exiftool.org/exiftool_pod.html
# releases - https://github.com/exiftool/exiftool/releases
# If you don't have su access, you can run ExifTool in your own account by moving "exiftool" and its "lib" directory to any convenient location, preferably somewhere in your PATH.
PATH="$HOME/bin/exiftool:$PATH"

# ===============================================

# ====================== Python

# "virtualenv + virtualenvwrapper"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=$HOME/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

# "pipenv"
# export PIPENV_VENV_IN_PROJECT=True

# alias pyXY=pythonX.Y
# alias pipXY=pipX.Y
# e.g.
alias py27=python2.7
alias py27v="python2.7 --version"
alias pip27=pip2.7
alias py35=python3.5
alias py35v="python3.5 --version"
alias pip35=pip3.5
alias py36=python3.6
alias py36v="python3.6 --version"
alias pip36=pip3.6
alias py37=python3.7
alias py37v="python3.7 --version"
alias pip37=pip3.7
alias py38=python3.8
alias py38v="python3.8 --version"
alias pip38=pip3.8
alias py39=python3.9
alias py39v="python3.9 --version"
alias pip39=pip3.9

# ===============================================

# ====================== Go

export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/go"
export PATH=$PATH:$(go env GOPATH)/bin

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
# Step 1:
# sudo apt install athena-jot
# Step 2:
function prompt_party {
  PS1="\[\033[38;5;$(jot -r 1 1 256)m\]\u\[\033[00m\]"
  PS1="$PS1\[\033[38;5;$(jot -r 1 1 256)m\]@\[\033[00m\]"
  PS1="$PS1\[\033[38;5;$(jot -r 1 1 256)m\]\h\[\033[00m\] "
  PS1="$PS1\[\033[38;5;$(jot -r 1 1 256)m\]\w\[\033[00m\]> "
}
# Step 3:
PROMPT_COMMAND=prompt_party

# ===============================================

# =============== "history" command

HISTSIZE=1000
HISTFILESIZE=2000
HISTINGORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T - '

# ===============================================

# =============== "z" command

# https://github.com/rupa/z
. $HOME/bin/z

# ===============================================

# ====================== EXTRAS

myts() {
  TMP="($(date +"%Y-%m-%d %H:%M:%S"))"
  echo "${TMP}"
  echo "${TMP}" | xclip -selection clipboard
}
mytswin() {
  TMP="($(date +"%Y-%m-%d_%H-%M-%S"))"
  echo "${TMP}"
  echo "${TMP}" | xclip -selection clipboard
}
myday() {
  TMP="($(date +"%Y-%m-%d"))"
  echo "${TMP}"
  echo "${TMP}" | xclip -selection clipboard
}
myip() {
  curl -4 ifconfig.co
}

alias myupdate="sudo apt update; apt list --upgradable -a"
alias myupgrade="sudo apt upgrade -y"

alias dw="cd $HOME/Downloads"

alias gitft="git fetch --all; git fetch --prune"

alias ytmp3="youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0"

# ===============================================

if [ -f extras.sh ]; then
  . extras.sh
fi
