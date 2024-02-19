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
alias tree="tree --gitignore"


# Enable history with timestamp
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
HISTFILESIZE=10000
HISTSIZE=1000
#export PROMPT_COMMAND='history'
alias history='history | tail -n 20'
alias cls="clear"

alias update='sudo apt update && sudo apt upgrade'
alias install='sudo apt install'

# Git log with a nice format
alias glog='git log --oneline --graph --all --decorate'

# Show disk usage in a human-readable format
alias duh='du -h --max-depth=1 | sort -hr'


# Display the weather using wttr.in
alias weather='curl -s wttr.in'

# Display a calendar
alias calendar='cal'


mcd() {
    local dir="$1"
    mkdir -p "${dir}" &&
    cd "${dir}"
}

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

# Function to create a backup of a file
backup() {
  cp "$1" "$1.bak"
}


# Function to quickly create a new Python virtual environment
mkvenv() {
  python3 -m venv "$1"
  source "$1/bin/activate"
}

# Function to convert Markdown to HTML using Pandoc
md2html() {
  pandoc -s "$1" -o "${1%.md}.html"
}

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
