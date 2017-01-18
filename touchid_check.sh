#!/bin/sh
#
#
#
#Jamf Pro Extension Attribute to check if TouchID is enabled at the system level
#Use -r instead of -rs to check user-level rather than system level
#swap "functionality" for "unlock" and use $3 to check just the unlock status
#Replace with -c to see a count of fingerprints
#Comment out the if then statements and change the TouchIDStatus= to results= for a 0 or 1 response
#
#
#
TouchIDStatus=`bioutil -rs | grep functionality | awk '{print $4}'`
if [[ "$TouchIDStatus" = "0" ]]; then
	result="TouchIDDisabled"
elif [[ "$TouchIDStatus" = "1"  ]]; then
	result="TouchIDEnabled"
else 
	result="Error"
fi
echo "<result>$result</result>"
