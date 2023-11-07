#!/bin/bash

#the inputfile saved as a variable
inputfile="movies.csv"

#the outputfile saved as a variable
outputfile="movies2.csv"

#this sed command replaces the title of the column YEAR to RELEASE YEAR in the original input file
sed -i 's/YEAR/RELEASE YEAR/' "$inputfile"

#this sed command stores ([0-9]{4}) into \1 and ignores anything after that until you hit the closing parenthesis. Then wrap what was stored in \1 with parentheses
sed -E 's/\(([0-9]{4})[^)]*\)/(\1)/g' "$inputfile" > "$outputfile"

#print out a message that confrims the script ran
echo "Fixed movies file to movies2 file"
