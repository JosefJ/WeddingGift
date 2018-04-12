pragma solidity ^0.4.21;

/*
 *  @title HappyTogether
 *  @dev This is a wedding gift contract. The prupose is to approximately record
 *  the wedding date & to give something funny to the newlyweds
 */
contract HappyTogether {

    // Keep as constants as they should be!
    address constant BRIDE = 0x01; // FILL YOUR OWN
    address constant GROOM = 0x02; // FILL YOUR OWN

    // To remember if they've promised
    struct Promises {
        bool bride;
        bool groom;
    }

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
    Promises promised;
    Gift gift;
    Family family;

    // Let everyone know what they've promised
    event ShePromised(string what);
    event HePromised(string what);

    // Gift unwrapping
    event givenGift(uint amount);
    event giftUnwrapped();

    /*
     *  @dev fallback function for accepting gifts
     */
    function() payable public {
        gift.wrapped = true;
        emit givenGift(msg.value);
    }

    /*
     *  @dev super important function for calling out a promise
     *  @param _what string is the made promise
     */
    function iPromise(string _what) public {
        require(msg.sender == BRIDE || msg.sender == GROOM);

        if (msg.sender == BRIDE) {
            emit ShePromised(_what);
            promised.bride = true;
            family.wife = BRIDE;

        } else if (msg.sender == GROOM) {
            emit HePromised(_what);
            promised.groom = true;
            family.husband = GROOM;
        }
    }

    /*
     *  @dev function to withdraw the wedding gift
     *  @param _home address is the account to which the entire balance of the gift should be send to
     */
    function brightFuture(address _home) public {
        require(msg.sender == family.wife || msg.sender == family.husband);
        require(gift.wrapped);
        handleHome(_home);

        if (msg.sender == family.wife) {
            gift.sheWants = true;
        }

        if (msg.sender == family.husband) {
            gift.heWants = true;
        }

        if (gift.sheWants && gift.heWants) {
            giftUnwrapp();
            family.home.transfer(address(this).balance);
        }
    }

    /*
     *  @dev internal function for home address handling
     *  @param _home address to be set or checked
     */
    function handleHome(address _home) internal {
        if(family.home == address(0)) {
            family.home = _home;
        } else {
            if (msg.sender == family.wife) {
                if (gift.sheWants) {
                    family.home = _home;
                } else {
                    if (family.home != _home) {
                        revert();
                    }
                }
            } else {
                if (gift.heWants) {
                    family.home = _home;
                } else {
                    if (family.home != _home) {
                        revert();
                    }
                }
            }
        }
    }

    /*
     *  @dev simple function that unwrapps the gift and resets values
     */
    function giftUnwrapp() internal {
        gift.wrapped = false;
        gift.sheWants = false;
        gift.heWants = false;
        family.home = address(0);
        emit giftUnwrapped();
    }
}