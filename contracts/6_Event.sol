// SPDX-License_Identifier: WCY

pragma solidity ^0.8.11;

contract Event {
    event Log(address sender, string message);

    function transfer() public {
        // 写一些业务逻辑

        emit Log(msg.sender, "I send sth! 1");
        emit Log(msg.sender, "I send sth! 2");
        emit Log(msg.sender, "I send sth! 3");
    }
}
