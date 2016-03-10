# titan
the actual titan dao



What is below is tentative.

# token.sol

To be registered as "TITANSHR" i.e. 2 TITANSHRs, or titan shares.

# titan.sol

To be registered as "titan" by "neo"




# reminder name registration

var myName = "neo"
registrar.owner(myName)
registrar.reserve.sendTransaction(tokenName, {from: eth.accounts[0]});

# reminder contract flow


var tokenSource = 'contract { ... }'

var tokenCompiled = eth.compile.solidity(tokenSource)

// there could be one of these that people refer to
// OR others could create their own which would then have its own address
var democracy = democracyContract.new(args... { })


// others instantiating it
var democracy = eth.contract(daoCompiled.Democracy.info.abiDefinition).at(democracy.address);