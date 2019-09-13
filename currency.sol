pragma solidity ^0.5.0;

contract Currency {

    mapping(address => uint256) balances;

    constructor() public {
        balances[msg.sender] = 100000000;
    }

    function transfer(address _to, uint256 _amount) public returns (bool success) {
        if (balances[msg.sender] >= _amount
        && _amount > 0
        && balances[_to] + _amount > balances[_to]) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            return true;
        } else {
            return false;
      }
    }

    function balanceOf(address _userAddress) public view returns(uint256 balance){
        return balances[_userAddress];
    }

}
