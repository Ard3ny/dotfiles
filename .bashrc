#bash_history configuration
# Save 5,000 lines of history in memory
HISTSIZE=10000
# Save 2,000,000 lines of history to disk (will have to grep ~/.bash_history for full listing)
HISTFILESIZE=2000000
# Append to history instead of overwrite
shopt -s histappend
# Ignore redundant or space commands
HISTCONTROL=ignoreboth
# Ignore more
HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'
# Set time format
HISTTIMEFORMAT='%F %T '
# Multiple commands on one line show up as a single line
shopt -s cmdhist
# Append new history lines, clear the history list, re-read the history list, print prompt.
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


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

