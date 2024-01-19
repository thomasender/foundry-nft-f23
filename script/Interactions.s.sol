// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Script} from "forge-std/Script.sol";
import {W3CGNft} from "../src/W3CGNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintW3CGNft is Script {
    string public TEST_TOKEN_URI =
        "ipfs://Qmbd694p6SxurEYdd7TdYuYWhpHs5HSFr7vnFSZJAkLt8W";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "W3CGNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        W3CGNft(contractAddress).mintNft(TEST_TOKEN_URI);
        vm.stopBroadcast();
    }
}
