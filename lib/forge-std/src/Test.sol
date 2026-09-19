// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract Test {
    interface Vm {
        function prank(address) external;
        function deal(address, uint256) external;
    }
    Vm internal constant vm = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));
}

library console {
    function log(string memory p0) internal view {
        bytes memory payload = abi.encodeWithSignature("log(string)", p0);
        assembly { let r := staticcall(gas(), 0x0000000000000000000000000000000000000000, add(payload, 32), mload(payload), 0, 0) }
    }
}
