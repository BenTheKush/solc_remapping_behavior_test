// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

import "contracts/A.sol";

contract Contract {
    using Lib for Lib.Item;

    Lib.Item internal x;

    function addSigner(uint256 account) external {
        x.add(account);
    }
}
