# ====================== INSTRUCTIONS ======================

# To source / load this file in your terminal

# 1. add lines below (source this) at the end of $HOME/.bashrc and $HOME/.profile
# (https://stackoverflow.com/questions/4952177/include-additional-files-in-bashrc)

# if [ -f $HOME/mybashrc.sh ]; then
#     . $HOME/mybashrc.sh
# fi

# 2. create a symbolic file at user's $HOME folder, pointing to this file

# $ ln -sT $(pwd)/mybashrc.sh $HOME/mybashrc.sh

# ===============================================

# ====================== "bin" folders ======================

# https://unix.stackexchange.com/q/316765/
PATH="$PATH:$HOME/.local/bin"

# add "personal" bin folder to $PATH
PATH="$PATH:$HOME/bin"

# add "snap" bin folder to $PATH
# PATH="$PATH:/snap/bin"

# ===============================================

# ====================== Python ======================

# pip, if is installed locally (--user), add $HOME/.local/bin/ to $PATH
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
  eval "$(pyenv init --path)"
  # eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
fi
# PYENV_VERSION

# pipenv
# export PIPENV_VENV_IN_PROJECT=True

# ===============================================

# ====================== Go (Golang) ======================

export GOROOT=/usr/local/go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
# export PATH=$PATH:$(go env GOPATH)/bin
# export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

alias gosrc="cd $HOME/go/src"

# ===============================================

# ====================== Google Cloud SDK ======================

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

# ====================== Docker Engine & Docker Compose ======================

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

# ====================== Custom prompt ======================

# https://twitter.com/captainsafia/status/868104255059750913
# https://gist.github.com/justintv/168835#gistcomment-3401716
# https://gist.github.com/justintv/168835#gistcomment-3554316
# https://gist.github.com/justintv/168835#gistcomment-3567209
# https://gist.github.com/justintv/168835#gistcomment-3718502
# https://ezprompt.net/
# https://gist.github.com/romanlevin/5e9422045bb6a5eb6558cbe371cd8635

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

function custom_prompt_as_before {
  # when using virtual envs
  # match string until first space so could catch another string
  # input  👉 (.venv) \[\033[38;5;21m\]\u\[\033[00m\]\[\033[38;5;33m\]@\[\033[00m\]\[\033[38;5;13m\]\h\[\033[00m\] \[\033[38;5;36m\]\w\[\033[00m\]>
  # output 👉 (.venv)
  TMP_ENV_NAME=`echo $PS1 | awk '{print $1}'`
  ENV_NAME=""
  if [[ $TMP_ENV_NAME == *"("* && $TMP_ENV_NAME == *")"* ]]; then
    ENV_NAME=$TMP_ENV_NAME
  fi

  # with RANDOM
  PS1=""
  PS1="$PS1\[\033[38;5;$(($(($RANDOM%$256))+1))m\]\u\[\033[00m\]"
  PS1="$PS1\[\033[38;5;$(($(($RANDOM%$256))+1))m\]@\[\033[00m\]"
  PS1="$PS1\[\033[38;5;$(($(($RANDOM%$256))+1))m\]\h\[\033[00m\]"
  PS1="$PS1 "
  PS1="$PS1\[\033[38;5;$(($(($RANDOM%$256))+1))m\][\w]\[\033[00m\]"

  # DT="\D{%Y-%m-%d} \t\[$(tput sgr0)\]"
  DT="\t\[$(tput sgr0)\]"

  if [ ! -z "$ENV_NAME" -a "$ENV_NAME" != " " ]; then
    # echo "$ENV_NAME is not null or space"
    PS1="$ENV_NAME $DT $PS1 \`parse_git_branch\`"
  else
    # echo "$ENV_NAME is null or space"
    PS1="$DT $PS1 \`parse_git_branch\`"
  fi

  PS1="$PS1> "
}

