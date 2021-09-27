// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;
import "./ERC20/BEP20.sol";
import "./ERC20/IBEP20.sol";
import "./ERC20/SafeBEP20.sol";
import "./access/Ownable.sol";

contract MAT is BEP20, Ownable {
    using SafeBEP20 for IBEP20;

    constructor()
        // uint256 endReleaseTime_
        BEP20("mymasterwar.com", "MAT")
    {
        _mint(
            0x83e9af907958d775385Eb24fb2716199329536Df,
            25000000000000000000000000
        ); //25% token ecosystem
        _mint(
            0x7b2D3db18b030D7F17FC9824b18bC056786beCF8,
            10500000000000000000000000
        ); //10.5% Liquidity & marketing:
        _mint(
            0x582dC54ad92477208BcaE3Fd79e5B7012794Aa0C,
            15000000000000000000000000
        ); //15% Treasury
        _mint(
            0x79057F9901bF98c3cEC517ba63F5c0414A216779,
            12000000000000000000000000
        ); //12% Private Round
        _mint(
            0x304b39F6D55f3ab16BDD2083cc835E65663E3D82,
            2500000000000000000000000
        ); //2.5% Public round
        _mint(
            0xa40D031bcC37E79dA4d38e1Ec868e214a1bc54Fc,
            20000000000000000000000000
        ); //20% team + advisor
        _mint(
            0x8C3913829a57dcC7D141CA1547D154b149D356a2,
            15000000000000000000000000
        ); //15% Play to earn
    }

    /* ========== EMERGENCY ========== */
    /*
    Users make mistake by transfering usdt/busd ... to contract address. 
    This function allows contract owner to withdraw those tokens and send back to users.
    */
    function rescueStuckErc20(address _token) external onlyOwner {
        uint256 _amount = IBEP20(_token).balanceOf(address(this));
        IBEP20(_token).safeTransfer(owner(), _amount);
    }
}
