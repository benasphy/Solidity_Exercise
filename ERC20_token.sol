//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract ERC20Token{
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    uint _totalSupply = 500;
    address public owner;

    event Approval(address indexed _owner, address indexed _spender, uint _value);
    event Transfer(address indexed _from, address indexed to, uint _value);

    //1.totalSupply Function
    function totalSupply() public view returns(uint theTotalSupply){
        theTotalSupply = _totalSupply;
        return theTotalSupply;
    }

    //2. balanceOf Function
    function balanceOf(address _owner) public view returns(uint balance){
        return balances[_owner];
    }

    //3. approve function
    function approve(address _spender, uint _amount) public returns(bool success){
        allowed[msg.sender][_spender] = _amount;

        emit Approval(msg.sender, _spender, _amount);
        return true;

    }

    //4. Transfer Function
    function transfer(address to, uint _amount) public returns(bool success){
        if (balances[msg.sender] >= _amount){
            balances[msg.sender] -= _amount;
            balances[to] += _amount;

            emit Transfer(msg.sender, to, _amount);
            return true;

        }
        else{
            return false;
        }
    }

    // 5. transferFrom Function
    function transferFrom(address _from, address _to, uint _amount) public returns(bool success){
        if (balances[_from]  >= _amount && allowed[_from][msg.sender] >= _amount && 
        _amount > 0 && balances[_to] + _amount > balances[_to]){
            balances[_from] -= _amount;
            balances[_to] += _amount;

            emit Transfer(_from, _to, _amount);
            return true;
        }
        else{
            return false;
        }
    }

    //6. allowance Function
    function allowance(address _owner, address _spender) public view returns(uint remaining){
        return allowed[_owner][_spender];

    }

}