function custom_prompt {
  # https://tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html
  # \e == \033

  # Select Graphic Rendition parameters
  # 30–37 selected the foreground color
  # 40–47 selected the background color

  # prompt
   FMT_RESET="\[\e[0m\]"
    FMT_BOLD="\[\e[1m\]"
     FMT_DIM="\[\e[2m\]"
  FMT_NORMAL="\[\e[22m\]"

    FG_BLACK="\[\e[30m\]"
      FG_RED="\[\e[31m\]"
    FG_GREEN="\[\e[32m\]"
   FG_YELLOW="\[\e[33m\]"
     FG_BLUE="\[\e[34m\]"
  FG_MAGENTA="\[\e[35m\]"
     FG_CYAN="\[\e[36m\]"
    FG_WHITE="\[\e[37m\]"

    BG_BLACK="\[\e[40m\]"
      BG_RED="\[\e[41m\]"
    BG_GREEN="\[\e[42m\]"
   BG_YELLOW="\[\e[43m\]"
     BG_BLUE="\[\e[44m\]"
  BG_MAGENTA="\[\e[45m\]"
     BG_CYAN="\[\e[46m\]"
    BG_WHITE="\[\e[47m\]"

  FG_BRIGHT_WHITE="\[\e[97m\]"

  PS1="\n "
  PS1+="${FG_BLUE}╭─" # begin arrow to prompt
  PS1+="${FMT_RESET}${FG_CYAN}" # begin USERNAME container
  PS1+="${BG_CYAN} "
  PS1+="${BG_CYAN}👋" # print OS icon

  PS1+="${BG_CYAN} "
  # DT="\D{%Y-%m-%d} \t\[$(tput sgr0)\]"
  DT="\t\[$(tput sgr0)\]"
  PS1+="${BG_CYAN}${FG_BLACK}${DT}${FMT_NORMAL}"

  # not reliable enough
  # https://stackoverflow.com/q/1871549
  if [ ! -z "$VIRTUAL_ENV" -a "$VIRTUAL_ENV" != " " ]; then
    PS1+="${BG_CYAN} "
    PS1+="${BG_CYAN}${FG_BRIGHT_WHITE}($(basename ${VIRTUAL_ENV}))${FMT_NORMAL}"
  fi

  if command -v pyenv 1>/dev/null 2>&1; then
    if [[ `pyenv version-name` != "system" ]] ; then
      PYENV_VERSION="[🐍 `pyenv version-name`]"
      PS1+="${BG_CYAN} "
      PS1+="${BG_CYAN}${FG_BRIGHT_WHITE}${PYENV_VERSION}${FMT_NORMAL}"
    fi
  fi

  PS1+="${BG_CYAN} "

  PS1+="${FG_CYAN}${BG_MAGENTA}" # begin USERNAME container
  PS1+="${BG_MAGENTA} "
  PS1+="${FG_BRIGHT_WHITE}${FMT_BOLD}\u@\H${FMT_NORMAL}" # print username
  PS1+="${BG_MAGENTA} " # end USERNAME container

  PS1+="${FG_MAGENTA}${BG_BLUE}" # begin DIRECTORY container
  PS1+="${BG_BLUE} "
  PS1+="${FG_WHITE}\w${FMT_NORMAL}" # print directory
  PS1+="${BG_BLUE} " # end DIRECTORY container

  PS1+="${FG_BLUE}${BG_CYAN}" # begin FILES container
  PS1+="${BG_CYAN} "
  PS1+="${FG_BLACK}"
  PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type d | wc -l) " # print number of folders
  PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type f | wc -l) " # print number of files
  PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type l | wc -l) " # print number of symlinks
  PS1+="${FMT_RESET}${FG_CYAN}"

  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    PS1+="${BG_GREEN}"
    PS1+="${BG_GREEN} "
    PS1+="${BG_GREEN}${FG_BLACK}${FMT_NORMAL}"
    PS1+="${BG_GREEN} "
    PS1+="${BG_GREEN}${FG_BLACK}${BRANCH}${STAT}${FMT_RESET}"
    PS1+="${FG_GREEN}"
  fi

  PS1+="\n " # end last container (either FILES or BRANCH)
  PS1+="${FG_BLUE}╰ " # end arrow to prompt
  PS1+="${FG_CYAN}\\$ " # print prompt
  PS1+="${FMT_RESET}"
}
# PROMPT_COMMAND=custom_prompt_as_before
PROMPT_COMMAND=custom_prompt

# ===============================================

# =============== "history" command ======================

HISTSIZE=1000000
HISTFILESIZE=2000000
HISTINGORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T - '

# ===============================================

# =============== "z" command ======================

. $HOME/bin/z.sh

# ===============================================

# ====================== Git ======================

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

alias gitconfl="git config --list --local"
alias gitconfs="git config --list --system"
alias gitconfg="git config --list --global"
alias gitconfa="git config --list"

alias gitfetch="git fetch --all --tags --progress"
alias gitfetchprune="git fetch --prune --progress origin"

gitpull(){
  git pull origin $(git branch --show-current):$(git branch --show-current)
}

gitpush() {
  git push origin $(git branch --show-current):$(git branch --show-current)
}

# ===============================================

# ====================== apt - manage updates and upgrades ======================

myupd(){
  sudo apt update && sudo apt list --upgradable
  # -a gives too much info (rows / versions) for some packages, like code and code-insiders
}

myupg(){
  # What is “dist-upgrade” and why does it upgrade more than “upgrade”?
  # https://askubuntu.com/questions/81585/what-is-dist-upgrade-and-why-does-it-upgrade-more-than-upgrade
  sudo apt full-upgrade -y --allow-downgrades
  # sudo apt upgrade -y && sudo apt dist-upgrade -y

  # What is difference between the options “autoclean”, “autoremove” and “clean”?
  # https://askubuntu.com/questions/3167/what-is-difference-between-the-options-autoclean-autoremove-and-clean
  sudo apt autoclean -y && sudo apt autoremove -y
}

myfwupd(){
  sudo fwupdmgr get-devices
  sudo fwupdmgr get-updates
  sudo fwupdmgr update
  sudo reboot now
}

# ===============================================

# ====================== deactivate unicode code point ======================

# deactivate unicode code point
# https://unix.stackexchange.com/a/626136/309458
# https://superuser.com/q/358749/
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# ===============================================

# ====================== final ones ======================

myip() {
  curl -4 ifconfig.co
}

alias dw="cd $HOME/Downloads"

alias ytmp4="youtube-dl -f 'mp4[height=720]+bestaudio'"
alias ytmp3="youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0"

alias open=xdg-open

# ===============================================

if [ -f $HOME/extras.sh ]; then
  . $HOME/extras.sh
fi
