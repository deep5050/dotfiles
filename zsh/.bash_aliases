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
alias cls='clear'

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


# Display the weather using wttr.in
alias weather='curl -s wttr.in'

# Display a calendar
alias calendar='cal'

# shellcheck shell=bash

# This file is automatically sourced by bash, and it's also sourced in .zshrc
# in order to keep the same aliases on both shells. So keep in mind that any
# code here must be compatible with bash and zsh.

if command -v kubectl >/dev/null; then
  alias kubectl="kubecolor"
fi

refreshenv() {
  local shell

  shell=$(ps -p $$ -ocomm=) &&
    exec "${shell}"
}

mcd() {
  local dir="$1"

  mkdir -p "${dir}" &&
    cd "${dir}"
}

cdr() {
  local repo="${1:-}"

  cd "${HOME}/repos/${repo}"
}

# See: https://github.com/twpayne/chezmoi/issues/854#issuecomment-675160348
chezmoi-re-run-scripts() { (
  set -ex

  rm -f "${HOME}/.config/chezmoi/chezmoistate.boltdb"
  chezmoi init --apply
); }

# Merge all ~/.kube/*.kubeconfig.yaml into ~/.kube/config
merge-kubeconfigs() {
  # shellcheck disable=SC2312
  KUBECONFIG="$(printf '%s:' "${HOME}"/.kube/*.kubeconfig.yaml | sed 's/:$//')" kubectl config view --flatten | tee "${HOME}/.kube/config"
}

#
gsudo() {
  local shell

  shell=$(ps -p $$ -ocomm=) &&
    gsudo.exe wsl -d "${WSL_DISTRO_NAME?}" -e "${shell}" "-c" "$*"
}

cdw() {
  local user_profile
  local win_home

  user_profile=$(wslvar USERPROFILE) &&
    win_home=$(wslpath "${user_profile}") &&
    cd "${win_home}"
}
#
