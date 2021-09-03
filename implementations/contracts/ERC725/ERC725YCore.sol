// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

// interfaces
import "./IERC725Y.sol";

// modules
import "@openzeppelin/contracts/utils/introspection/ERC165Storage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title ERC725 Y data store
 * @dev Contract module which provides the ability to set arbitrary key value sets that can be changed over time.
 * It is intended to standardise certain keys value pairs to allow automated retrievals and interactions
 * from interfaces and other smart contracts.
 *
 * `setData` should only be callable by the owner of the contract set via ERC173.
 *
 *  @author Fabian Vogelsteller <fabian@lukso.network>
 */
abstract contract ERC725YCore is ERC165Storage, IERC725Y {
    bytes4 internal constant _INTERFACE_ID_ERC725Y = 0x37e619de;

    mapping(bytes32 => bytes) internal store;

    /* Public functions */

    /**
     * @notice Gets data at a given `key`
     * @param _key the key which value to retrieve
     * @return _value The data stored at the key
     */
    function getData(bytes32 _key)
        public
        view
        virtual
        override
        returns (bytes memory _value)
    {
        return store[_key];
    }

    /**
     * @notice Sets data at a given `key`
     * @param _key the key which value to retrieve
     * @param _value the bytes to set.
     */
    function setData(bytes32 _key, bytes calldata _value)
        public
        virtual
        override
    {
        store[_key] = _value;
        emit DataChanged(_key, _value);
    }

    /**
     * @notice Gets array of data at multiple given `key`
     * @param _keys the keys which values to retrieve
     * @return values The array of data stored at multiple keys
     */
    function getDataMultiple(bytes32[] calldata _keys)
        public
        view
        virtual 
        override
        returns(bytes[] memory)
    {
        uint256 length = _keys.length;
        bytes[] memory values = new bytes[](length);

        for (uint256 i=0; i < length; i++) {
            values[i] = getData(_keys[i]);
        }

        return values;
    }

    /**
     * @notice Sets array of data at multiple given `key`
     * @param _keys the keys which values to retrieve
     * @param _values the array of bytes to set.
     */
    function setDataMultiple(bytes32[] calldata _keys, bytes[] calldata _values)
        public
        virtual
        override
    {
        for (uint256 i = 0; i < _keys.length; i++) {
            setData(_keys[i], _values[i]);
        }
    }
    
    /* Modifiers */
}
