#!/usr/bin/env sh
set -e

setup_key(){
    echo "--------------------------------------------------"
    echo " Setup SSH-Key "
    echo "--------------------------------------------------"
    ### SETUP SSH ###
    apt-get update -qq
    apt-get install -qq git
    'which ssh-agent || ( apt-get install -qq openssh-client )'
    mkdir -p ~/.ssh
    # (umask  077 ; echo ${SSH_PRIVATE_KEY} | base64 --decode > ~/.ssh/id_rsa)
    # (umask  077 ; echo ${KNOWN_HOSTS} | base64 --decode > ~/.ssh/known_hosts)
    echo "${SSH_PRIVATE_KEY}" | base64 --decode > ~/.ssh/id_rsa
    echo "${KNOWN_HOSTS}" | base64 --decode > ~/.ssh/known_hosts
    chmod 700 ~/.ssh/id_rsa
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ssh-keyscan -H 'bitbucket.org' >> ~/.ssh/known_hosts
    chmod 644 ~/.ssh/known_hosts
    echo "--------------------------------------------------"
    echo "--- DONE ---"
    echo ""
}

install_library(){
    echo "--------------------------------------------------"
    echo " Install Library "
    echo "--------------------------------------------------"
    ### INSTALL LIBRARY ###
    gem install bundler
    bundle install
    echo "--------------------------------------------------"
    echo "--- DONE ---"
    echo ""
    echo "--------------------------------------------------"
    echo " Finish At : `date`"
    echo "--------------------------------------------------"
    echo "--- SUCCESS ALL DONE --- "
    echo ""
}

main(){
    export SSH_PRIVATE_KEY=$1
    export KNOWN_HOSTS=$2
    # echo "--------------------------------------------------"
    # echo " Private Key "
    # echo "--------------------------------------------------"
    # echo "${SSH_PRIVATE_KEY}"
    # echo ""
    # echo "--------------------------------------------------"
    # echo " Known Hosts "
    # echo "--------------------------------------------------"
    # echo "${KNOWN_HOSTS}"
    # echo ""
    setup_key ${SSH_PRIVATE_KEY} ${KNOWN_HOSTS}
    install_library
}

### START HERE ###
main $1 $2


### How Execute Bash ####
# ./ci-bitbucket-preparation.sh [ssh_private_key] [known_hosts]
