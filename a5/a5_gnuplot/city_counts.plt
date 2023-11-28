set boxwidth 0.5 absolute
set style fill solid 1.0 
set style histogram 

set datafile separator ','

set terminal svg size 800,500
set output 'city_counts.svg'

set title "The total amount of boba shops with a rating 4.5 or above in each city"
set xlabel "Cities"
set ylabel "# of Shops"

set yrange [0:15]  # Adjusted to accommodate the data range

set xtics rotate

plot 'city_counts.dat' using 2:xtic(1) with boxes lc rgb 'red' title "# of shops"
