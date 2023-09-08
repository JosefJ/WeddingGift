// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/**
 *          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⠛⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⣰⠟⠋⠁⠀⢸⡇⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⠹⣦⣀⣀⣀⣀⡇⠀⠀⢰⠋⠉⢻⠶⢦⡄⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠁⠀⠀⢸⡆⠀⠀⠀⢀⡿⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⣀⣤⠶⠋⠀⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣆⡀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⣠⠞⠛⠉⠀⠈⠙⢧⡀⠀⠀⠀⠀⢀⣠⠴⠶⠶⠶⣤⡀⠀⠀⠀⠀
 *          ⠀⠀⠀⠀⢀⡏⣀⣠⡴⠶⣆⠀⣈⣧⠀⠀⠀⢰⠏⠁⠀⠀⠀⠀⠀⢻⡄⠀⠀⠀
 *          ⠀⠀⠀⠀⣟⠛⠁⠀⠀⠀⠈⠛⠙⠛⡇⠀⠀⡟⢀⣠⣤⣤⠾⢷⣄⠀⣧⠀⠀⠀
 *          ⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⢀⡼⠃⠀⠀⡇⢸⡇⠀⠀⠀⠀⢸⡇⢻⠀⠀⠀
 *          ⠀⠀⠀⠀⠀⠈⠻⣄⡀⠀⣀⣴⠟⠀⠀⠀⠀⣧⣸⣇⠀⠀⠀⠀⣼⢃⣸⡇⠀⠀
 *          ⠀⠀⠀⠀⠀⠀⠀⢸⡏⠉⠉⣿⡀⠀⠀⠀⠀⠉⠉⠙⡷⠦⠴⣾⠉⠉⠉⠁⠀⠀
 *          ⠀⠀⠀⠀⠀⣀⡴⠞⠛⠒⠚⠋⠉⠛⠶⣤⣀⠀⣠⡴⠳⠶⠶⠛⠶⣄⡀⠀⠀⠀
 *          ⠀⠀⣀⡴⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⠟⠁⠀⠀⠀⠀⠀⠀⠈⠙⢶⡄⠀
 *          ⠀⣰⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠀
 *          ⢀⡟⠀⠀⢰⡆⠀⠀⠀⠀⠀⠀⠀⠀⢠⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆
 *          ⢸⠇⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⣶⠀⠀⣧
 *          ⣼⣀⣀⣀⣸⣇⣀⣀⣀⣀⣀⣀⣀⣸⣃⣀⣀⣸⣀⣀⣀⣀⣀⣀⣀⣀⣿⣀⣀⣸
 * @title HappyTogether
 * @dev This is a wedding gift contract. The prupose is to
 *  approximately record the wedding date & to give something
 *  funny to the newlyweds
 */

contract HappyTogether {
    // Keep as constants as they should be!
    address constant BRIDE = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // FILL YOUR OWN
    address constant GROOM = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; // FILL YOUR OWN

    // The wedding gift
    struct Gift {
        bool wrapped;
        bool sheWants;
        bool heWants;
    }

    // To use forever after
    struct Family {
        address wife;
        address husband;
        address home;
    }

    // Initiate structs
    Gift gift;
    Family family;

    // Let everyone know what they've promised
    event ShePromised(string what);
    event HePromised(string what);

    // Gift unwrapping
    event GivenGift(string message, uint256 amount);
    event GiftUnwrapped();

    /**
     *  @dev function for accepting gifts
     */
    function sendGift(string memory _message) external payable {
        gift.wrapped = true;
        emit GivenGift(_message, address(this).balance);
    }

    /**
     *  @dev super important function for calling out a promise
     *  @param _what string is the made promise
     */
    function iPromise(string calldata _what) external {
        if (msg.sender == BRIDE) {
            family.wife = BRIDE;
            emit ShePromised(_what);
        } else if (msg.sender == GROOM) {
            family.husband = GROOM;
            emit HePromised(_what);
        } else {
            revert();
        }
    }

    /**
     *  @dev function to withdraw the wedding gift
     *  @param _home address is the account to which the entire balance of the gift should be send to
     */
    function brightFuture(address _home) external {
        if (_home == address(0)) revert();
        if (!gift.wrapped) revert();

        if (msg.sender == family.wife) {
            gift.sheWants = true;
            handleHome(_home);
        }

        if (msg.sender == family.husband) {
            gift.heWants = true;
            handleHome(_home);
        }

        if (gift.sheWants && gift.heWants) {
            payable(family.home).transfer(address(this).balance);
            giftUnwrapp();
        }
    }

    /**
     *  @dev internal function for home address handling
     *  @param _home address to be set or checked
     */
    function handleHome(address _home) internal {
        if (family.home == address(0)) {
            family.home = _home;
        } else if (family.home != _home) {
            revert();
        }
    }

    /**
     *  @dev simple function that unwrapps the gift and resets values
     */
    function giftUnwrapp() internal {
        gift.wrapped = false;
        gift.sheWants = false;
        gift.heWants = false;
        family.home = address(0);
        emit GiftUnwrapped();
    }
}
