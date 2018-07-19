pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract Votes{

    mapping(string => uint) candidateVotes;// to contain votes for each candidate
    mapping(address => bool) voters;// to contain addresses of each voter who voted
    string[] candidateNames;
    string[] candidateSymbols;
    string electionName;
    string duration;
    string electionStartTime;
    
    event VoteEvent(
        
            
    );
    
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    address owner;
    
    function Votes() public{
        owner = msg.sender;
    }
    
    function vote(string _cand) public{
        
        var voter = msg.sender;
        var alreadyVoted = voters[voter];
        
        if(alreadyVoted == false){
            voters[voter] = true;
            candidateVotes[_cand] = candidateVotes[_cand] + 1;
            
        }
        VoteEvent();
       
    }
    
    function addCandidate(string _candidateName, string _symbol) onlyOwner public{
        candidateNames.push(_candidateName);
        candidateVotes[_candidateName] = 0;
        candidateSymbols.push(_symbol);
    }
    
    function removeCandidate(string _candidateName) onlyOwner public{
        delete candidateVotes[_candidateName];
        for(uint i = 0; i < candidateNames.length; i++){
            if(keccak256(candidateNames[i]) ==  keccak256(_candidateName)){
                candidateNames[i] = candidateNames[candidateNames.length -1];
                candidateNames.length--;
                candidateSymbols[i] = candidateSymbols[candidateSymbols.length -1];
                candidateSymbols.length--;
            }
        }
        
        
    }
    
    function resetCandidates() onlyOwner public{
        for(uint i = 0; i < candidateNames.length; i++){
            delete candidateVotes[candidateNames[i]];
        }
        delete candidateNames;
        delete candidateSymbols;
    }
    

    
    function abstain() public{
        var voter = msg.sender;
        var alreadyVoted = voters[voter];
        
        if(alreadyVoted == false){
            voters[voter] = true;
        }
    }
    
    function getCount() public constant returns(uint[]){
        uint[] temp;
        for(uint i = 0; i < candidateNames.length; i++){
            uint votes = candidateVotes[candidateNames[i]];
            temp.push(votes);
        }
        return(temp);
    }
    
    function getCandidate(uint _id) public constant returns(string, string, uint){
        return(candidateNames[_id], candidateSymbols[_id], candidateVotes[candidateNames[_id]]);
    }
    
    function getCandCount() public constant returns(uint){
        return(candidateNames.length);
    }
    
    function setElectionParameters(string _electionName, string _duration)onlyOwner public{
        electionName =_electionName;
        duration = _duration;
        VoteEvent();
    }
    
    function getElectionParameters() public constant returns(string){
        return(electionName);
    }
    
    function setElectionStartTime(string _electionStartTime)onlyOwner public{
        electionStartTime = _electionStartTime;
    }
    
    function getElectionStartTime() public constant returns(string){
        return electionStartTime;
    }
    
}