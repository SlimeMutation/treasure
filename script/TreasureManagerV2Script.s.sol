// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TreasureManager} from "../src/TreasureManager.sol";

import "forge-std/Vm.sol";
import {Script, console } from "forge-std/Script.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

import "../src/TreasureManager.sol";
import "../test/EmptyContract.sol";

contract TreasureManagerV2Script is Script {

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address treasureManagerV1 = 0xCD8a1C3ba11CF5ECfa6267617243239504a98d90;
        TreasureManager treasureManagerV2Implementation = new TreasureManager();

        ProxyAdmin treasureManagerProxyAdmin = ProxyAdmin(getProxyAdminAddress(treasureManagerV1));

        treasureManagerProxyAdmin.upgradeAndCall(
            ITransparentUpgradeableProxy(treasureManagerV1),
            address(treasureManagerV2Implementation),
            hex""
        );

        vm.stopBroadcast();
    }

    function getProxyAdminAddress(address proxy) internal view returns (address) {
        address CHEATCODE_ADDRESS = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D;
        Vm vm = Vm(CHEATCODE_ADDRESS);
        bytes32 adminSlot = vm.load(proxy, ERC1967Utils.ADMIN_SLOT);
        return address(uint160(uint256(adminSlot)));
    }
}