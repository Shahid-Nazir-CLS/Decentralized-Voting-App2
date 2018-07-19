// If web3 is not undefined, then we'll use that as our provider. 
// If it's undefined (else), we can manually specify the provider ourselves. 
       if (typeof web3 !== 'undefined') {
            web3 = new Web3(web3.currentProvider);
        } else {
            // set the provider you want from Web3.providers
            web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
        }

        // We have to specify a default ethereum account to use 
        // through the web3.eth.defaultAccount method:
        web3.eth.defaultAccount = web3.eth.accounts[0];

        //  Set up the contract ABI so the app knows what functions are available for this contract.
        // This ABI allows you to call functions and receive data from your smart contract.
        var VotesContract = web3.eth.contract([
	{
		"constant": false,
		"inputs": [
			{
				"name": "_candidateName",
				"type": "string"
			}
		],
		"name": "removeCandidate",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_candidateName",
				"type": "string"
			}
		],
		"name": "addCandidate",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "abstain",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "resetCandidates",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "getCount",
		"outputs": [
			{
				"name": "",
				"type": "uint256[]"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "_cand",
				"type": "string"
			}
		],
		"name": "vote",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	}
]);


        // Set up the address of the contract with MyContract.at().
        // The important thing to know is that MyContract.at() returns the instance.
        var Votes = VotesContract.at('0xc0c5cbffd8cd3ffaeca2ba49f7fa420888b4c593');
        console.log(Votes);