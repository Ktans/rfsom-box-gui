#!/bin/sh

if [ "$1" != "-q" ]; then
date
fi

#gpsdata=$( gpspipe -w -n 10 |   grep -m 1 lon )
gpsdata=$( gpspipe -w | grep -m 1 TPV )
lat=$( echo "$gpsdata"  | sed -n 's|.*"lat":\([0-9.]*\).*|\1|p')
lon=$( echo "$gpsdata"  | sed -n 's|.*"lon":\([0-9.]*\).*|\1|p')
alt=$( echo "$gpsdata"  | sed -n 's|.*"alt":\([0-9.]*\).*|\1|p')
dt=$( echo "$gpsdata" | sed -n 's|.*"time":"\([^.]*\).*|\1|p' | sed 's/T/ /g')
if [ "$1" != "-q" ]; then
echo "$dt"
echo "You are here: $lat, $lon at $alt"
fi

rm -rf /tmp/gpslat
rm -rf /tmp/gpslon
rm -rf /tmp/gpsalt
rm -rf /tmp/gpstime

echo $lat > /tmp/gpslat
echo $lon > /tmp/gpslon
echo $alt > /tmp/gpsalt
echo $dt > /tmp/gpstime

