// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Script} from 'forge-std/Script.sol';
import {MyGovernor} from '../contracts/Governor.sol';
import {MyToken} from '../contracts/MyToken.sol';

contract DeployTokenAndGover is Script {
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
