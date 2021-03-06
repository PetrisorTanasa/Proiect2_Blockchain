//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./Interface.sol";

contract Greeter {
    string private greeting;
    IUniswapV2Router01 tokenAddress;
    IUniswapV2Router01 router= IUniswapV2Router01(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    address private constant _usdt = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

    constructor() {}
    
    function swapETHToUSDT() public payable {
    address[] memory path = new address[](2);
    path[0] = router.WETH();
    path[1] = _usdt;

    router.swapExactETHForTokens{value: msg.value}(
            0,
            path,
            msg.sender,
            block.timestamp + 100
        );
}
}