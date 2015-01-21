##Getting and cleaning Data - project
##run_analysis script does the following:
##Merge the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement;
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names. 
##creates a second, independent tidy data set with the average of each variable for each activity and each subject


#set the initial working directory

setwd("~/R/GettingCleaningData/Project")


# 1. download the zip file from the coursera website and unzip in the workdirectory

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "project dataset.zip"
unzippedFile <- "UCI HAR Dataset"

if(!file.exists(destFile)){
  download.file(fileUrl,destfile = destFile)
}

if(!file.exists(unzippedFile)){
  unzip(destfile) 
}


# 2. load the second column of the features.txt file as this column contains the actual features.

featuresVector <- read.table("./UCI HAR DataSet/features.txt")[,2]


# 3. load the activity labels. 

activityLabels <- read.table("./UCI HAR DataSet/activity_labels.txt")


# 4. loading test & training datasets (for each set the subject, meausurements and activities are loaded)

testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")

trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")


# 5. featuresVector contains the column names for testX and trainX

names(testX) = featuresVector
names(trainX) = featuresVector

# 6. merge the activitylabels with testY and trainY . 
# I only keep the activity name and drop the activity id, but there is no obligation to do so 

testY <- merge(testY,activityLabels)[2]
trainY <- merge(trainY,activityLabels)[2]


# 7. merge everything together to create one dataset

testSet <- cbind(testSubject,testY,testX)
trainSet <- cbind(trainSubject,trainY,trainX)
totalSet <- rbind(testSet,trainSet)

# 8. Label and give an appropiate name

names(totalSet)[1] <- "subject.id"
names(totalSet)[2] <- "activity"


totalSet$subject.id <- factor(totalSet$subject.id)
totalSet$activity <- factor(totalSet$activity)


# 9. Only keep the the columns containing mean or standard deviations. don't include the first 2 columns in the grep function! They include
# the subject and activity info. I decided to not keep the meanFreq() variables, but you could decide otherwise, 
# I think you can make a case for both choices

totalSet <- totalSet[grep(".*-mean[(][)].*|.*std[(][])].*",names(totalSet)[3:563])]

# 10. clean up the variables names

totalSet <- gsub("^t","time.",totalSet)
totalSet <- gsub("^f","freq.",totalSet)
totalSet <- gsub("-mean[(][])]",".mean",totalSet)
totalSet <- gsub("-std[(][])]",".stdev",totalSet)
totalSet <- gsub("-",".",totalSet)








