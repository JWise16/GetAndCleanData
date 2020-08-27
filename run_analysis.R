## Functions called here will come from the 'functions.R' file. Detail on each
## functions documented in both 'functions.R' and 'README.md'
source("functions.R")

##column binds the different pieces of the data together into one data table

tidyData <- cbind(makeID(), 
                  makeActivity(), 
                  makeTAcc(),
                  makeTBodyAcc(),
                  makeAngVelocity(),
                  makeFeatures())