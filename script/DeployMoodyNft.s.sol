// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Script, console} from "forge-std/Script.sol";
import {MoodyNFT} from "../src/MoodyNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodyNFT is Script {
    function run() external returns (MoodyNFT moodyNft) {
        string memory happySvg = vm.readFile("./img/happy.svg");
        string memory sadSvg = vm.readFile("./img/sad.svg");
        vm.startBroadcast();
        moodyNft = new MoodyNFT(svgToImageURI(happySvg), svgToImageURI(sadSvg));
        vm.stopBroadcast();
    }

    function svgToImageURI(
        string memory _svg
    ) public pure returns (string memory imageURI) {
        string memory baseURI = "data:image/svg+xml;base64,";
        imageURI = string(
            abi.encodePacked(
                baseURI,
                Base64.encode(bytes(string(abi.encodePacked(_svg))))
            )
        );
    }
}
