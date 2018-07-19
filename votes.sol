pragma solidity ^0.4.24;

contract Votes{

    mapping(string => uint) candidateVotes;
    mapping(address => bool) voters;
    
    function Votes() public{
        candidateVotes["NC"] = 0;
        candidateVotes["BJP"] = 0;
        candidateVotes["INC"] = 0;
        candidateVotes["PDP"] = 0;
        candidateVotes["PP"] = 0;
    }
    
    function Vote(string _cand) public{
        
        var voter = msg.sender;
        var alreadyVoted = voters[voter];
        
        if(alreadyVoted == false){
            voters[voter] = true;
            candidateVotes[_cand] = candidateVotes[_cand] + 1;
        }
    }
    
    function getCount() public constant returns(uint, uint, uint, uint, uint){
        uint PDPCount = candidateVotes["PDP"];
        uint BJPCount = candidateVotes["BJP"];
        uint NCCount = candidateVotes["NC"];
        uint INCCount = candidateVotes["INC"];
        uint PPCount = candidateVotes["PP"];
        return(NCCount, BJPCount, INCCount, PDPCount, PPCount);
    }
}