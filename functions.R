if(!("matrixStats" %in% rownames(installed.packages()))){
install.packages("matrixStats")
}
library(matrixStats)
if(!("dplyr" %in% rownames(installed.packages()))){
  install.packages("dplyr")
}
library(dplyr)


## makeID() row binds the train and test subject ID's into one data frame
## with the column name set as 'Subject ID'
makeID <- function(){
  trainID <- read.table("UCI HAR Dataset/train/subject_train.txt")
  testID <- read.table("UCI HAR Dataset/test/subject_test.txt")
  id <- rbind(trainID, testID)
  colnames(id) <- c("SubjectID")
  id
}


## makeActivity row binds the train and test set for activities and then uses
## activity_labels as a key to turn the activities column from a vector of 
## numbers to a vector of activity descriptive strings
makeActivity <- function(){
  
  trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")
  testActivitty <- read.table("UCI HAR Dataset/test/y_test.txt")
  
  raw <- rbind(trainActivity, testActivitty)
  colnames(raw) <- c("Activity")
  
  key <- read.table("UCI HAR Dataset/activity_labels.txt",
                    col.names = c("index","activity"))
  activities <- key$activity[raw$Activity]
  
  activities <- as.data.frame(activities)
  colnames(activities) <- c('Activity') 
  activities
}


## makTAcc() row binds the train and test set for total_acc_x/y/z and then
## combines the row averages and row standard deviations for x, y, and z into
## a data frame that contains 6 columns (the average and standard deviation for
## the total acceleration in the x y and z direction)
makeTAcc <- function(){
  
  TAx <- rbind(read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"),
               read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"))
  TAy <- rbind(read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"),
               read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"))
  TAz <- rbind(read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"),
               read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"))
  
  TAcc <- data.frame(AvgTAccX = rowMeans(TAx[,-1]),
                     AvgTAccY = rowMeans(TAy[,-1]),
                     AvgTAccZ = rowMeans(TAz[,-1]),
                     SdTAccX = rowSds(as.matrix(TAx[,c(-1)])),
                     SdTAccY = rowSds(as.matrix(TAy[,c(-1)])),
                     SdTAccZ = rowSds(as.matrix(TAz[,c(-1)])))
  TAcc
}


## makeAvgTBodyAcc() row binds the train and test set for body_acc_x/y/z and then
## combines the row averages and row standard deviations for x, y, and z into
## a data frame that contains 6 columns (the average and standard deviation for
## the total body acceleration in the x y and z direction)
makeTBodyAcc <- function(){
  
  BAx <- rbind(read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"),
               read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"))
  BAy <- rbind(read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"),
               read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"))
  BAz <- rbind(read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt"),
               read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"))
  
  BAcc <- data.frame(AvgTBodyAccX = rowMeans(BAx[,-1]),
                     AvgTBodyAccY = rowMeans(BAy[,-1]),
                     AvgTBodyAccZ = rowMeans(BAz[,-1]),
                     SdTBodyAccX = rowSds(as.matrix(BAx[,c(-1)])),
                     SdTBodyAccY = rowSds(as.matrix(BAy[,c(-1)])),
                     SdTBodyAccZ = rowSds(as.matrix(BAz[,c(-1)])))
  BAcc
}


## makeAngVelocity() row binds the train and test set for body_gyro_x/y/z and then
## combines the row averages and row standard deviations for x, y, and z into
## a data frame that contains 6 columns (the average and standard deviation for
## the angular velocity in the x y and z direction)
makeAngVelocity <- function(){
  
  AVx <- rbind(read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"),
               read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"))
  AVy <- rbind(read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"),
               read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"))
  AVz <- rbind(read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"),
               read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"))
  
  AV <- data.frame(AvgAngVelX = rowMeans(AVx[,-1]),
                     AvgAngVelY = rowMeans(AVy[,-1]),
                     AvgAngVelZ = rowMeans(AVz[,-1]),
                     SdAngVelX = rowSds(as.matrix(AVx[,c(-1)])),
                     SdAngVelY = rowSds(as.matrix(AVy[,c(-1)])),
                     SdAngVelZ = rowSds(as.matrix(AVz[,c(-1)])))
  AV
}

## makeFeatures() creates a vector that contains all the 'features' found in 
## 'features.txt' (more info can be found in 'features_info.txt) and then it
## uses the features vector to name the columns of the row bound X train and
## test data
makeFeatures <- function(){
  features <- read.table("UCI HAR Dataset/features.txt")$V2
  data <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"),
                read.table("UCI HAR Dataset/test/X_test.txt"))
  colnames(data) <- features
  data
}

