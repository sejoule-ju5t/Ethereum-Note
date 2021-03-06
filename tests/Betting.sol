pragma solidity >=0.7.0 <0.9.0;

contract Ownable {
    address owner;
    function Ownable() public {
        owner = msg.sender;
    }
    modifier Owned {
        require(msg.sender == owner);
        _;
    }
}

contract Mortal is Ownable {
    function kill() public Owned {
        selfdestruct(owner);
    }
}

contract Betting is Mortal {
    uint minBet;
    uint winRate;
    
    event Won (bool _result, uint _amount);

    function Betting(uint _minBet, uint _winRate) payable public {
        require(_minBet > 0);
        require(_winRate <= 100);
        minBet = _minBet;
        winRate = _winRate;
    }
    
    function bet(uint _num) payable public {
        require(_num > 0 && _num <= 5);
        require(msg.value >= minBet);
        
        uint winNum = random();
        if(_num == winNum) {
            uint amtWon = msg.value * (100 - winRate) / 10;
            if(!msg.sender.send(amtWon)) revert();
            Won(true, amtWon);
        }
        else{
            Won(false, 0);
        }
    }
    
    function random() public view returns (uint){
        return uint(keccak256(block.difficulty, block.number, now)) % 5 + 1;
    }
    
    function getBalance() Owned public view returns (uint) {
        return address(this).balances;
    }
    
    function() public { 
        revert();
    }
}





