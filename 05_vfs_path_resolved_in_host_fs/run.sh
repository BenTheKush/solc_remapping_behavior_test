#!/usr/bin/env bash

# shellcheck source=/dev/null
source "../util.sh"

print_test_banner 1 "Ensuring import paths aren't interpreted as host system filepaths"
run_solc contracts/Contract.sol --base-path contracts
solc_run=$?
run_solang contracts/Contract.sol -I contracts
solang_run=$?
compare_runs 0 $solc_run $solang_run

print_test_banner 2 "This time with remappings!"
run_solc contracts/Contract.sol lib/nested=resources/node_modules/lib/nested --base-path contracts
solc_run=$?
run_solang contracts/Contract.sol -m "lib/nested=resources/node_modules/lib/nested" -I contracts
solang_run=$?
compare_runs 0 $solc_run $solang_run
