#!/usr/bin/env bash

function print_test_set_banner {

    echo
    printf "\033[36;1;4m////////////////////////////////////////////////////////////////////////////////\033[0m\n"
    printf "\033[36;1;4m////////////////////////\033[0;1m       RUNNING TEST SET %s       \033[36;1;4m////////////////////////\033[0m\n" "$1"
    printf "\033[36;1;4m////////////////////////////////////////////////////////////////////////////////\033[0m\n"
    echo
}

print_test_set_banner 1
cd 01_solang_remap_target || exit 1
./run.sh
cd .. || exit 1

print_test_set_banner 2
cd 02_solang_incorrect_direct_imports || exit 1
./run.sh
cd .. || exit

print_test_set_banner 3
cd 03_solang_permissive_on_ambiguous_imports || exit 1
./run.sh
cd .. || exit

print_test_set_banner 4
cd 04_multiple_map_path_segments || exit 1
./run.sh
cd .. || exit

print_test_set_banner 5
cd 05_import_path_order_should_not_matter || exit 1
./run.sh
cd .. || exit
