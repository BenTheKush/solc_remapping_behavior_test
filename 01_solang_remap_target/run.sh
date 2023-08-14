
function run_solc {
  echo
  echo "----------------------------------------------------"
  echo "--- Running: \`solc $@\`"
  echo "----------------------------------------------------"
  echo
  if solc "$@" ; then
    printf "\n\033[32mSUCCESS\n\033[0m"
    return 0
  else
    printf "\033[31mFAILED\n\033[0m"
    return 1
  fi
}

function run_solang {
  echo
  printf " ----------------------------------------------------\n"
  printf " --- Running: \`\033[33;1msolang compile --target solana %s\033[0m\`\n" "$(echo "$@")"
  printf " ----------------------------------------------------\n"
  echo
  if solang compile --target solana "$@" ; then
    printf "\n\033[32mSUCCESS\n\033[0m"
    return 0
  else
    printf "\033[31mFAILED\n\033[0m"
    return 1
  fi
}

run_solc contracts/Contract.sol
run_solang contracts/Contract.sol


run_solc contracts/Contract.sol lib=node_modules/lib
run_solang contracts/Contract.sol -m lib=node_modules/lib


run_solc contracts/Contract.sol lib=node_modules/lib --base-path=.
run_solang contracts/Contract.sol -m "lib=node_modules/lib" -I .


run_solc contracts/Contract.sol lib=node_modules/lib --base-path=. --include-path=resources/node_modules
run_solang contracts/Contract.sol -m "lib=node_modules/lib" -I . -I resources/node_modules


run_solc contracts/Contract.sol lib=node_modules/lib --base-path=. --include-path=resources
run_solang contracts/Contract.sol -m "lib=node_modules/lib" -I . -I resources
