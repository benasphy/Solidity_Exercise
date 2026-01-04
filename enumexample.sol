//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract Ecommerce{
    
    enum orderStatus{
        Created,
        Paid,
        Shipped,
        Delivered,
        Cancelled
    }

    orderStatus public status;

    function pay() public{
        require(status == orderStatus.Created);
        status = orderStatus.Paid;
    }

    function ship() public{
        require(status == orderStatus.Paid);
        status = orderStatus.Shipped;
    }

}