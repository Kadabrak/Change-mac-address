#!/bin/env bash
dir="/etc/NetworkManager/dispatcher.d/pre-up.d/"
rm $dir*
echo "$dir"
for line in $(ip l | grep -oP '(?![0-9]+: )[a-z^0-9]{3,}+(?=:)'); do
	echo $line;
        echo "#!/bin/sh" >> $dir$line.sh
        echo 'IFACE="$1"' >> $dir$line.sh
        echo 'STATE="$2"' >> $dir$line.sh
        echo 'if [ "$IFACE" = '$line' ]; then' >> $dir$line.sh
       	echo ' case "$STATE" in' >> $dir$line.sh
        echo "        pre-up|ip-pre-up|pre-down)" >> $dir$line.sh
        echo "         /usr/bin/mac_changer $line" >> $dir$line.sh
      	echo "	 ;;" >> $dir$line.sh
  	echo "esac" >> $dir$line.sh
        echo "fi" >> $dir$line.sh
        chmod +x $dir$line.sh
        systemctl restart NetworkManager
done


