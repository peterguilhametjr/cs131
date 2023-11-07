The issue I decided to tackle was the issue of the inconsistent YEAR column. For starters, the file is called movies.csv not necesarily movies&shows.csv. Movies only have one release year while shows can run over multiple years. This led to inconsistent data since some rows had multiple years while other rows had a single year. I decided to rename the column as RELEASE YEAR and remove anything past the original year in that column. To do this, I broke the script in 2 main steps. 

First:
sed -i 's/YEAR/RELEASE YEAR/' "$inputfile"

What I did with the above sed command was replace the column title of YEAR to RELEASE YEAR to fit the new data column of data I had in mind. I did this by utilizing the -i option of sed which allows us to directly alter the inputfile. Next, using sed substitution, I replaced YEAR with RELEASE YEAR. I did not do this globally in case the word YEAR appeared anywhere else in the file, and instead focused on only doing this for the first occurrence. 

Second:
sed -E 's/\(([0-9]{4})[^)]*\)/(\1)/g' "$inputfile" > "$outputfile"

The above command is the core of how I altered the dataset. By using -E, this allowed me to use regular expressions with sed. Next, my goal was to substitute any numbers enclosed between parenthesis with only the first set of 4 numbers. I did this by enclosing [0-9]{4} with parenthesis which would act as the first substitution, and anything else that comes after that would be considered the second substitution. Following this, I used [^)]* to showcase that anything after the original year would be accepted until you hit a closing parenthesis; this takes care of instances where there is a dash after the first year followed by a second year. Lastly, I only hold onto the first set of numbers using \1 so the second set of data is deleted as the original range of years is replaced by the first year that occurrs. The altered inputfile copy is then saved using standard output into my outputfile.
