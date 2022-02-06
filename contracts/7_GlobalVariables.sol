// SPDX-License-Identifier: WCY
pragma solidity ^0.8.11;

contract GlobalVariables {
    event log(address, uint);

    function getGasInfo() public view returns (uint256, uint256) {
        // tx, block 全局变量
        return (tx.gasprice, block.gaslimit);
    }

    function getBlockInfo()
        public
        view
        returns (
            uint256,
            address,
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        return (
            block.chainid, // current chain id
            block.coinbase, // current block miner's address
            block.difficulty, // (uint): current block difficulty
            block.gaslimit, // (uint): current block gaslimit
            block.number, // (uint): current block number
            block.timestamp // (uint)
        );
    }

    function getMessageInfo() public payable {
        // msg 全局变量
        emit log(msg.sender, msg.value);
    }
}
