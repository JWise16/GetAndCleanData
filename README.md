# GetAndCleanData
This program gets and cleans "UCI HAR Dataset" into a tidy table, more information on the data and the experiment can be found in the readme inside of the dataset file. 

run_analysis.R - runs all the functions in "functions.R" and saves the data into a data table called tidyData and returns tidyData to the user

functions.R - contains all of the functions that are used in the process of cleaning the data
            -Function List-
              makeID()
              makeAvtivity()
              makeTAcc()
              makeTBodyAcc()
              makeAngVelocity()
              makeFeatures()