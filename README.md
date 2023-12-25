# Lottery Smart Contract

The Lottery Smart Contract allows Users to participate by buying tickets using ERC-20 tokens, with a chance to win the jackpot.

## Overview

The Lottery Smart Contract introduces a secure and decentralized approach to conducting lotteries. Built on Ethereum, it leverages smart contract technology to ensure transparency, fairness, and automatic prize distribution.

## Features

- **ERC-20 Token Integration:** Users can buy lottery tickets using ERC-20 tokens, providing a seamless and familiar experience.
- **Secure Randomness:** The contract uses the blockhash method for randomness, ensuring a secure and fair lottery draw.
- **Automated Prize Distribution:** Upon closing the lottery, the smart contract automatically transfers the prize to the winner.
- **Manager Controls:** The manager has exclusive rights to close the lottery and determine the winner, adding an extra layer of security.

##  Usage

- Configure your Ethereum wallet (MetaMask) to interact with the deployed smart contract on the Ethereum network.

- Connect to the Ethereum network(Sepolia  ETH) where the smart contract is deployed.

- Buy lottery tickets by calling the buyTickets function.

- Close the lottery when desired using the closeLottery function.

- Retrieve the winner's address using the getWinner function.


## Brief Explanation

- State Variables: These variables define the state of the contract, including the manager, winner, ticket price, total tickets, and more.

- Modifiers: Modifiers are used to enforce access controls, ensuring that certain functions can only be called by authorized users.

- Constructor: The constructor initializes the smart contract with essential parameters.

## Link

=  [link to contract deployed](https://sepolia.etherscan.io/address/0xCB972d20A4dA90F8e645eCa7c484b4d1f8675bF1)

= [Link to buyTickets](https://sepolia.etherscan.io/tx/0x281c4f79e1bfa0bef0d8dcb7221572bae0c6e3717ece1c645d86e0e00130c172)
