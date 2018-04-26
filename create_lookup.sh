#!/bin/bash
#
# Description: Generate a CSV file containing possible malicious IP addresses using FireHOL's blocklist IP sets.
# Usage:       bash create_lookup.sh OUTPUTFILE
#

IPSETS='firehol_ipsets.txt'
CLONEDIR="$1/blocklist-ipsets"
OUTPUTFILE="$2"

if [[ -d "$CLONEDIR/.git" ]]
then
    (
        cd "$CLONEDIR" || exit
        git pull https://github.com/firehol/blocklist-ipsets.git
    )
else
    git clone https://github.com/firehol/blocklist-ipsets.git "$CLONEDIR"
fi

echo 'ip_address,source' | tee "$OUTPUTFILE" > /dev/null

while read -r IPSET
do
    BL_SOURCE=$(echo "$IPSET" | rev | cut -d / -f -1 | rev | cut -d . -f 1)
    cat "$CLONEDIR"/"$IPSET" | \
        grep -v \# | \
        sed "s/$/,$BL_SOURCE/g" | \
        tee -a "$OUTPUTFILE" > /dev/null
done<"$IPSETS"
