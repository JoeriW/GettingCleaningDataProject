##Getting and cleaning Data - project
##run_analysis script does the following:
##Merge the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement;
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names. 
##creates a second, independent tidy data set with the average of each variable for each activity and each subject


#set the initial working directory
setwd("~/R/GettingCleaningData/Project")


#download the zip file from the coursera website and unzip in the workdirectory
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "project dataset.zip"
download.file(fileUrl,destfile = destfile)
unzip(destfile)
  
#load the second column of the features.txt file as this column contains the actual features. The first column is a number we don't need.
featuresVector <- read.table("./UCI HAR DataSet/features.txt")[,2]

#load the activity labels
activityLabels <- read.table("./UCI HAR DataSet/activity_labels.txt")


#loading test & training datasets
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")

trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")

  
#the features vector contains the column names of the testX and trainX dataset. Link them together
names(testX) <- featuresVector
names(trainX)<- featuresVector

#merge the activitylabels with testY and trainY. 
#give a column name to the merged data
testY <- merge(testY,activityLabels)
trainY <- merge(trainY,activityLabels)
names(testY)<- c("Activity id","Activity")
names(trainY)<-c("Activity id","Activity")
