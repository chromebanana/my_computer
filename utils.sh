#!/usr/bin/env bash

pdebug() {
    if [[ ${DEBUG} =~ (on|1) ]] ; then
        printf "\r[ \033[00;34mDBUG\033[0m ] $1\n"
    fi
}

pinfo() {
    printf "\r[ \033[00;34mINFO\033[0m ] $1\n"
}

puser() {
    printf "\r[ \033[0;33mUSER\033[0m ] $1\n"
}

psuccess() {
    printf "\r\033[2K[ \033[00;32m  OK\033[0m ] $1\n"
}

pwarn() {
    printf "\r\033[2K[ \033[00;33mWARN\033[0m ] $1\n"
}

pfail() {
    printf "\r\033[2K[ \033[0;31mFAIL\033[0m ] $1\n"
    echo ''
    exit
}