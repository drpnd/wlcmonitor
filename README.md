# WLC Monitoring Toolset

This project provides a toolset to monitor Cisco Wireless LAN controller over SNMP.

## Usage

### Count the number of associated stations by protocol

The following command outputs the number of associated stations managed by the controller by association protocol (i.e., IEEE 802.11a, b, g, n (2.4GHz), n (5GHz), and ac).

    ./scripts/protocol.sh HOST COMMUNITY

### Count the number of associated stations by AP name

The following command outputs the number of associated stations managed by the controller by the access point name.

    ./scripts/apname.sh HOST COMMUNITY

### Count the number of associated stations by SSID

The following command outputs the number of associated stations managed by the controller by SSID.

    ./scripts/ssid.sh HOST COMMUNITY

## Tested models
* WLC 5508
* WLC 5760

