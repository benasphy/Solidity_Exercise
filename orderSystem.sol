//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract orderSystem{

    enum orderStatus{
        Placed,
        Shipped,
        Delivered,
        Cancelled
    }

    orderStatus public status;

    constructor(){
        status = orderStatus.Placed; //Default State
    }

    function ship() public{
        require(status == orderStatus.Shipped, "Not shipped");
        status = orderStatus.Shipped;
    }

    function delivery() public{
        require(status == orderStatus.Delivered, "Not Delivered");
        status = orderStatus.Delivered;
    }

    function cancelling() public{
        require(status != orderStatus.Delivered, "Already Delivered");
        status = orderStatus.Cancelled;
    }
}
