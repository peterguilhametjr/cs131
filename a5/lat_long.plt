set style fill transparent solid 0.2 noborder

set datafile separator ','

set terminal svg
set output 'lat_long.svg'

set title "Latitude and Longitude of Shops" 
set xlabel "latitude"
set ylabel "longitude"

set autoscale x
set autoscale y

plot 'lat_long.dat' using 1:2 with points lc rgb 'red' title "Coordinates", \
     'SJSU_cord.dat' using 1:2 with points lc rgb 'blue' title "Specific Point"
