

/*
	registry to look up info on an entity

	there is one of these
*/
contract yellowpages {
	address public owner; // hash of creator i.e. titandao
	
	// avoiding a map in case we end up with more meta
	// then just name (map[name] => EntityDef...)
	EntityDefinition[] public entityDefinitions;


	function yellowpages() {
		owner = msg.sender;
	}


	// TODO maintain list of entity types
	// and suggested key value pairs

	
	struct EntityDefinition {
		string name; // e.g. "person"
		string[] keys; // e.g. "name", "age"
	}


	function entityDefinitionExists(string name) returns (bool exists) {
		exists = false
		for (uint i = 0; i < entityDefinitions.length; i++) {
			if (entityDefinitions[i].name == name) { 
				exists = true; 
			}
		}
	}


	// TODO: can this be called with a string[]?
	function registerEntityDefinition(string name, string[] keys) {
		if entityDefinitionExists(name) {
			// TODO Event already exists
			// ...
			return;
		}

		entityDefinitions.push(EntityDefinition({
			name: name,
			keys: keys
		}));
	}


	// TODO (enforced) conventions

}




/*
	info on a given entity
	essential just a hash account => keys/values

	// TODO should user access this free-form or go through
	// yellowpages entity definitions?
*/
contract entity {

	/*
		meta
	*/
	address owner;
	string entityType; // e.g. "Person", "Company"


	/*
		key-values
	*/
	KeyValue[] public keyValues;

	struct KeyValue {
		string key;
		string value;
	}

	/*
		constructor
	*/
	function entity() {
		owner = msg.sender;
	}

	/*
		public methods
	*/
	function registerKeyValue(string key, string value) {
		string[] keys = getKeys();
		bool found = false;

		for (uint i = 0; i < keyValues.length; i++) {
			if (keyValues[i].key == key) {
				found = true;
				keyValues[i].value = value;
			}
		}

		// if not found add to key value pairs
		if (found == false) {
			keyValues.push(KeyValue({
				key: key,
				value: value
			}));
		}
	}


	function getKeys() returns (string[] keys) {
		for (uint i = 0; i < keyValues.length; i++) {
			keys.push(keyValues[i].key);
		}
	}


	// TODO want key values as well 
	// as meta info
	function getInfo() {


	}


	// interaction with yellowpages

	// function getEntityDefinitions()


	/*
		private methods
	*/

}