from beacontools import BeaconScanner, EddystoneTLMFrame, EddystoneFilter

def beaconCallback(bt_addr, rssi, packet, additional_info):
    print(str(bt_addr) + " | " + str(rssi))

if __name__ == "__main__":
    scanner = BeaconScanner(beaconCallback,
                            packet_filter=EddystoneTLMFrame)
    print("Beginning scann...")
    scanner.start()
    