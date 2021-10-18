
## ctag && cscope alias
alias genctags='/usr/local/bin/ctags -R ./'
alias gentags='/usr/local/bin/ctags -R ./'
alias gencpptags='/usr/local/bin/ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q --language-force=c++'
alias genscopes='cscope -Rbq'
alias gencscopes='find . | egrep "\.h|\.c" > cscope.files;cscope -bq'


## system command alais
alias cd='mycd(){ cd $1 && ll; };mycd'
alias cdd='cd ~/Downloads'
alias cdm='cd ~/Music/网易云音乐'
alias fp='ps -ef | grep -i $1'
alias lth='ll -t | head -n 10'
alias uzl='unzip -l'
alias szip='unzip -l'
alias star='tar -tvf'


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
alias adbxfile='adbx shell cat /sdcard/Documents/markor/dy.txt'

## gradlew alias
alias amda='func_amda(){./gradlew $1:dependencies --configuration archives};func_amda'
alias amd='func_amd(){./gradlew $1:dependencies};func_amd'

## ndk alias
alias a2l='arm-linux-androideabi-addr2line'
alias a2l64='$NDK_ROOT/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-addr2line'

## lvhiei rc alias
alias vimrc='vim ~/.lvhiei/.lvhiei.sh'
alias vima='vim ~/.lvhiei/lvhiei_zsh/lvhiei_alias.sh'
alias vimf='vim ~/.lvhiei/lvhiei_zsh/lvhiei_find.sh'
alias vimg='vim ~/.lvhiei/lvhiei_zsh/lvhiei_git.sh'
alias vime='vim ~/.lvhiei/lvhiei_zsh/lvhiei_env.sh'
alias vimt='vim ~/.lvhiei/lvhiei_zsh/lvhiei_temp.sh'


## bytertc alias
alias cdb='cd ~/project/ByteRTCSDK'
alias cdl='cd ~/source/githup/lvhiei'
