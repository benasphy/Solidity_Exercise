//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract OrderStatus{
    enum Status{
        pending,
        shipping,
        delivered,
        cancelled
    }
    Status public orderStatus;

    function setDelivered() public{
        orderStatus = Status.delivered;
    }
    function getStatus() public view returns(Status){
        return orderStatus;
    }
}

