# Bluetooth Beacon Scanner
<img src="https://img.shields.io/badge/python-2.7-blue"> <img src="https://img.shields.io/badge/platform-rpi-blue"> <img src="https://img.shields.io/badge/maintained%3F-no-red" /> <img src="https://img.shields.io/github/issues/OliviaLynn/Bluetooth-Beacon-Scanner" /> 

For constant, real-time scanning of Eddystone Bluetooth Beacons with a Raspberry Pi. Forwards scanned address/RSSI pairs onwards to a specified UDP server.

## Getting Started

### Prerequisites

#### Xdotool (3.20160805.1)
Allows us to perform serveral automation tasks. In our case, we need it to find and close our additional shell window so our bash script can relaunch it every hour.
```shell
$ sudo apt install xdotool
```
#### Beacontools (1.3.1)
A library for working with Bluetooth LE Beacons
```shell
$ pip install beacontools
```

### Running
- Set your target server IP and port at the top of `BeaconToUnity_UDPClient.py`.
- Change `PATHTOSCANNER` in `RefreshingBluetoothScanner.sh` to properly reflect your file structure.
- Run in a shell:
```shell
$ bash <path/to/RefreshingBluetoothScanner.sh>
```

## Reference
- A quick bash tutorial can be found [here](tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html).
- Xdotool's [project page](https://www.semicomplete.com/projects/xdotool/) and [GitHub](https://github.com/jordansissel/xdotool).
 
