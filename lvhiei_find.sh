
## variable
prefer_use_ag=1

function findversion(){
    egrep "[0-9]+\.[0-9]+\.[0-9]+"
}

function findstr(){
    if [ $# -gt 1 ]; then
        ## 1. find file list in $2
        ## 2. replace " " to "\ "
        ## 3. split list to array and grep $1 in list
        ## 4. grep $1 to show color result
        find . -name "$2" | sed 's| |\\ |g' | xargs grep -F -rn "$1" | grep $1
    else
        if [ $prefer_use_ag -eq 1 ]; then
            ag $1
        else
            grep -F -rn $1 ./*
        fi
    fi
}

function findinregexp(){
    if [ $prefer_use_ag -eq 1 ];then
        ag -G $2 $1
    else
        find . | egrep "$2" | sed 's| |\\ |g' | xargs  grep -F -rn "$1" | grep $1
    fi
}

function findincpp(){
    if [ $prefer_use_ag -eq 1 ];then
        ag --cpp $1
    else
        findinregexp $1 "\.cc$|\.c$|\.h$|\.cpp$"
    fi
}

function findincxx(){
    findinregexp $1 "\.c$|\.h$|\.cpp$|\.cc$|\.C$|\.cxx$|\.hpp$|\.hh$|\.m$|\.mm$|\.H$|\.hxx$|\.tpp$"
}

function findinc(){
    if [ $prefer_use_ag -eq 1 ];then
        ag --cc $1
    else
        findinregexp $1 "\.c$|\.h$"
    fi
}

function findinjava(){
    if [ $prefer_use_ag -eq 1 ];then
        ag --java $1
    else
        findinregexp $1 "\.java$"
    fi
}

function findincmake(){
    findinregexp $1 "CMakeLists\.txt$|\.cmake$"
}

function findinmd(){
    if [ $prefer_use_ag -eq 1 ];then
        ag --md $1
    else
        findinregexp $1 "\.md$|\.markdown$"
    fi
}
