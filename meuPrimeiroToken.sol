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

// forge token 
// forge create --rpc-url https://rpc.ankr.com/polygon_amoy --private-key 63dc2a12c5f0125a1f9c06e0e591b5c113993c59228bfc2111967d5df3651ce1 src/MeuPrimeiroToken.sol:MeuToken --constructor-args 10000000