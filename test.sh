
echo
echo "--- Running: \`solc contracts/Contract.sol\`"
echo

if solc contracts/Contract.sol; then
  printf "\033[32mSUCCESS\n\033[0m"
else
  printf "\033[31mFAILED\n\033[0m"
fi

echo
echo "--- Running: \`solc contracts/Contract.sol lib=node_modules/lib\`"
echo

if solc contracts/Contract.sol lib=node_modules/lib; then
  printf "\033[32mSUCCESS\n\033[0m"
else
  printf "\033[31mFAILED\n\033[0m"
fi

echo
echo "--- Running: \`solc contracts/Contract.sol lib=node_modules/lib --base-path=.\`"
echo

if solc contracts/Contract.sol lib=node_modules/lib --base-path=.; then
  printf "\033[32mSUCCESS\n\033[0m"
else
  printf "\033[31mFAILED\n\033[0m"
fi

echo
echo "--- Running: \`solc contracts/Contract.sol lib=node_modules/lib --base-path=. --include-path=resources\`"
echo

if solc contracts/Contract.sol lib=node_modules/lib --base-path=. --include-path=resources; then
  printf "\033[32mSUCCESS\n\033[0m"
else
  printf "\033[31mFAILED\n\033[0m"
fi
