pragma solidity ^0.4.0;

import "mortal.sol";

contract SimpleWallet is mortal{
	
	mapping(address => Permission) permittedAddresses;

	event someoneAddedSomeonToSendersList(address thePersonWhoAdded, address thePersonWhoIsAllowedNow,  uint thisMuchHeCanSend);

	struct Permission {
		bool isAllowed;
		uint maxTransferAmount;
	}
	
	function addAddressToSenderList(address permitted, uint maxTransferAmount) onlyowner{
		permittedAddresses[permitted] = Permission(true, maxTransferAmount);
		someoneAddedSomeonToSendersList(msg.sender, permitted,maxTransferAmount);
	}

	function sendFunds(address reciever, uint amountInWei){
		if(permittedAddresses[msg.sender].isAllowed){
			if(permittedAddresses[msg.sender].maxTransferAmount >= amountInWei){
				bool isTheAmountReallySent = reciever.send(amountInWei);
				if(!isTheAmountReallySent){
					throw;
				}
			}else{
				throw;
			}
		}else{
			throw;
		}
	}

	function removeAddressFromSendersList(address theAddress){
		delete permittedAddresses[theAddress];
	}

	//fallback
	function () payable{

	}
}

