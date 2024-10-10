#!/bin/bash

# Extract 2nd class passengers who embarked at Southampton, replace gender labels, print filtered passengers and calculate average age
awk -F, '$3 == 2 && $13 == "S\r"' titanic.csv | sed 's/\<male\>/M/g; s/\<female\>/F/g'  |  tee >(awk -F, ' $7 != "" {total += $7; count++} END {printf "Average Age: %.2f\n", total/count }') 
