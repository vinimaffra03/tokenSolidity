// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity  ^0.8.0;

contract MeuToken {
    string public name = "MyToken";
    string public symbol = "MTK";


    mapping (address => uint256) public balanceOf;
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insuficient balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}