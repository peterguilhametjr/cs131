#!/bin/bash

#storing sjsu's latitude and longitude
sjsu_lat=37.3352
sjsu_long=-121.8811

#removing the yelp name from the table(not nececesary)
awk 'BEGIN {FS=","; OFS=","} {$2=""; gsub(",,", ","); print}' bayarea_boba_spots.csv > temp1.csv

column_names=$(head -n 1 temp1.csv)
tail -n +2 temp1.csv > temp2.csv

#filter out boba shops that do not have a rating of 4.5 or above
awk -F',' '$3 >= 4.5' temp2.csv > temp3.csv

echo "$column_names,distance" > sorted_boba_spots.csv

#create a new column called distance by calculating sjsu's latitude and longitude with the lat and long of the boba shops
awk -v sjsu_lat="$sjsu_lat" -v sjsu_long="$sjsu_long" 'BEGIN {
	FS=","; 
	OFS=",";
}
{
	distance = sqrt((sjsu_lat - $6)^2 + (sjsu_long - $7)^2);
	if (distance < 100) {
		print $0, distance;
	}
}' temp3.csv > temp4.csv


#sort the file by shortest to longest distance
sort -t',' -k8g temp4.csv >> sorted_boba_spots.csv

#remove temp datasets
rm temp1.csv
rm temp2.csv
rm temp3.csv
rm temp4.csv
echo "boba file has been successfully altered"
