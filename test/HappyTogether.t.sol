// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Test, console2} from "forge-std/Test.sol";
import {HappyTogether} from "../src/HappyTogether.sol";

contract HappyTogetherTest is Test {
    HappyTogether public happyTogether;

    function setUp() public {
        happyTogether = new HappyTogether();
    }

    function testWedding() public {
        address uncle = makeAddr("uncle");
        address happyTogetherAddr = address(happyTogether);
        vm.deal(uncle, 1 ether);
        vm.startPrank(uncle);
        assembly {
            pop(call(gas(), happyTogetherAddr, 1000000000000000000, 0, 0, 0, 0))
        }

        console2.logUint(address(happyTogether).balance);

        vm.startPrank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        happyTogether.iPromise("I do");
        vm.startPrank(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        happyTogether.iPromise("I do");

        address home = makeAddr("home");
        happyTogether.brightFuture(home);

        vm.startPrank(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        happyTogether.brightFuture(home);

        console2.logUint(address(happyTogether).balance);
        assertEq(address(home).balance, 1 ether);
    }
}
