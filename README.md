## Foundry

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

```
forge script script/OneDollarTreasure.s.sol:OneDollarTreasureScript --rpc-url $RPC_URL --private-key $PRIVKEY


forge script script/TreasureManagerScript.s.sol:TreasureManagerScript --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast -vvvv

address===== 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90
treasureManagerProxyAdmin===== 0xb17646006b3057714eafF5329b8e95F654B03Ba4

//调用合约方法
$ cast call 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "treasureManager()(address)"
0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266


//装张eth
$ cast send --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 --value 1000000000000000000

//查询token余额
$ cast call 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "tokenBalances(address)(uint256)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE
1000000000000000000 [1e18]


//查询erc-20 token余额
$ cast call 0xB0D4afd8879eD9F52b28595d31B441D079B2Ca07 "balanceOf(address)(uint256)" 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
100000000000000000000000000000000000000000 [1e41]

//转账erc20
cast send --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0xB0D4afd8879eD9F52b28595d31B441D079B2Ca07 "transfer(address,uint256)" 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 1000000000000000000000

//查询token余额
$ cast call 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "tokenBalances(address)(uint256)" 0xB0D4afd8879eD9F52b28595d31B441D079B2Ca07


//调用合约方法approve
$ cast send --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0xB0D4afd8879eD9F52b28595d31B441D079B2Ca07 "approve(address,uint256)(bool)" 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 100000000000000000000000

//充值erc20
$ cast send --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "depositERC20(address,uint256)(bool)" 0xB0D4afd8879eD9F52b28595d31B441D079B2Ca07 1000000000000000000000
1000000000000000000000 [1e21]

//grantRewards
cast send 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "grantRewards(address,address,uint256)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 1000000000000000000 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --rpc-url 127.0.0.1:8545

//queryRewards
cast call 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "queryRewards(address)(uint256)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
cast call 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "queryRewards(address)(uint256)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
1000000000000000000

//claimToken
$ cast send --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "claimToken(address)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE

//查询eth余额
cast balance 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
9999989532564355804372

//owner()
cast call 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "owner()(address)"
0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266


//查看合约代码
cast code 0xb17646006b3057714eafF5329b8e95F654B03Ba4

cast call 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90 "getValue()(uint256)"

forge script script/TreasureManagerV2Script.s.sol:TreasureManagerV2Script --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast -vvvv
```