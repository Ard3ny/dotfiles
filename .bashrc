function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

alias tf=terraform
alias k=kubectl
alias kx=kubectx
alias ks=kubens

#kubectl autocompletition under alias k
source <(kubectl completion bash | sed 's/kubectl/k/g')

#fzf interactive bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#load brew as env
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

#oci client autocompletation
[[ -e "/home/<user>/lib/oracle-cli/lib/python3.10/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/<user>/lib/oracle-cli/lib/python3.10/site-packages/oci_cli/bin/oci_autocomplete.sh"


#krew plugin manager for kubect;
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#starship
eval "$(starship init bash)"