#! /bin/bash

export PATH=/sbin:/usr/sbin:/bin:/usr/bin
export LANGUAGE=en_US.utf8

base=`dirname "$0"`

echo -n "Generating pppd.resolv.conf..." >> "$base/forticlientsslvpn.log"

ifup=0
while [ "$ifup" == "0" ]; do
	sleep 1
	logstat=`awk '
	/^Connect:/	{
		dns1 = "";
		dns2 = "";
		up = 0;
		}
	/^local/	{
		up = 1;
		}
	/^primary/	{
		dns1 = $4;
		}
	/^secondary/	{
		dns2 = $4;
		}
	END		{
		print dns1 ":" dns2 ":" up
	}' "$base/pppd.log"`

	dns1=`echo $logstat|awk -F : ' {print $1 }'`
	dns2=`echo $logstat|awk -F : ' {print $2 }'`
	ifup=`echo $logstat|awk -F : ' {print $3 }'`
done

if [ "x$dns1" != "x" ]; then
	echo "nameserver	$dns1"
fi

if [ "x$dns1" == "x$dns2" ]; then
	dns2=""
fi

if [ "x$dns2" != "x" ]; then
	echo "nameserver	$dns2"
fi

echo "Done" >> "$base/forticlientsslvpn.log"

