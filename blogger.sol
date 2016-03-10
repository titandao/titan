/*
	each blogger has one of these
*/
contract blogger {
	

}


/*
	the core contract readers subscribe to. there is only one instantiated
*/
contract publisher {
	// map blogger hash to most recent post
	mapping (address => string) public posts


	// TODO posts should be deleted every so 
	// often to keep this contract's memory low, 
	// and to make posts ephemeral in general
}