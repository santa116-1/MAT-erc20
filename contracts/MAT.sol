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
        _mint(owner(), 100000000000000000000000000);
    }

    /* ========== EMERGENCY ========== */
    function rescueStuckErc20(address _token) external onlyOwner {
        uint256 _amount = IBEP20(_token).balanceOf(address(this));
        IBEP20(_token).safeTransfer(owner(), _amount);
    }
}
