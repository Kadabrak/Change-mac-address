# Change-mac-address
A script to randomize the mac address of a specific interface

You need to have the sudo permission to execute this script  
```bash
./mac_changer.sh [interface name]
```

put mac_changer.sh and rename it to be:  
```bash
chmod +x mac_changer.sh
mv mac_changer.sh /usr/bin/mac_changer
```

make it executable with:  
```bash
chmod +x /usr/bin/mac_changer
```

you can run the set-up_networkmanager.sh to set up the randomization for all the interfaces before a connection to a network.  
```bash
chmod +x set-up_networkmanager.sh  

./set-up_networkmanager.sh  
```
