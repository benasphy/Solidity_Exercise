// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ERC20Token {
    mapping(address => uint) private balances;
    mapping(address => mapping(address => uint)) private allowed;

    uint private _totalSupply;
    address public owner;

    event Approval(address indexed _owner, address indexed _spender, uint _value);
    event Transfer(address indexed _from, address indexed _to, uint _value);

    // only owner modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // constructor sets owner and initial supply
    constructor(uint initialSupply) {
        owner = msg.sender;
        _totalSupply = initialSupply;
        balances[owner] = initialSupply;

        emit Transfer(address(0), owner, initialSupply);
    }

    // 1. totalSupply
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }

    // 2. balanceOf
    function balanceOf(address _owner) public view returns (uint) {
        return balances[_owner];
    }

    // 3. approve
    function approve(address _spender, uint _amount) public returns (bool) {
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    // 4. transfer
    function transfer(address _to, uint _amount) public returns (bool) {
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;

        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    // 5. transferFrom
    function transferFrom(address _from, address _to, uint _amount) public returns (bool) {
        require(balances[_from] >= _amount, "Insufficient balance");
        require(allowed[_from][msg.sender] >= _amount, "Allowance exceeded");

        allowed[_from][msg.sender] -= _amount;
        balances[_from] -= _amount;
        balances[_to] += _amount;

        emit Transfer(_from, _to, _amount);
        return true;
    }

    // 6. allowance
    function allowance(address _owner, address _spender) public view returns (uint) {
        return allowed[_owner][_spender];
    }

    // =====================
    // OWNER FUNCTIONS
    // =====================

    // Mint new tokens (only owner)
    function mint(address _to, uint _amount) public onlyOwner {
        require(_to != address(0), "Invalid address");
        require(_amount > 0, "Amount must be > 0");

        _totalSupply += _amount;
        balances[_to] += _amount;

        emit Transfer(address(0), _to, _amount);
    }

    // Burn tokens (from owner's balance)
    function burn(uint _amount) public onlyOwner {
        require(balances[owner] >= _amount, "Insufficient balance");

        balances[owner] -= _amount;
        _totalSupply -= _amount;

        emit Transfer(owner, address(0), _amount);
    }

    // Airdrop tokens to many addresses
    function airdrop(address[] calldata recipients, uint[] calldata amounts) public onlyOwner {
        require(recipients.length == amounts.length, "Length mismatch");

        for (uint i = 0; i < recipients.length; i++) {
            address to = recipients[i];
            uint amount = amounts[i];

            require(to != address(0), "Invalid address");
            require(balances[owner] >= amount, "Not enough tokens");

            balances[owner] -= amount;
            balances[to] += amount;

            emit Transfer(owner, to, amount);
        }
    }
}
