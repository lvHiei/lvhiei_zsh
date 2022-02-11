
## git alias
function func_gp(){
    branch=`git symbolic-ref --short -q HEAD`
    echo "current branch is $branch"
    remote_branch=`git branch -a | grep -w remotes/origin/$branch | sed "s/ *$//g" | sed "s/ *//g"`
    echo "remote branch is $remote_branch"
    if [[ "$remote_branch" == "remotes/origin/$branch" ]]; 
    then
        echo "already has remote branch"
        git push
    else
        echo "set upstream for $branch"
        git push --set-upstream origin $branch 
    fi
}

function func_gsf(){
    commit_id="HEAD"
    if [ $# -ge 1 ];
    then
        commit_id=$1
    fi
#    parent=`git rev-parse ${commit_id}^`
#    echo "commit_id is $commit_id, parent is $parent"
#    git diff --name-only $parent $commit_id
    git diff --name-only ${commit_id}^ $commit_id
}

function func_gsb(){
    commit_id="HEAD"
    if [ $# -ge 1 ];
    then
        commit_id=$1
    fi
    git branch -r --contains ${commit_id} 
}

function gplb(){
    branch=`git symbolic-ref --short -q HEAD`
    git pull -p --rebase origin $branch
    git submodule update --init --recursive
}

function gdf(){
    commit_id="HEAD"
    file_name=$1
    if [ $# -ge 2 ];
    then
        commit_id=$1
        file_name=$2
    fi
    git diff ${commit_id}^:${file_name} ${commit_id}:${file_name}
}

function func_gga(){
    author=majun
    if [ $# -ge 1 ];
    then
        author=$1
    fi
    git lg --author=$author
}

function gfixEncountered(){
    git rm --cached -r .
    git reset --hard
    git rm .gitattributes
    git reset .
    git checkout .
}

function show_rtc_interface_change(){
    if [ $# -lt 2 ];
    then
        echo "usage: $0 dst_commit compared_commit"
    fi
    dst_commit=$1
    compare_commit=$2
    git diff ${dst_commit} ${compare_commit} src/sdk/native/rtc
}

alias gg='git lg'
alias gga='func_gga'
alias gglt='git lglt'
alias ggf='git lgf'
alias gs='git show'
alias gsm='git submodule'
alias gpr='git pull --rebase'
alias gcob='gco -b'
alias gprf='git pull origin $1 --rebase'
alias grp='git remote prune origin'
alias gpl='git pull -p --rebase;git submodule update --init --recursive'
#alias gpl='git pull;grp;gsm update --init;gsm foreach git submodule update --init'
alias gpls='git pull -p --rebase;git submodule sync --recursive;git submodule update --init --recursive'
alias gfb='git branch -a | ag'
alias gdc='git diff --cached'
alias gssp='git stash show -p'
alias gbdr='func_gbdr(){git branch -D $1;git push origin :$1};func_gbdr'
#alias gbdr='func_gbdr(){git branch -D $1;git push origin --delete $1};func_gbdr'
alias gcos='func_gcos(){gco $1 && git submodule init && git submodule update};func_gcos'
alias gp='func_gp'
## show changed file list in commit_id
alias gsf='func_gsf'
## show branches contains commit_id
alias gsb='func_gsb'

## bytertc git relies


## byte git alias
RTC_ABS_PATH=/Users/mj/project/ByteRTCSDK
RTC_REALX_ABS_PATH=$RTC_ABS_PATH/realx
function gcortc(){
    git fetch
    gco $1
    gpl
    realx_commit_id=`cat .gitlab-ci_new.yml | grep "realx_branch:" | sed "s/ *$//g" | sed "s/realx_branch://g" | sed "s/ *//g"`
    echo "realx branch is $realx_commit_id"
    cd realx
    git fetch
    gco $realx_commit_id
    gpl
    cd ..
}

#alias gcortc='func_gcortc(){ gpl && gco $1 && gpl && cd $RTC_REALX_ABS_PATH && gpl && gco $1 && gpl && cd $RTC_ABS_PATH;};func_gcortc'
LC_ABS_PATH=/Users/mj/project/velive
LC_BAF_ABS_PATH=$LC_ABS_PATH/BigAVFramework
alias gcolc='func_gcolc(){ gpl && gco $1 && gpl && cd $LC_BAF_ABS_PATH && gpl && gco $1 && gpl && cd $LC_ABS_PATH;};func_gcolc'
alias grblc='func_grblc(){ gpl && grb $1 && cd $LC_BAF_ABS_PATH && gpl && grb $1 && cd $LC_ABS_PATH;};func_grblc'
alias gblc='func_gblc(){ git branch $1 && gco $1 && git push --set-upstream origin $1  &&  cd $LC_BAF_ABS_PATH && git branch $1 && gco $1 && git push --set-upstream origin $1 && cd $LC_ABS_PATH;};func_gblc'
