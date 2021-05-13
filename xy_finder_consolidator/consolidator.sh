#bin bash

# splitter
for file in *.points; do 
    echo "Processing $file..."
    # y values
    tail -n +14 $file | awk '{print $7}' | tr -d \",y,= >> y.txt
    # x values
    tail -n +14 $file | awk '{print $6}' | tr -d \",x,= >> x.txt
    
    echo "Consolidating data..."
    paste -d "," x.txt y.txt > extracted_points.csv

    echo "Complete. Check 'extracted_points.csv' for your data."
done

# cleanup 
rm ./x.txt
rm ./y.txt