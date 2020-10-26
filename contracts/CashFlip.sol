pragma solidity =0.5.12;

contract CashFlip {

    //State Variables
      address payable public player = msg.sender;
      uint public playerBalance = address(msg.sender).balance;
      address payable public owner;
      event result (bool);

    //Sets Owner Properties
constructor() public payable {owner = msg.sender;}

modifier onlyOwner() {require (msg.sender == owner, "Not owner!");
_;}

    //View Contract Balance
function getBalance() public view onlyOwner returns (uint) {
    return address(this).balance;}

    //Deposit ETH to Contract
function depositETH () public payable onlyOwner {}

    //Withdraw ETH from Contract
function withdrawETH (uint _amount) public onlyOwner {
    owner.transfer(_amount);}

    //Takes Input from Client-Side App & Determines Results
function randomFlip (uint _playerGuess) public payable  {
    require(_playerGuess == 0 || _playerGuess == 1);
    require (address(this).balance > msg.value * 2);

    if (now % 2 == _playerGuess) {
        msg.sender.transfer(msg.value * 2);
        emit result (true);}
        else {emit result (false);}}
}
