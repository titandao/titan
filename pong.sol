

/*
	allow players to compete for a prize

	one player offers a prize if they're beaten
	another player matches the amount and they start playing

	the winner gets both deposits, minus a fee

	the fee if for maintenance of the contract and development 
	of the game

	
	application must maintain state of online users with each fetching its own 
	challenge, as well as timing out users if no ping for too long
*/


// TODO: referee concept, with initial app being initial referee

contract pong {
	// an address can only have one challenge open 
	// at a time
	mapping (address => Challenge) challenges;


	struct Challenge {
		// address challenger;
		uint wei;
		address acceptor;
	}



	function submitChallenge() {
		// if there's a challenge already set,
		// return them money from before
		// TODO
		if (challenges[msg.sender] != 0) {
			msg.sender.send(challenges[msg.sender].wei);
		}

		challenges[msg.sender] = Challenge({
			wei = msg.value
		});
	}


	function removeChallenge() {
		delete challenges[msg.sender];
	}


	function acceptChallenge(address challenger) {

	}

}