#! /usr/bin/env python

import pandas as pd
import numpy as np

#a) Arrival delay for the flights that depart from SFO
FlightData = pd.read_csv('2007.csv')
first_three_sfo = FlightData[FlightData['Origin'] == 'SFO'][['ArrDelay', 'Origin']].head(3)
first_three_sfo.to_csv('first3sfo.csv', index=False)
print(first_three_sfo, "\n")

#b) Top Three Destination with count
top_three_dest = FlightData.groupby('Dest')\
.count()\
.sort_values(by = 'Year', ascending=False)\
.head(3).reset_index()[['Dest', 'Year']]\
.rename(columns={'Year':'Count'})
print(top_three_dest)
