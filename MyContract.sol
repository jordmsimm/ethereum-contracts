progma solidity ^0.4.0;


contract MyContract is mortal{
	
	uint myVariable;
	
	//constructor
	function MyContract() payable{
		myVariable = 5;
	
	}

	//setter
	function setMyVariable(uint myNewVariable) onlyownner{
			myVariable = myNewVariable;
	}

	function getMyVariable() constant returns(uint){
		return myVariable
	}

	function getMycontractBalance constant returns(uint){
		return this.balance
	}
	
	//fallback
	function () payable{

	}
}
