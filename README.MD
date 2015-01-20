##Read me file for run_analysis.R script
# General overview
The R script does the following:

* Downloading and unzipping the raw data
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject

# Process flow

1. Download from the following source: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

2. Unzip in the working directory

3. Load the variables from features.text
    
    - only keep the second column as this one contais the actual variables

    - filter out  measurements of means and standard deviations

4. Give the variables a more descriptive name



