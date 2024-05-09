// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {ASC20Market} from "../src/ASC20Market.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployASC20Market is Script {
    function run() external returns (address) {
        address proxy = deployASC20Market();
        return proxy;
    }

    function deployASC20Market() public returns (address) {
        vm.startBroadcast();
        ASC20Market asc20Market = new ASC20Market();
        ERC1967Proxy proxy = new ERC1967Proxy(address(asc20Market), "");
        ASC20Market(payable(address(proxy))).initialize();
        vm.stopBroadcast();
        return address(proxy);
    }
}
