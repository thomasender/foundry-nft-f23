// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Test, console} from "forge-std/Test.sol";
import {DeployW3CGNft} from "../../script/DeployW3CGNft.s.sol";
import {W3CGNft} from "../../src/W3CGNft.sol";

contract W3CGNftTest is Test {
    DeployW3CGNft public deployW3CGNft;
    W3CGNft public w3cgnft;
    address public USER = makeAddr("user");
    string public TEST_TOKEN_URI =
        "ipfs://Qmbd694p6SxurEYdd7TdYuYWhpHs5HSFr7vnFSZJAkLt8W";

    function setUp() external {
        deployW3CGNft = new DeployW3CGNft();
        w3cgnft = deployW3CGNft.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Web3CodingGroup";
        string memory actualName = w3cgnft.name();

        // Strings in Solidity are of type dynamic array
        // So we cannot compare string == string
        // We therefore abi.encodePacked() the strings and compare the keccak256 hash
        // To effectively compare the bytes32 hashes
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHasCorrectBalance() public {
        vm.prank(USER);
        w3cgnft.mintNft(TEST_TOKEN_URI);
        assert(w3cgnft.balanceOf(USER) == 1);

        // Strings in Solidity are of type dynamic array
        // So we cannot compare string == string
        // We therefore abi.encodePacked() the strings and compare the keccak256 hash
        // To effectively compare the bytes32 hashes
        assert(
            keccak256(abi.encodePacked(TEST_TOKEN_URI)) ==
                keccak256(abi.encodePacked(w3cgnft.tokenURI(0)))
        );
    }
}
