function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

alias tf=terraform
alias k=kubectl
alias kx=kubectx
alias ks=kubens
#interactive colorized find with preview
alias search="fzf --preview='batcat --color=always {}'"

#kubectl specific commands
alias do="--dry-run=client -o yaml"    # k create deploy nginx --image=nginx $do

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

#oracle client
export LD_LIBRARY_PATH=/opt/oracle/instantclient_21_8:$LD_LIBRARY_PATH
export PATH=/opt/oracle/instantclient_21_8:$PATH

#velero autocompletation
source <(velero completion bash)

#smart cd with zoxide
eval "$(zoxide init bash)"

#direnv for storing env variables in local dirs
eval "$(direnv hook bash)"

