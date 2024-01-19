// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Script} from "forge-std/Script.sol";
import {W3CGNft} from "../src/W3CGNft.sol";

contract DeployW3CGNft is Script {
    function run() external returns (W3CGNft w3cgnft) {
        vm.startBroadcast();
        w3cgnft = new W3CGNft();
        vm.stopBroadcast();
    }
}
