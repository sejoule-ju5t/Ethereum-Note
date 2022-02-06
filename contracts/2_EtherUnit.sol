// SPDX-License-Identifier: WCY

pragma solidity ^0.8.4;

contract EtherUnit {
    uint256 public oneWei1 = 1;
    uint256 public oneWei2 = 1 wei;
    uint256 public oneGWei = 1 gwei; // 以太坊的交易 通常以gwei为单位
    uint256 public oneEhter = 1 ether;

    function testOneWei() public view returns (bool) {
        return oneWei1 == 1 && oneWei1 == oneWei2;
    }

    function testOneGWei() public view returns (bool) {
        return oneGWei == 1 * 10**9;
    }

    function testOneEther() public view returns (bool) {
        return oneEhter == 1 * 10**18;
    }
}
