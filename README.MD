#Read me file for run_analysis.R script
## Objective
The R script does the following:

* Downloading and unzipping the raw data
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Required packages

- reshape2



## Result

The result of run_analysis.R is the tidyset.txt file (space delimited file with header)

To read the file in R:

- read.table("tidyset.txt",header=TRUE)

Script tested with R version 3.1.2

## Process flow

1. Verify if reshape2 package is installed

2. Download from the following source: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
Unzip in the working directory

3. Load the variable names from features.text

4. Load the activity labels from activity_labels.txt

5. Load the training and test datasets

6. Assign the variables names from step 3 and assign them to the appropriate datasets (testX and trainX)

7. Link the activity labels to the appropriate data sets (trainY and testY). Drop the activity id and only keep the name

8. Create one big dataset

9. Give a descriptive name to the labels

10. Filter the mean and standard deviations measurements from the big data set

11. Make the variables names more readible

12. Write the obtained data set to the working directory

13. Create a second tidy set containing the average of each variable for each activity and subject
    - First melt the data frame: indicate which columns are ids (subject and activity), all other columns are considered measurement variables.
    - Recast the melted data set into a dataframe containing the average of each measurement variable for each subject and activity

14. Save the tidy dataset into a txt file (file: summaryset.txt)





