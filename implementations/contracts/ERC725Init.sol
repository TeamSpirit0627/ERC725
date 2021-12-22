// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

// modules
import "./ERC725XInit.sol";
import "./ERC725YInit.sol";

/**
 * @title Proxy Implementation of ERC725 bundle
 * @author Fabian Vogelsteller <fabian@lukso.network>
 * @dev Bundles ERC725X and ERC725Y together into one smart contract
 */
contract ERC725Init is ERC725XInit, ERC725YInit {
    /**
     * @notice Sets the owner of the contract
     * @param _newOwner the owner of the contract
     */
    function initialize(address _newOwner)
        public
        virtual
        override(ERC725XInit, ERC725YInit)
        onlyInitializing
    {
        ERC725XInit.initialize(_newOwner);
        ERC725YInit.initialize(_newOwner);
    }

    // NOTE this implementation has not by default: receive() external payable {}
}
