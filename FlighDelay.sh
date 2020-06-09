#! /usr/bin/env bash

#Arrival Delay data for the Flights that depart from SFO (first 3 records)
echo "Arrival Delay data for the Flights that depart from SFO (first 3 records)"
awk -F',' '{print $15,$17}' 2007.csv \
| grep "ArrDelay\|Origin\|SFO" \
| head -4 \
| sed 's/ /,/g' > first3sfo.csv 
csvlook first3sfo.csv

#Top Three destination airports
echo "Top Three destination airports"
cut -d',' -f18 2007.csv | sort | uniq -c | sort -nr | head -3 | sed 's/ /,/g' | csvlook

