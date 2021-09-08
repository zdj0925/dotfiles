#!/usr/bin/env bash
[ -z "$VIM_PLUGIN_LIST" ] && VIM_PLUGIN_LIST="vim_plugin.list"
AStart=()
AOpt=()

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
       git submodule add  $uri/$PLUG $start_path/${PLUG##*/}
    done

    for PLUG in ${AOpt[@]}
    do
       git submodule add  $uri/$PLUG $opt_path/${PLUG##*/}
    done
    git submodule update --init --recursiv
}
main () {
    get_list
    git_submodule_add
}
export http_proxy="172.23.220.1:1080"
export https_proxy="172.23.220.1:1080"
main
