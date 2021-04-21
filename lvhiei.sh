## this file is created by lvhiei,
## something I used high frequency

## env
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export NDK_ROOT=/Users/mj/Library/Android/sdk/ndk/21.2.6472646
export ANDROID_NDK=$NDK_ROOT
export ANDROID_SDK=/Users/mj/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_SDK
export QT_HOME=/Users/mj/Qt/5.14.2/clang_64/bin
export QT_TOOLS_HOME=/Users/mj/Qt/Tools/QtInstallerFramework/3.2/bin
export PATH=$PATH:$ANDROID_SDK:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools
export PATH=$PATH:$NDK_ROOT:$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin
export PATH=$PATH:/Users/mj/bin
export PATH=$PATH:/Users/mj/source/googlesource/depot_tools
export PATH=$PATH:$QT_HOME:$QT_TOOLS_HOME
export HOMEBREW_NO_AUTO_UPDATE=true

## git alias
alias gg='git lg'
alias gs='git show'
alias gsm='git submodule'
alias gpr='git pull --rebase'
alias gcob='gco -b'
alias gprf='git pull origin $1 --rebase'
alias grp='git remote prune origin'
alias gpl='git pull -p --rebase;git submodule update --init --recursive'
#alias gpl='git pull;grp;gsm update --init;gsm foreach git submodule update --init'
alias gpls='git submodule sync --recursive;gpl'
alias gfb='git branch -a | ag'
alias gssp='git stash show -p'
alias gbdr='func_gbdr(){git branch -D $1;git push origin :$1};func_gbdr'
#alias gbdr='func_gbdr(){git branch -D $1;git push origin --delete $1};func_gbdr'
alias gcos='func_gcos(){gco $1 && git submodule init && git submodule update};func_gcos'
function func_gp(){
    branch=`git symbolic-ref --short -q HEAD`
    echo "current branch is $branch"
    remote_branch=`git branch -r | grep $branch | sed "s/ *$//g" | sed "s/ *//g"`
    echo "remote branch is $remote_branch"
    if [[ "$remote_branch" == "origin/$branch" ]]; 
    then
        echo "already has remote branch"
        git push
    else
        echo "set upstream for $branch"
        git push --set-upstream origin $branch 
    fi
}

alias gp='func_gp'

## bytertc git relies


## byte git alias
RTC_ABS_PATH=/Users/mj/project/ByteRTCSDK
RTC_REALX_ABS_PATH=$RTC_ABS_PATH/realx
function gcortc(){
    cd $RTC_ABS_PATH
    gpl
    gco $1
    gpl
    realx_commit_id=`cat .gitlab-ci_new.yml | grep "realx_branch:" | sed "s/ *$//g" | sed "s/realx_branch://g" | sed "s/ *//g"`
    echo "realx branch is $realx_commit_id"
    cd $RTC_REALX_ABS_PATH
    gpl
    gco $realx_commit_id
    gpl
    cd $RTC_ABS_PATH
}

#alias gcortc='func_gcortc(){ gpl && gco $1 && gpl && cd $RTC_REALX_ABS_PATH && gpl && gco $1 && gpl && cd $RTC_ABS_PATH;};func_gcortc'
LC_ABS_PATH=/Users/mj/project/velive
LC_BAF_ABS_PATH=$LC_ABS_PATH/BigAVFramework
alias gcolc='func_gcolc(){ gpl && gco $1 && gpl && cd $LC_BAF_ABS_PATH && gpl && gco $1 && gpl && cd $LC_ABS_PATH;};func_gcolc'
alias grblc='func_grblc(){ gpl && grb $1 && cd $LC_BAF_ABS_PATH && gpl && grb $1 && cd $LC_ABS_PATH;};func_grblc'
alias gblc='func_gblc(){ git branch $1 && gco $1 && git push --set-upstream origin $1  &&  cd $LC_BAF_ABS_PATH && git branch $1 && gco $1 && git push --set-upstream origin $1 && cd $LC_ABS_PATH;};func_gblc'

## ctag && cscope alias
alias genctags='/usr/local/bin/ctags -R ./'
alias gentags='/usr/local/bin/ctags -R ./'
alias gencpptags='/usr/local/bin/ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++'
alias genscopes='cscope -Rbq'
alias gencscopes='find . | egrep "\.h|\.c" > cscope.files;cscope -bq'


## system command alais
alias cd='mycd(){ cd $1 && ll; };mycd'
alias fp='ps -ef | grep -i $1'
alias lth='ll -t | head -n 10'
alias uzl='unzip -l'


## adb alias
alias adbm='adb -s 9bfb3548'
alias adbx='adb -s 4426515f'
alias adbm8='adb -s c0f8937c'
alias adbo='adb -s a3aebd32'
alias adbh='adb -s 3JU5T18511014824'
alias ainstall='func_ainstall(){adbx install -r $1;adbm install -r $1};func_ainstall'
DUMP_TAIL='shell dumpsys media.audio_flinger'
alias dumpaf="adb $DUMP_TAIL"
alias dumpafx="adbx $DUMP_TAIL"
alias dumpafm="adbm $DUMP_TAIL"
alias dumpafm8="adbm8 $DUMP_TAIL"
DUMP_TAIL='shell dumpsys media.audio_policy'
alias dumpap="adb $DUMP_TAIL"
alias dumpapx="adbx $DUMP_TAIL"
alias dumpapm="adbm $DUMP_TAIL"
alias dumpapm8="adbm8 $DUMP_TAIL"

## gradlew alias
alias amda='func_amda(){./gradlew $1:dependencies --configuration archives};func_amda'
alias amd='func_amd(){./gradlew $1:dependencies};func_amd'

## c++ alias
alias a2l='arm-linux-androideabi-addr2line'
alias a2l64='$NDK_ROOT/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-addr2line'

## lvhiei rc alias
alias vimrc='vim ~/.lvhiei/.lvhiei.sh'


## bytertc alias
alias cdb='cd ~/project/ByteRTCSDK'

## iTerm2 alt + leftrow;alt + rightrow
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
