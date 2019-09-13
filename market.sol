pragma solidity ^0.5.0;

import './sale.sol';

contract Market {
    address[] sales_list;
    address default_currency;

    constructor(address _default_currency) public {
        default_currency = _default_currency;
    }

    function sell(address thing, uint price) public {
        Sale sale_contract = new Sale(default_currency, thing, price);
        sales_list.push(address(sale_contract));
    }

    function show_listed() public view returns(address[] memory listed){
        return(sales_list);
    }

}
