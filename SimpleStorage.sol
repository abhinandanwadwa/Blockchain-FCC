// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;  // 0.8.12 is the latest as per the video

contract SimpleStorage {  // This is how you define a Contract in Solidity. The word "contract" is a keyword itself. A contract is similar to a class in any object-oriented programming language.
    uint256 public favNo;  // This gets automatically Initialised to 0
    // The Default visibility is "internal"

    mapping(string => uint256) public nameToFavouriteNumber;

    // People public person = People({favouriteNumber: 2, name: "Abhinandan Wadhwa"});

    struct People {
        uint256 favouriteNumber;
        string name;
    }

    // uint256[] public favouriteNumbersList;
    People[] public people;

    function store(uint256 _favouriteNumber) public virtual {   // The "virtual" keyword is added to make it possible to override in some other contract
        favNo = _favouriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favNo;
    }

    // Struct, Mappings and Arrays need to be given "memory" or "calldata" keyword when adding them as a parameter to different functions
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        People memory newPerson = People({favouriteNumber: _favouriteNumber, name: _name});
        people.push(newPerson);
        // OR: people.push(Person(_favouriteNumber, _name);
        // OR: People memory newPerson = People(_favouriteNumber, _name);
        //     people.push(newPerson);

        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}


// 0xd9145CCE52D386f254917e481eB44e9943F39138