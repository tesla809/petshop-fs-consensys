// SPDX-License-Identifier: MIT License 
// license needed to help clarify use
pragma solidity ^0.8.10;

contract Adoption {
  // a public array of 16 addresses called adopters
  address[16] public adopters;

  // Adopting a pet - takes in petId, returns uint
  function adopt(uint petId) public returns (uint) {
    // keep petIds between range of adoptors array
    require(petId >= 0 && petId <= 15);

    // message sender's address is saved in adopter's array
    // aka contract caller
    adopters[petId] = msg.sender;

    // acknowledge reciept by sending petId back
    return petId;
  }

  // get entire adoptors array
  // since native getters only return 1 element at a time
  // memory- it doesn't persist?
  // view - no modifications 
  function getAdopters() public view returns(address[16] memory) {
    return adopters;
  }
}