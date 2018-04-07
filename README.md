# [firehol_blocklist_lookup]  
##### Generate a CSV file containing possible malicious IP addresses using FireHOL's blocklist IP sets.  

#### Description  
Simply put, this gathers a list of possible malicious IP addresses using the dataset on [GitHub](https://github.com/firehol/blocklist-ipsets) gathered by [FireHOL](https://iplists.firehol.org/). This can be used in Splunk (or any other log aggregator) to sweep you environment or setup alerts when traffic is generated.  


#### Prerequisites  
- Bash  
- Curl  

#### Setup  
Open a terminal and run the following commands:  
```bash
git clone https://github.com/leunammejii/firehol_blocklist_lookup.git
cd firehol_blocklist_lookup
```

If you want to change the source of the IP sets:
- Navigate to [FireHOL's blocklist-ipset GitHub project](https://github.com/firehol/blocklist-ipsets)  
- Select one of the sets  
- Select the `Raw` option  
- Copy the URL  
- Paste the URL on a separate line in `firehol_ipsets.txt`  

#### Create the Lookup Table  
To run the script, run the following command from the project directory:  
```bash
bash create_lookup.sh OUTPUTFILE
```

The `OUTPUTFILE` can be whatever name you choose. A sample lookup table can be found [here](https://raw.githubusercontent.com/leunammejii/firehol_blocklist_lookup/master/sample_lookup_table.csv).  

#### Destroy
To remove the project completely,  run the following commands:  
```bash
rm -rf firehol_blocklist_lookup
```
