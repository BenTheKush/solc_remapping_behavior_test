#!/usr/bin/env bash

function run_solc {
    printf -- "    \033[1mRunning: \`\033[33;1msolc %s\033[0m\`..." "$*"
    if [ -z ${PRINT_COMPILER_OUTPUT+x} ]; then
        # Var is unset, so be quiet
        if solc "$@" >/dev/null 2>&1; then
            printf "\033[32mSUCCESS\n\033[0m"
            return 0
        else
            printf "\033[31mFAILED\n\033[0m"
            return 1
        fi
    else
        echo
        if solc "$@"; then
            printf "\033[32;1m    SUCCESS\n\033[0m\n"
            return 0
        else
            printf "\033[31;1m    FAILED\n\033[0m\n"
            return 1
        fi
        echo
    fi
}

function run_solang {
    printf -- "    \033[1mRunning: \`\033[33;1msolang compile --target solana %s\033[0m\`..." "$*"

    if [ -z ${PRINT_COMPILER_OUTPUT+x} ]; then
        # Var is unset, so be quiet
        if solang compile --target solana "$@" >/dev/null 2>&1; then
            printf "\033[32mSUCCESS\n\033[0m"
            return 0
        else
            printf "\033[31mFAILED\n\033[0m"
            return 1
        fi
    else
        echo
        if solang compile --target solana "$@"; then
            printf "\033[32;1m    SUCCESS\n\033[0m\n"
            return 0
        else
            printf "\033[31;1m    FAILED\n\033[0m\n"
            return 1
        fi
    fi
}

function compare_runs {
    expected=$1
    solc_run=$2
    solang_run=$3

    if [ $solc_run -eq $expected ] && [ $solc_run -eq $solang_run ]; then

        printf "\033[1;32m" # GREEN BOLD
        printf "    SUCCESS:"
        printf "\033[0m" # UNRED
        printf " solc and solang exit codes are expected value\n"
    else
        printf "\033[1;31m" # RED BOLD
        echo "    FAILURE:"
        printf "\033[0m" # UNRED
        echo "        expected: $expected"
        echo "        solc:     $solc_run"
        echo "        solang:   $solang_run"
    fi
}

function print_test_banner {
    echo
    echo "======================================================================="
    printf "\033[34;1m"
    printf "TEST %s:" "$1"
    printf "\033[0;1m"
    printf " %s\n" "$2"
    printf "\033[0m"
    echo "======================================================================="
    echo
}
