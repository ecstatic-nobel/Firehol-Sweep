# [Firehol Blocklist LookupTable]  
##### Generate a CSV file containing possible malicious IP addresses using FireHOL's blocklist IP sets.  

#### Description  
Simply put, this gathers a list of possible malicious IP addresses using the datasets on [GitHub](https://github.com/firehol/blocklist-ipsets) gathered by [FireHOL](https://iplists.firehol.org/). This can be used in Splunk to sweep you environment or setup alerts when traffic is detected.  


#### Prerequisites  
- Bash  
- Curl  
- Git  

#### Setup  
Open a terminal and run the following commands:  
```bash
git clone https://github.com/ecstatic-nobel/Firehol-Blocklist-LookupTable.git
cd Firehol-Blocklist-LookupTable
```

If you want to change the source of the IP sets:  
- Navigate to [FireHOL's blocklist-ipset GitHub project](https://github.com/firehol/blocklist-ipsets)  
- Paste the name of the IP set on a separate line in `firehol_ipsets.txt`  

#### Create the Lookup Table  
To run the script, run the following command from the project directory:  
```bash
bash create_lookup.sh CLONEDIR OUTPUTFILE
```

The `CLONEDIR` is the directory where you want to clone the FireHOL blocklist-ipsets project. The `OUTPUTFILE` is the path to the new lookup table that will be generated. A sample lookup table can be found [here](https://raw.githubusercontent.com/ecstatic-nobel/Firehol-Blocklist-LookupTable/master/sample_lookup_table.csv).  

#### Destroy  
To remove the project completely,  run the following commands:  
```bash
rm -rf Firehol-Blocklist-LookupTable
```
