#!/usr/bin/env bash
[ -z "$VIM_PLUGIN_LIST" ] && VIM_PLUGIN_LIST="vim_plugin.list"
AStart=()
AOpt=()

testpath() {
    if [ -d "$1" ]; then
        echo "rm -fr $1"
        rm -fr $1
        echo "ln -snf ${1%/*}/logname ${1%/*}/$LOGNAME"
        ln -snf "${1%/*}/logname" "${1%/*}/$LOGNAME"
    else
        echo "ln -snf ${1%/*}/logname ${1%/*}/$LOGNAME"
        ln -snf "${1%/*}/logname" "${1%/*}/$LOGNAME"
    fi

}
get_list() {
    for LINE in `cat $VIM_PLUGIN_LIST`
    do
        if [ $LINE == "start:" ]; then
            FLAG=1;
            continue;
        elif [ $LINE == "opt:" ]; then
            FLAG=2;
            continue;
        fi
        if [ $FLAG -eq 1 ]; then
            AStart[${#AStart[*]}]=$LINE
        elif [ $FLAG -eq 2 ]; then
            AOpt[${#AOpt[*]}]=$LINE
        fi
    done

    echo "AStart" ${AStart[@]}
    echo "AOpt" ${AOpt[@]}

    ret="$?"
}
git_submodule_add () {
    uri="https://github.com"
    start_path=".vim/pack/$LOGNAME/start"
    opt_path=".vim/pack/$LOGNAME/opt"

    for PLUG in ${AStart[@]}
    do
        echo "git submodule add  $uri/$PLUG $start_path/${PLUG##*/}"
        git submodule add  $uri/$PLUG $start_path/${PLUG##*/}
    done

    for PLUG in ${AOpt[@]}
    do
        echo "git submodule add  $uri/$PLUG $opt_path/${PLUG##*/}"
        git submodule add  $uri/$PLUG $opt_path/${PLUG##*/}
    done
    echo "git submodule update --init --recursiave"
    git submodule update --init --recursive
}
main () {
    testpath $PWD/.vim/pack/$LOGNAME
    get_list
    git_submodule_add
}
#export http_proxy="172.23.220.1:1080"
#export https_proxy="172.23.220.1:1080"
main
