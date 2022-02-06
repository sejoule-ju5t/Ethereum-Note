// SPDX-License-Identifier: WCY

// private 当前contract调用
// internal 当前contract以及子contract调用
// external 只能外部调用
// public 所有都可以调用

pragma solidity ^0.8.11;

contract FunctionVisibility {
    string value = "CRIS";

    function setValue(string memory _value) public {
        value = _value;
    }

    // 只能在当前合约里进行调用
    function getPrivateValue() private view returns (string memory) {
        return value;
    }

    function getInternalValue() internal view returns (string memory) {
        return value;
    }

    function getExternalValue() external view returns (string memory) {
        return value;
    }

    function getPublicValue() public view returns (string memory) {
        return getPrivateValue();
        // return value;
    }
}

// is 继承
contract SubFunctionVisibility is FunctionVisibility {
    function getValueFromParent() public view returns (string memory) {
        return getInternalValue(); // 如果用getPrivateValue会报错
    }
}
