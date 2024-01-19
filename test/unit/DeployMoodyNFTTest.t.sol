// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodyNFT} from "../../script/DeployMoodyNft.s.sol";

contract DeployMoodyNFTTest is Test {
    DeployMoodyNFT deployer;
    string public constant HAPPY_SVG =
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><defs><style>.a{fill:#f8de40;}.b{fill:#864e20;}.c{fill:#e7c930;}</style></defs><rect class="a" x="1" y="1" width="22" height="22" rx="7.656"/><path class="b" d="M7.055,7.313A1.747,1.747,0,1,0,8.8,9.059,1.747,1.747,0,0,0,7.055,7.313Z"/><path class="b" d="M16.958,7.313A1.747,1.747,0,1,0,18.7,9.059,1.747,1.747,0,0,0,16.958,7.313Z"/><path class="c" d="M23,13.938a14.69,14.69,0,0,1-12.406,6.531c-5.542,0-6.563-1-9.142-2.529A7.66,7.66,0,0,0,8.656,23h6.688A7.656,7.656,0,0,0,23,15.344Z"/><path class="b" d="M16.6,12.25A8.622,8.622,0,0,1,12,13.521,8.622,8.622,0,0,1,7.4,12.25s-.451-.273-.169.273,1.867.93,1.882,1.133a4.862,4.862,0,0,0,5.782,0c.015-.2,1.6-.586,1.882-1.133S16.6,12.25,16.6,12.25Z"/><path class="c" d="M14.422,14.961a4.8,4.8,0,0,1-4.844,0c-.424-.228-.476.164.352.656a4.093,4.093,0,0,0,2.07.656,4.093,4.093,0,0,0,2.07-.656C14.9,15.125,14.846,14.733,14.422,14.961Z"/></svg>';

    function setUp() public {
        deployer = new DeployMoodyNFT();
    }

    function testSvgToImageURI() public view {
        string
            memory expectedImageURI = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PGRlZnM+PHN0eWxlPi5he2ZpbGw6I2Y4ZGU0MDt9LmJ7ZmlsbDojODY0ZTIwO30uY3tmaWxsOiNlN2M5MzA7fTwvc3R5bGU+PC9kZWZzPjxyZWN0IGNsYXNzPSJhIiB4PSIxIiB5PSIxIiB3aWR0aD0iMjIiIGhlaWdodD0iMjIiIHJ4PSI3LjY1NiIvPjxwYXRoIGNsYXNzPSJiIiBkPSJNNy4wNTUsNy4zMTNBMS43NDcsMS43NDcsMCwxLDAsOC44LDkuMDU5LDEuNzQ3LDEuNzQ3LDAsMCwwLDcuMDU1LDcuMzEzWiIvPjxwYXRoIGNsYXNzPSJiIiBkPSJNMTYuOTU4LDcuMzEzQTEuNzQ3LDEuNzQ3LDAsMSwwLDE4LjcsOS4wNTksMS43NDcsMS43NDcsMCwwLDAsMTYuOTU4LDcuMzEzWiIvPjxwYXRoIGNsYXNzPSJjIiBkPSJNMjMsMTMuOTM4YTE0LjY5LDE0LjY5LDAsMCwxLTEyLjQwNiw2LjUzMWMtNS41NDIsMC02LjU2My0xLTkuMTQyLTIuNTI5QTcuNjYsNy42NiwwLDAsMCw4LjY1NiwyM2g2LjY4OEE3LjY1Niw3LjY1NiwwLDAsMCwyMywxNS4zNDRaIi8+PHBhdGggY2xhc3M9ImIiIGQ9Ik0xNi42LDEyLjI1QTguNjIyLDguNjIyLDAsMCwxLDEyLDEzLjUyMSw4LjYyMiw4LjYyMiwwLDAsMSw3LjQsMTIuMjVzLS40NTEtLjI3My0uMTY5LjI3MywxLjg2Ny45MywxLjg4MiwxLjEzM2E0Ljg2Miw0Ljg2MiwwLDAsMCw1Ljc4MiwwYy4wMTUtLjIsMS42LS41ODYsMS44ODItMS4xMzNTMTYuNiwxMi4yNSwxNi42LDEyLjI1WiIvPjxwYXRoIGNsYXNzPSJjIiBkPSJNMTQuNDIyLDE0Ljk2MWE0LjgsNC44LDAsMCwxLTQuODQ0LDBjLS40MjQtLjIyOC0uNDc2LjE2NC4zNTIuNjU2YTQuMDkzLDQuMDkzLDAsMCwwLDIuMDcuNjU2LDQuMDkzLDQuMDkzLDAsMCwwLDIuMDctLjY1NkMxNC45LDE1LjEyNSwxNC44NDYsMTQuNzMzLDE0LjQyMiwxNC45NjFaIi8+PC9zdmc+";
        string memory imageURI = deployer.svgToImageURI(HAPPY_SVG);
        assert(
            keccak256(abi.encodePacked(expectedImageURI)) ==
                keccak256(abi.encodePacked(imageURI))
        );
    }
}
