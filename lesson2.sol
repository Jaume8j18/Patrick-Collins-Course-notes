// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //para poner de 0.8.7 parriba poner ^ antes y para poner una franja igual que en cryptozombies
//ejemplos de EVM avalanche polygon etc
contract SimpleStorage {
    //bolean, uint, int, address, bytes
    //bool hasFavoriteNumber = true;
    //string favoriteNumberInText = "Five";
    //int256 favoriteInt = -5;
    //address myAddress = 0xC9276e203beF6631C06af5ae5f18dF474cE9740C;
    //bytes32 favoriteBytes = "cat";
    uint256 favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }
    //uint256 public favoriteNumbersList;
    People[] public people;

    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
    //view and pure functions do not need gas as they do not modify the blockchain, we just spend gas if we modify the blockchain. 
    //They just spend gas if other gas function calls them  
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    //calldata, memory (temporaly and both can be modified), and storage (permanentvariables that can be modified)
    //structs mappings and arrays needs to be called as memory variables
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

