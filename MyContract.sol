pragma solidity ^0.4.0;

import "mortal.sol";

contract SimpleWallet is mortal{
	
	mapping(address => Permission) myAddressMapping;

	struct Permission {
		bool isAllowed;
		uint maxTransferAmount;
	}
	
	function addAddressToSenderList(address permitted, uint maxTransferAmount){
		myAddressMapping[permitted] = Permission(true, maxTransferAmount)
	}

	function sendFunds(address reciever, uint amountInWei){
		if(myAddressMapping[msg.sender].isAllowed){
			if(myAddressMapping[msg.sender].maxTransferAmount <= amountInWei){
				bool isTheAmountReallySend = reviever.send(amountInwei)
				if(!isTheAmountReallySend){
					throw;
				}
			}
		}
	}

	//fallback
	function () payable{

	}
}