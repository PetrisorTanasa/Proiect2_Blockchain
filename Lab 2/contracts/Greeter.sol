//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./Interface.sol";

contract Greeter {
    string private greeting;
    IUniswapV2Router01 tokenAddress;
    IUniswapV2Router01 router= IUniswapV2Router01(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);

    constructor(address _uniswap) public {
    tokenAddress = router;
    }
    function tastSwapExactETHForTokens(
        uint amountOut,
        address token,
        uint deadline
    ) external payable {
        address[] memory path = new address[](2);
        path[0] = router.WETH();
        path[1] = token;
        router.swapExactETHForTokens(
            amountOut,
            path,
            msg.sender,
            deadline
        );
    }
}