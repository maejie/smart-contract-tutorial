pragma solidity ^0.5.0;

import './thing.sol';
import './currency.sol';

contract Sale{

    uint price;
    address seller;
    address buyer;
    Thing thing_for_sale;
    Currency trading_currency; 

    constructor(address _currency_address, address _thing_address, uint _price) public {
        seller = msg.sender;
        trading_currency = Currency(_currency_address);
        thing_for_sale = Thing(_thing_address);
        price = _price;
    }
    
    function reserve() public returns(bool success){
        if (buyer == address(0x0)){
            buyer = msg.sender;
            return true;
        }else{
            return false;
        }
    }

    function settlement() public returns(bool success){
        if (buyer != address(0x0)
        && thing_for_sale.getOwner() == address(this)
        && trading_currency.balanceOf(address(this)) >= price){
            trading_currency.transfer(seller, price);
            thing_for_sale.transfer(buyer);
            return true;
        } else {
            return false;
        }
    }

    function getInfo() public view returns(string memory item_name,
                                            uint item_price,
                                            address item_seller,
                                            bool has_stock,
                                            bool has_deposit){
        string memory name = thing_for_sale.getName();
        
        bool stock;
        if(thing_for_sale.getOwner() == address(this)){
            stock = true;
        }else{
            stock = false;
        }
        
        bool deposit;
        if(trading_currency.balanceOf(address(this)) >= price){
            deposit = true;
        }else{
            deposit = false;
        }
        
        return (name, price, seller, stock, deposit);
    }

}
