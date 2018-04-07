#!/bin/bash
#
# Description: Generate a CSV file containing possible malicious IP addresses using FireHOL's blocklist IP sets.
# Usage:       bash create_lookup.sh OUTPUTFILE
#

IPSETS='firehol_ipsets.txt'
OUTPUTFILE="$1"

echo 'ip_address,source' | tee "$OUTPUTFILE" > /dev/null

while read -r URL
do
    BL_SOURCE=$(echo "$URL" | rev | cut -d / -f -1 | rev | cut -d . -f 1)
    curl -s "$URL" | \
        grep -v \# | \
        sed "s/$/,$BL_SOURCE/g" | \
        tee -a "$OUTPUTFILE" > /dev/null
done<"$IPSETS"
