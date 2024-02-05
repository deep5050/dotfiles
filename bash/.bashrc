# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    # --------------------- below one
    #PS1='\W $(__git_ps1 "(\[\e[35m\]%s\[\e[m\])") $ '
    PS1='\W\[\e[32m\] \$ \[\e[m\]'
    #PS1='\W \$ '
    #PS1='\[\e[36m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\]:\[\e[33;1m\]\w\[\e[m\]$(__git_ps1 " (\[\e[35m\]%s\[\e[m\])")\$ '
    #PS1='\[\e[32m\]\u\[\e[0m\]@\[\e[97m\]\W > '
    #PS1='\[\e[32m\]\u\[\e[0m\]@\[\e[33m\]\W\[\e[0m\] > '

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need t eval "$(thefuck --alias)"o enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Created by `pipx` on 2023-10-31 08:52:45
export PATH="$PATH:/home/deep/.local/bin"

######################## custom aliases ####################

# Function to search for a file in the current directory and its subdirectories
ff() {
  find . -type f -name "$1"
}

# Function to extract compressed files
extract() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.tar.xz)    tar xJf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Function to compress files or directories
compress() {
  tar -czvf "$1.tar.gz" "$1"
}




# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git pull'
alias gpush='git push'

eval "$(zoxide init bash)"
eval "$(thefuck --alias)"
alias cd=z
alias ls=lsd
alias ll="lsd -la"
alias show=batcat
alias zz="z -"
alias .=pwd
alias ".."="z .."
alias "..."="z ./../../../"
alias vi=nvim
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
alias tree="tree --gitignore"


# Function to create a backup of a file
backup() {
  cp "$1" "$1.bak"
}


# Enable history with timestamp
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
HISTFILESIZE=10000
HISTSIZE=1000
#export PROMPT_COMMAND='history'
alias history='history | tail -n 20'


alias update='sudo apt update && sudo apt upgrade'
alias install='sudo apt install'

# Git log with a nice format
alias glog='git log --oneline --graph --all --decorate'

# Show disk usage in a human-readable format
alias duh='du -h --max-depth=1 | sort -hr'


# Function to quickly create a new Python virtual environment
mkvenv() {
  python3 -m venv "$1"
  source "$1/bin/activate"
}


# Function to convert Markdown to HTML using Pandoc
md2html() {
  pandoc -s "$1" -o "${1%.md}.html"
}

# Display a random programming joke
alias joke='curl -s https://v2.jokeapi.dev/joke/Programming?format=txt'

# Display the weather using wttr.in
alias weather='curl -s wttr.in'

# Display a calendar
alias calendar='cal'

# Function to search for and install a package in apt
#searchinstall() {
#  sudo apt search "$1" && sudo apt install "$1"
#}


# Function to display the public IP address
publicip() {
  curl -s ifconfig.me
}


organize_type() {
    bash ~/scripts/util_organize_files_by_types.sh $1
}


organize_name() {
    bash ~/scripts/util_organize_files_by_names.sh $1
}

organize_size() {
    bash ~/scripts/util_organize_files_by_sizes.sh $1
}


organize_revert() {
    bash ~/scripts/util_organize_files_revert.sh $1
}

gist() {
  bash ~/scripts/upload_gist.sh $1 $2

}
echo "Hi, $(whoami)! welcome :)";

