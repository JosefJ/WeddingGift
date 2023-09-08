// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Test} from "forge-std/Test.sol";
import {HappyTogether} from "../src/HappyTogether.sol";

contract HappyTogetherTest is Test {
    HappyTogether public happyTogether;
    address constant BRIDE = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // FILL YOUR OWN
    address constant GROOM = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; // FILL YOUR OWN
    address immutable HOME = makeAddr("home");

    function setUp() public {
        happyTogether = new HappyTogether();
        address uncleBob = makeAddr("uncleBob");
        vm.deal(uncleBob, 1 ether);
        vm.startPrank(uncleBob);
        happyTogether.sendGift{value: 1 ether}();
    }

    function testWedding() public {
        vm.startPrank(BRIDE);
        happyTogether.iPromise("I do");
        vm.startPrank(GROOM);
        happyTogether.iPromise("I do");

        happyTogether.brightFuture(HOME);

        vm.startPrank(BRIDE);
        happyTogether.brightFuture(HOME);

        assertEq(address(happyTogether).balance, 0);
        assertEq(address(HOME).balance, 1 ether);
    }

    function testWrongHome() public {
        address wrongHome = makeAddr("wrongHome");
        vm.startPrank(BRIDE);
        happyTogether.iPromise("I do");
        vm.startPrank(GROOM);
        happyTogether.iPromise("I do");

        happyTogether.brightFuture(HOME);

        vm.startPrank(BRIDE);
        vm.expectRevert();
        happyTogether.brightFuture(wrongHome);
    }

    function testZeroHome() public {
        vm.startPrank(BRIDE);
        happyTogether.iPromise("I do");
        vm.startPrank(GROOM);
        happyTogether.iPromise("I do");
        vm.expectRevert();
        happyTogether.brightFuture(address(0));
    }
}
