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

1. Download from the following source: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
Unzip in the working directory

2. Load the variable names from features.text

3. Load the activity labels from activity_labels.txt

4. Load the training and test datasets

5. Assign the variables names from step 2 and assign them to the appropriate datasets

6. Link the activity labels to the appropriate data sets

7. Create one big dataset

8. Give an descriptive name to the labels

9. Filter the mean and standard deviations measurements from the big data set

10. Make the variables names more readible

11. Write the obtained data set to the working directory



