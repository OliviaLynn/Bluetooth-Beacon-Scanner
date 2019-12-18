#!bin/bash

# ------------------------------------------------------------------------------
# REFRESHING BLUETOOTH SCANNER
# Launches, closes, and re-launches our python scanner/UDP client on a regular 
#	basis to prevent the program from freezing in its old age

# Uses bash scripting and xdotool automation tool:
# bash:
#	TUTORIAL: tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html
# xdotool:
#	INSTALL: sudo apt install xdotool
# 	MANUAL: manpages.ubuntu.com/manpages/trust/man1/xdotool.1.1html
#
# LAUNCH: type "bash [pathtofile]" in the command line
#	(For example, I have this stored on the Desktop at the time of typing 
#	this, so I type "bash ~/Desktop/RefreshingBluetoothScanner.sh")
# ------------------------------------------------------------------------------

# SCANTIME is how long we scan for before refreshing our scanner, in seconds
# 	(For example, SCANTIME=$((60 * 3)) would refresh every 3 minutes)
SCANTIME=$((60 * 60 * 1))

# PATHTOSCANNER is the path to the python file that scans beacons/sends UDP
PATHTOSCANNER="~/Desktop/BeaconToUnity_UDPClient.py"

echo Begin
while [ 1 ]; do
	# Launch a new terminal window, which runs 
	lxterminal -t SCANNER -e "python $PATHTOSCANNER"
	echo Lanched scanner, refreshing in "$SCANTIME" seconds.

	# Let it scan:
	sleep $SCANTIME
	echo "Closing scanner..."
	
	# If we can find the window we made, close it:
	SCANWIN=$(xdotool search --name SCANNER)
	if [ "$SCANWIN" = "" ]; then
		echo "Window not found."
	else
		xdotool windowactivate $SCANWIN
		xdotool key alt+F4
		echo "Closed."
	fi
done
echo End