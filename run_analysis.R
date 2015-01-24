##Getting and cleaning Data - project
##run_analysis script does the following:
##Merge the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement;
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names. 
##creates a second, independent tidy data set with the average of each variable for each activity and each subject



# 1. install needed packages

require(reshape2)


# 2. download the zip file from the coursera website and unzip in the workdirectory

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "project dataset.zip"
unzippedFile <- "UCI HAR Dataset"

if(!file.exists(destFile)){
  download.file(fileUrl,destfile = destFile)
}

if(!file.exists(unzippedFile)){
  unzip(destfile) 
}


# 3. load the second column of the features.txt file as this column contains the actual features.

featuresVector <- read.table("./UCI HAR DataSet/features.txt")[,2]


# 4. load the activity labels. 

activityLabels <- read.table("./UCI HAR DataSet/activity_labels.txt")


# 5. loading test & training datasets (for each set the subject, meausurements and activities are loaded)

testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")

trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")


# 6. featuresVector contains the column names for testX and trainX

names(testX) = featuresVector
names(trainX) = featuresVector

# 7. link the activity names to the activity ids storen in testX and testY 
# I only kept the activity name and drop the activity id, but there is no obligation to do so 

testY[,2] <- activityLabels[testY[,1],2]
trainY[,2] <- activityLabels[trainY[,1],2]
testY <- testY[2]
trainY <- trainY[2]

# 8. merge everything together to create one dataset

testSet <- cbind(testSubject,testY,testX)
trainSet <- cbind(trainSubject,trainY,trainX)
totalSet <- rbind(testSet,trainSet)

# 9. Label and give an appropiate name

names(totalSet)[1] <- "subject"
names(totalSet)[2] <- "activity"


totalSet$subject <- factor(totalSet$subject)
totalSet$activity <- factor(totalSet$activity)


# 10. Only keep the the columns containing mean or standard deviations. I decided to not keep the meanFreq() variables 
# Also keep the activity and subject.id

totalSet <- totalSet[grep(".*subject.*|.*activity.*|.*-mean[(][)].*|.*std[(][])].*",names(totalSet))]


# 11. clean up the variables names

names(totalSet) <- gsub("^t","time.",names(totalSet))
names(totalSet) <- gsub("^f","freq.",names(totalSet))
names(totalSet) <- gsub("-mean[(][])]",".mean",names(totalSet))
names(totalSet) <- gsub("-std[(][])]",".stdev",names(totalSet))
names(totalSet) <- gsub("-",".",names(totalSet))

# 12. write csv table to working directory (not mandatory)

write.csv(totalSet,"totalset.csv",row.names = FALSE)


# 13. create tidy data set with the average of each variable for each activity and subject.
# First melt the data frame, indicate which columns are the id columns (the first 2 columns, being subject and activity)
# and which columns are the measure variables (leaving blank means that all non-ids are considered measure variables).
# Recast the melted set into a dataframe taking the mean of each variable for each subject and activity


meltedSet <- melt(totalSet,id.vars = c(1,2))
tidySet <- dcast(meltedSet, subject + activity ~ variable,mean)

# 14. Save the final results as txt file. Store into the working directory

write.table(tidySet,file = "tidy_set.txt",row.names = FALSE)




