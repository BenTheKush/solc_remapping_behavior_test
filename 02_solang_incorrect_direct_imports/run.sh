#!/usr/bin/env bash

# shellcheck source=/dev/null
source "../util.sh"

print_test_banner 1 "Correct Configs (should pass)"
run_solc contracts/Contract.sol lib=resources/node_modules/lib
solc_run=$?
run_solang contracts/Contract.sol -m "lib=resources/node_modules/lib"
solang_run=$?
compare_runs 0 $solc_run $solang_run

print_test_banner 2 "Correct Configs (should pass)"
run_solc contracts/Contract.sol lib=resources/node_modules/lib --base-path .
solc_run=$?
run_solang contracts/Contract.sol -m "lib=resources/node_modules/lib" -I .
solang_run=$?
compare_runs 0 $solc_run $solang_run
