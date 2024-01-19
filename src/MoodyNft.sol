// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodyNFT is ERC721 {
    /** Errors */
    error MoodyNFT_Unauthorized();

    uint256 private s_tokenIdCount;
    string private s_happyImageURI;
    string private s_sadImageURI;

    enum Mood {
        HAPPY,
        SAD
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(
        string memory happyImageURI,
        string memory sadImageURI
    ) ERC721("Moody NFT", "MN") {
        s_tokenIdCount = 0;
        s_happyImageURI = happyImageURI;
        s_sadImageURI = sadImageURI;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenIdCount);
        s_tokenIdToMood[s_tokenIdCount] = Mood.HAPPY;
        s_tokenIdCount++;
    }

    function flipMood(uint256 tokenId) public {
        // only the NFT owner can change the mood
        if (!_isAuthorized(_ownerOf(tokenId), msg.sender, tokenId)) {
            revert MoodyNFT_Unauthorized();
        }
        s_tokenIdToMood[tokenId] = s_tokenIdToMood[tokenId] == Mood.HAPPY
            ? Mood.SAD
            : Mood.HAPPY;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageURI;

        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            imageURI = s_happyImageURI;
        } else if (s_tokenIdToMood[tokenId] == Mood.SAD) {
            imageURI = s_sadImageURI;
        }
        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                name(), // You can add whatever name here
                                '", "description":"An NFT that reflects the mood of the owner, 100% on Chain!", ',
                                '"attributes": [{"trait_type": "moodiness", "value": 100}], "image":"',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            );
    }
}
