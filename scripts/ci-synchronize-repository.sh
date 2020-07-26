#!/usr/bin/env sh
set -e

BRANCH_LIST="master dev-master dev-staging develop"

git_check(){
    echo "--------------------------------------------------"
    echo " Git Checkout                     "
    echo " Repository Source: $GIT_SYNC_URL "
    echo "--------------------------------------------------"
    echo ">> git ls-remote $GIT_SYNC_URL"
    git ls-remote $GIT_SYNC_URL
    echo "--- DONE ---"
}

get_all(){
    echo "--------------------------------------------------"
    echo " Pull All Branches & Tags "
    echo " Branch: $GIT_SYNC_BRANCH "
    echo "--------------------------------------------------"
    echo ">> git clone $GIT_SYNC_URL"
    git clone $GIT_SYNC_URL
    cd xone-coin
    for BRANCH in $BRANCH_LIST
    do
      echo ">> git checkout $BRANCH"
      git checkout $BRANCH
      echo "---"
    done
    echo ">> git fetch --all && git pull --all && git pull --tags"
    git fetch --all
    git pull --all
    git pull --tags
    echo "--------------------------------------------------"
    echo "--- DONE ---"
}

push_repo(){
    echo "--------------------------------------------------"
    echo " Push Repo Changes                   "
    echo " Repository Target: $GIT_SYNC_TARGET "
    echo "--------------------------------------------------"
    echo ">> git remote set-url origin $GIT_SYNC_TARGET"
    git remote set-url origin $GIT_SYNC_TARGET
    echo ">> git remote -v"
    git remote -v
    echo ">> git push --all -u && git push --tags -f"
    git push --all -u && git push --tags -f
    echo "--------------------------------------------------"
    echo "--- DONE ---"
}

synchronize_git(){
    git_check $GIT_SYNC_URL
    echo ""
    get_all $GIT_SYNC_BRANCH $GIT_SYNC_URL
    echo ""
    push_repo $GIT_SYNC_TARGET
    echo ""
    echo "--------------------------------------------------"
    echo " Finish At : `date`"
    echo "--------------------------------------------------"
    echo "--- SUCCESS ALL DONE --- "
    echo ""
}

main(){
    export GIT_SYNC_URL=$1
    export GIT_SYNC_BRANCH=$2
    export GIT_SYNC_TARGET=$3
    synchronize_git $GIT_SYNC_URL $GIT_SYNC_BRANCH $GIT_SYNC_TARGET
}

### START HERE ###
main $1 $2 $3


### How Execute Bash ####
# ./ci-synchronize-repository.sh [url_git] [branch_name]
