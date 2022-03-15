
# Jenna Mulvihill
# DS3002 Project 1

# Import packages
import pandas as pd
from sqlalchemy import create_engine

# Import csv file from url of information on Taylor Swift songs (Benchmark i1)
df = pd.read_csv('https://query.data.world/s/yiiodjdjxbhk2xtswypmbci6qmnszl',
                 encoding = 'unicode_escape')

# Ask the user about deleting columns (Benchmark i3) and print
# error if they don't give a valid column name
try:
    columnname = input("If you would like to delete a column, which column would you like to delete? ")
    del df[columnname]
    print(columnname+" was successfully deleted.")
except KeyError:
        print(columnname+" is not a valid column name.")


# Write the new file to a local disk depending on which type of file the
# user would like it to be converted to (Benchmarks i2 and i4)
# Throw an error if the user doesn't give a valid file type
filetype = input("What type of file would you like the new file to be? ")
if filetype=="csv":
    df.to_csv('taylorswift.csv', index=None, sep=',')
    print("Your csv has been created and saved to the local disk.")
elif filetype=="json":
    df.to_json('taylorswift.json')
    print("Your json file has been created and saved to the local disk.")
elif filetype=="sql":
    engine = create_engine('sqlite://', echo=False)
    df.to_sql('taylorswift',con=engine)
    print("Your SQL table has been created.")
else:
    print(filetype+" is not a valid file type.")


# Print summary of the data set (Benchmark i5)
# Print the number of rows in the resulting data 
print("The number of rows in the data is "+str(len(df))+".")
# Print the number of columns in the resulting data
print("The number of columns in the data is "+str(len(df.columns))+".")
    
    
## Sources
    
# https://www.w3resource.com/pandas/dataframe/dataframe-to_sql.php
    
# https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.to_sql.html
    
# https://stackoverflow.com/questions/2887878/importing-a-csv-file-into-a-
# sqlite3-database-table-using-python
    
# https://datatofish.com/csv-to-json-string-python/
    
# https://stackoverflow.com/questions/20297332/how-do-i-retrieve-the-number
# -of-columns-in-a-pandas-data-frame
    
# https://www.educative.io/edpresso/how-to-delete-a-column-in-pandas   
    
# https://stackoverflow.com/questions/22216076/unicodedecodeerror-utf8-codec
# -cant-decode-byte-0xa5-in-position-0-invalid-s   
    
# https://stackoverflow.com/questions/18039057/python-pandas-error-tokenizing-
# data
    
# https://data.world/promptcloud/taylor-swift-song-data-from-all-the-albums/
# workspace/file?filename=taylor_swift_lyrics.csv
    
# https://www.kaggle.com/questions-and-answers/131432
    
    
    
    
    
    
    
