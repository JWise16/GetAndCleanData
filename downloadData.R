
##make sure to have already unzipped the file
##"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#This function downloads the 4 main files from the provided zip

download <- function(){
X_train <- fread("UCI HAR Dataset/train/X_train.txt")
Y_train <- fread("UCI HAR Dataset/train/y_train.txt")
subject_train <- fread("UCI HAR Dataset/train/subject_train.txt")

X_test <- fread("UCI HAR Dataset/test/X_test.txt")
Y_test <- fread("UCI HAR Dataset/test/y_test.txt")
subject_test <- fread("UCI HAR Dataset/test/subject_test.txt")


body_acc_x_train <- fread("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- fread("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_gyro_x_train <- fread("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
total_acc_x_train.txt <- fread("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")

body_acc_x_test <- fread("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")

activity_labels <- fread("UCI HAR Dataset/activity_labels.txt")

list(X_train, X_test, Y_train, Y_test )
}
