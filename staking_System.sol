//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* ================= ERC20 TOKEN ================= */

contract ERC20Token {
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowed;

    uint256 private _totalSupply = 500;
    address public owner;

    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        owner = msg.sender;
        balances[owner] = _totalSupply;
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address user) external view returns (uint256) {
        return balances[user];
    }

    function allowance(address _owner, address _spender) external view returns (uint256) {
        return allowed[_owner][_spender];
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(balances[msg.sender] >= amount, "ERC20: balance too low");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool) {
        require(balances[from] >= amount, "ERC20: balance too low");
        require(allowed[from][msg.sender] >= amount, "ERC20: allowance too low");

        balances[from] -= amount;
        balances[to] += amount;
        allowed[from][msg.sender] -= amount;

        emit Transfer(from, to, amount);
        return true;
    }

    /* OWNER MINT (FOR REWARDS) */
    function mint(address to, uint256 amount) external {
        require(msg.sender == owner, "Only owner");
        balances[to] += amount;
        _totalSupply += amount;
        emit Transfer(address(0), to, amount);
    }
}

/* ================= STAKING ================= */

contract SimpleStaking {
    ERC20Token public immutable token;

    uint256 public constant PRECISION = 1e18;
    uint256 public rewardRate = 1e16; // 0.01 token per second per token staked

    uint256 public totalStaked;

    mapping(address => uint256) public staked;
    mapping(address => uint256) public rewards;
    mapping(address => uint256) public lastUpdate;

    event Staked(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event RewardClaimed(address indexed user, uint256 amount);
    event RewardsFunded(uint256 amount);

    constructor(address tokenAddress) {
        require(tokenAddress != address(0), "Invalid token address");
        token = ERC20Token(tokenAddress);
    }

    /* ================= INTERNAL ================= */

    function _updateReward(address user) internal {
        if (staked[user] > 0) {
            uint256 elapsed = block.timestamp - lastUpdate[user];

            uint256 earnedRewards = (elapsed * staked[user] * rewardRate) / PRECISION;

            rewards[user] += earnedRewards;
        }
        lastUpdate[user] = block.timestamp;
    }

    /* ================= USER ACTIONS ================= */

    function stake(uint256 amount) external {
        require(amount > 0, "Stake = 0");

        // HARD CHECKS (debug killers)
        require(
            token.balanceOf(msg.sender) >= amount,
            "Stake failed: insufficient ERC20 balance"
        );

        require(
            token.allowance(msg.sender, address(this)) >= amount,
            "Stake failed: allowance too low"
        );

        _updateReward(msg.sender);

        bool ok = token.transferFrom(msg.sender, address(this), amount);
        require(ok, "ERC20 transferFrom failed");

        staked[msg.sender] += amount;
        totalStaked += amount;

        emit Staked(msg.sender, amount);
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdraw = 0");
        require(staked[msg.sender] >= amount, "Withdraw exceeds stake");

        _updateReward(msg.sender);

        staked[msg.sender] -= amount;
        totalStaked -= amount;

        bool ok = token.transfer(msg.sender, amount);
        require(ok, "ERC20 transfer failed");

        emit Withdrawn(msg.sender, amount);
    }

    function claimReward() external {
        _updateReward(msg.sender);

        uint256 reward = rewards[msg.sender];
        require(reward > 0, "No rewards");

        rewards[msg.sender] = 0;

        bool ok = token.transfer(msg.sender, reward);
        require(ok, "Reward transfer failed");

        emit RewardClaimed(msg.sender, reward);
    }

    /* ================= ADMIN ================= */

    function fundRewards(uint256 amount) external {
        require(amount > 0, "Fund = 0");

        bool ok = token.transferFrom(msg.sender, address(this), amount);
        require(ok, "Funding failed");

        emit RewardsFunded(amount);
    }

    /* ================= VIEW ================= */

    function earned(address user) external view returns (uint256) {
        if (staked[user] == 0) return rewards[user];

        uint256 elapsed = block.timestamp - lastUpdate[user];

        uint256 pending =
            (elapsed * staked[user] * rewardRate) / PRECISION;

        return rewards[user] + pending;
    }
}
