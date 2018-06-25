alias k='kubectl'
alias kg='k get'
alias kd='k describe'
alias kl='k logs'
alias ka='k apply -f'
alias ksys='k -n=kube-system'
alias krm='k delete'
alias ktx='kubectx'

alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcui='docker-compose up --allow-insecure-ssl'

alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gl='git log --oneline'
alias gco='git checkout'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gsp='git stash pop'
alias gpo='git push --set-upstream origin'

export USER=spatel
export LIBRARYPATH=/Users/${USER}/Library
export TERRAFORMPATH=${LIBRARYPATH}/Terraform
export PYTHONPATH=${LIBRARYPATH}/Python/3.6
export GOPATH=${LIBRARYPATH}/go
export GOGITHUB=${GOPATH}/src/github.com
export ARKPATH=${GOGITHUB}/heptio/ark/_output/bin/darwin/amd64/
export ISTIOPATH=/Users/${USER}/istio/istio-0.7.1
export FABRIC8PATH=/Users/${USER}/.fabric8
export SBINPATH=/usr/local/sbin
export PATH=${PYTHONPATH}/bin:${GOPATH}/bin:${ARKPATH}:${ISTIOPATH}/bin:${FABRIC8PATH}/bin:${SBINPATH}:${PATH}

export JX=${GOGITHUB}/jenkins-x/jx/build/jx

export EDITOR=vi
export GPG_TTY=$(tty)
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/spatel/google-cloud-sdk/path.bash.inc' ]; then source '/Users/spatel/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/spatel/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/spatel/google-cloud-sdk/completion.bash.inc'; fi

helmins() {
  ksys create serviceaccount tiller
  k create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
  helm init --service-account=tiller
}
helmdel() {
  ksys delete deployment tiller-deploy
  krm clusterrolebinding tiller
  ksys delete serviceaccount tiller
}
getGitToken() {
  git config --global github.token
}

bind Space:magic-space

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
