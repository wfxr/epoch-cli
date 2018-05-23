#!/usr/bin/env zsh
#===============================================================================
#   Author: Wenxuan
#    Email: wenxuangm@gmail.com
#  Created: 2018-01-15 13:25
#===============================================================================

function epoch() {
    if [[ $# -eq 0 ]]; then
        while read arg; do
            wfxr::date "$arg" "+%s"
        done
    else
        wfxr::date "$1" "+%s"
    fi
}

function epochms() {
    if [[ $# -eq 0 ]]; then
        while read arg; do
            wfxr::date "$arg" "+%s%3N"
        done
    else
        wfxr::date "$1" "+%s%3N"
    fi
}

function wfxr::date() {
    date -d "$(echo "$1" | sed "s/today\|yesterday\|tomorrow/$(date +%F -d $1)/g")" "${@:2}"
}

function fepoch() {
    if [[ $# -eq 0 ]]; then
        xargs -I{} date +'%F %T' -d '@{}'
    else
        date +'%F %T' -d @"$1"
    fi
}

function fepochms() {
    if [[ $# -eq 0 ]]; then
        xargs -I{} ruby -e "puts Time.at({} / 1000.0).strftime('%F %T.%3N')"
    else
        ruby -e "puts Time.at($1 / 1000.0).strftime('%F %T.%3N')"
    fi
}
