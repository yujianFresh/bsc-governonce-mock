// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import '../lib/forge-std/src/Script.sol';
import '../contracts/Governor.sol';
import '../contracts/MyToken.sol';

contract GoverScript is Script {
    event Token(address);
    event Gov(address);

    function run() external {
        uint256 deployerPrivateKey = vm.envUint('TEST_PRIVATE_KEY');
        vm.startBroadcast(deployerPrivateKey);

        MyToken token = new MyToken();
        MyGovernor governor = new MyGovernor(token);

        vm.stopBroadcast();

        emit Token(address(token));
        emit Gov(address(governor));
    }
}
