// SPDx-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title Accessing Private Data
 * @author Solidity by example
 * @notice A contract to demonstrate private data reading
 * lets see whether i can read what is in private data
 */
contract PrivateData {
    //slot 0
    uint256 public count = 123;
    // slot 1
    address public owner = msg.sender;
    bool public isTrue = true;
    uint16 public u16 = 31;
    // slot 2
    string private password;

    // constants do not use storage, they are stored in the byte code
    uint256 public constant SOMECONST = 123;

    // slot 3,4,5 one for each array element
    bytes32[3] public data;

    struct User {
        uint256 id;
        string password;
    }

    // slot 6 - length of array
    // starting from slot hash(6) - array elements
    //slot where array element is stored keccak256(slot) + index*elementsize
    // where slot = 6 and elementSize = 2 (1(uint) + 1(bytes32))
    User[] private users;

    //slot 7 - empty
    // entries are stored at hash(key,slot)
    // where slot = 7, key = map key
    mapping(uint256 => User) private idToUser;

    constructor(string memory _password) {
        password = _password;
    }

    function addUser(string memory _password) public {
        User memory user = User({id: users.length, password: _password});
        users.push(user);
        idToUser[user.id] = user;
    }

    function getArrayLocation(
        uint256 slot,
        uint256 index,
        uint256 elementSize
    ) public pure returns (uint256) {
        return
            uint256(keccak256(abi.encodePacked(slot))) + (index * elementSize);
    }

    function getMapLocation(
        uint256 slot,
        uint256 key
    ) public pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(key, slot)));
    }
}
