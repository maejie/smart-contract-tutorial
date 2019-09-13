pragma solidity ^0.5.0;

contract Thing {

    address owner;
    string name;

    constructor(string memory _name) public {
        owner = msg.sender;
        name = _name;
    }

    function transfer(address _to) public returns (bool success) {
        if (owner == msg.sender){
            owner = _to;
            return true;
        } else {
            return false;
      }
    }

    function getOwner() public view returns(address owner_address){
        return owner;
    }

    function getName() public view returns(string memory item_name){
        return name;
    }

}
