#!/usr/bin/env bash

# shellcheck source=/dev/null
source "../util.sh"

print_test_banner 1 "Ambiguous Imports Should Fail"
run_solc contracts/Contract.sol lib=resources/node_modules/lib --base-path . --include-path contracts
solc_run=$?
run_solang contracts/Contract.sol -m "lib=resources/node_modules/lib" -I . -I contracts
solang_run=$?
compare_runs 1 $solc_run $solang_run
