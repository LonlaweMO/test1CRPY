// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CarrotPay is Ownable, ERC20 {
    // コンストラクタで Ownable と ERC20 の初期化
    constructor() Ownable(0xC198B625e8BEC4257644B621aA4d2a99F764646E) ERC20("Carrot Pay","CARROT") {
        // 初期供給量のミント
        _mint(msg.sender, 10000 * (10 ** uint256(decimals())));
    }

    // 小数点以下の桁数を設定
    function decimals() public view virtual override returns (uint8) {
        return 12;
    }

    // mint 関数（オーナーのみ実行可能）
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
    // burn 関数（任意のアカウントが自身のトークンをバーン可能）
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}