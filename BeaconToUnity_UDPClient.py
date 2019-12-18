SERVER_IP = "10.0.0.154"
SERVER_PORT = 9001

BUFFER_SIZE = 20

import math, random, time
import socket
from beacontools import BeaconScanner, EddystoneTLMFrame, EddystoneFilter

printBuffer = dict()
printBuffer["addrs"] = []

def beaconCallback(bt_addr, rssi, packet, additional_info):
    # Print the addresses we're sending (but as a group)
    #print("~"),
    if (len(printBuffer["addrs"])) < BUFFER_SIZE:
        printBuffer["addrs"].append(bt_addr)
    else:
        print(" | ".join(printBuffer["addrs"]) + " | " +
              time.strftime("%m/%d %H:%M", time.localtime()))
        printBuffer["addrs"] = []
    
    # Send each address/rssi pair, if we can
    s = "{}|{:d}".format(bt_addr, rssi)
    try:
        sock.sendto(s.encode(), (SERVER_IP, SERVER_PORT))
    except:
        print("Error: could not send data")
        pass

if __name__ == "__main__":
    scanner = BeaconScanner(beaconCallback,
        packet_filter=EddystoneTLMFrame)
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    print("Beginning scan...")
    scanner.start()