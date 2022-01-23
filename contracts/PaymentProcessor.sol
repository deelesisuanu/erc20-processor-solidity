// SPDX-License-Identifier: MIT
// pragma solidity >=0.4.22 <0.9.0;
// pragma solidity ^0.6.2;
pragma solidity ^0.8.11;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract PaymentProcessor {
    
    address public admin;
    IERC20 public dai;

    event paymentDone (
        address payer,
        uint amount,
        uint paymentId,
        uint date   
    );

    constructor(address adminAdrress, address daiAddress) public {
        admin = adminAdrress;
        dai = IERC20(daiAddress);
    }

    function pay(uint amount, uint paymentId) external {
        dai.transferFrom(msg.sender, admin, amount);
        emit paymentDone(msg.sender, amount, paymentId, block.timestamp);
    }

}