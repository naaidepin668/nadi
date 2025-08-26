// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract CoinBase {

    mapping(address => bool) private  owners;

    bool public isInit;

    /**
      * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
  * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        require(owners[msg.sender], "Ownable: caller is not the owner");
    }

    function setOwner(address owner,bool auth) public onlyOwner {
        owners[owner] = auth;
    }

    function isOwner(address owner) public view returns (bool) {
        return owners[owner];
    }

    function initOwner(address addr) public{
        require(!isInit, "is init");
        isInit = true;
        owners[addr] = true;
    }

    receive() external payable {
    }

    function withdraw(address payable to, uint256 amount) public onlyOwner {
        require(address(this).balance >= amount, "No funds to withdraw");
        to.transfer(amount);
    }

}
