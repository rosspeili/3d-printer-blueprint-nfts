// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SneakerNFT is ERC721 {

    uint256 public totalSneakers;
    mapping (uint256 => string) public sneakerBlueprints;
    mapping (uint256 => bool) public sneakerPrinted;

    constructor() ERC721("SneakerNFT", "SNFT") {}

    function mint(string memory _blueprint) public {
        uint256 tokenId = totalSneakers + 1;
        _safeMint(msg.sender, tokenId);
        sneakerBlueprints[tokenId] = _blueprint;
        sneakerPrinted[tokenId] = false;
        totalSneakers++;
    }

    function printSneaker(uint256 tokenId) public returns (bool) {
        require(_exists(tokenId), "Sneaker does not exist");
        require(ownerOf(tokenId) == msg.sender, "Not the owner of this Sneaker");

        if (sneakerPrinted[tokenId]) {
            // sneaker already printed
            return false;
        } else {
            // print the sneaker
            // 3D printer instructions go here
            sneakerPrinted[tokenId] = true;
            return true;
        }
    }
}
