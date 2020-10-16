alias swp="sudo swapoff --all && sudo swapon --all"
alias inst="sudo apt -y install"

alias dc="docker ps"
alias di="docker images"
alias dv="docker volume ls"
alias dn="docker network ls"
alias dcc="docker ps -aq | xargs -r docker rm -f"
alias dcn="docker network ls -q | xargs -r docker network rm 2> /dev/null"
alias dci="docker images -q | xargs -r docker rmi -f"
alias dcdi="docker images -f dangling=true -q | xargs -r docker rmi"
alias dcv="docker volume ls -q | xargs -r docker volume rm -f"
alias db="DOCKER_BUILDKIT=1 docker build"

alias qdk="docker run -it --rm -w /app --net host -v \$(pwd):/app"

alias kg="kubectl get"
alias kgns="kubectl get --namespace"
alias kgan="kubectl get --all-namespaces"
alias kd="kubectl describe"
alias kcr="kubectl create"
alias krm="kubectl delete"
alias klo="kubectl logs"
alias kex="kubectl exec"
alias ka="kubectl apply"

alias cpy="xclip -sel c"
