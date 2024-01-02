# 365-Test
This is a simple challenge i put to myself. Everyday in 2024 i have to contribute to this Repository, I want all greens, haha.

### How am i going about this?
* I am made chatgpt generate an outline for me through out this whole year.

### Can i do what Chatgpt outlined?
* I will try my best follow it to the latter and modify just a few.

### what is the goal of this project?
* I do not feel too confident in my foundry testing skills, so i just want to boost my ego in that aspect, haha.
* I am trying to find bugs too, soo hopefully this will open my eyes to more bugs, might not be possible too lets see.





## I am using Foundry, and this is normal foundry stuff to help you understand the framework & set it up.

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

