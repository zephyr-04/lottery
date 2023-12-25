// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Lottery {

    using SafeMath for uint256;

    address public manager;

    address public winner;

    uint256 public ticketPrice;

    uint256 public totalTickets;

    uint256 public totalAmount;

    bool public lotteryOpen;

    mapping(address => uint256) public ticketsBought;

    IERC20 public token;

    event TicketPurchased(address buyer, uint256 ticketsBought);
    event LotteryClosed(address winner, uint256 totalAmount);

    modifier onlyManager() {
        require(msg.sender == manager, "Only the manager can call this function");
        _;
    }
modifier lotteryIsOpen() {
    require(lotteryOpen, "Lottery is closed");
    _;
}
    // modifier lotteryIsOpen() {
    //     require(lotteryOpen, "Lottery is closed");
    //     _;
    // }

    constructor(address _tokenAddress, uint256 _ticketPrice, uint256 _totalTickets) {
        manager = msg.sender;

        token = IERC20(_tokenAddress);

        ticketPrice = _ticketPrice;

        totalTickets = _totalTickets;

        lotteryOpen = true;
    }

    function buyTickets(uint256 _numTickets) external lotteryIsOpen {
        uint256 totalCost = ticketPrice.mul(_numTickets);

        require(token.transferFrom(msg.sender, address(this), totalCost), "Failed to transfer tokens");
        ticketsBought[msg.sender] = ticketsBought[msg.sender].add(_numTickets);
        totalAmount = totalAmount.add(totalCost);
        emit TicketPurchased(msg.sender, _numTickets);
    }

    function closeLottery() external onlyManager lotteryIsOpen {
        require(totalTickets > 0, "No tickets were sold");

        // Used blockhash for random number

        uint256 winningTicket = uint256(blockhash(block.number - 1)) % totalTickets;

        //winner based on the winning ticket

        for (uint256 i = 0; i < totalTickets; i++) {
            if (winningTicket < ticketsBought[msg.sender]) {
                winner = msg.sender;
                break;
            }
            winningTicket -= ticketsBought[msg.sender];
        }

        // Transfer the prize to the winner

        require(token.transfer(winner, totalAmount), "Failed to transfer prize to winner");

        // Close the lottery
        lotteryOpen = false;

        emit LotteryClosed(winner, totalAmount);
    }

    function getWinner() external view returns (address) {
        return winner;
    }
}
