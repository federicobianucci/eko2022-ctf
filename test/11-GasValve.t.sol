// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/11-GasValve.sol";

contract GasValveTest is Test {
    Valve valve;
    address player;

    function setUp() public {
        player = makeAddr("player");
        valve = new Valve();
    }

    function test() public {
        vm.startPrank(player);
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
