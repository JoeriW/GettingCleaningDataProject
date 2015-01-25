# Codebook for tidy_set.txt


## Source

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain


## Variables
### Labels:

subject

- _description_: identifier of the subject
- _data_  _type_: string
- _values_: 1-30, identifier for the volunteers participating to the expermiments (cfr. Data Set Information)

activity

- _description_: identifies the activities during which the measurements were registered
- _data_  _type_: int
- _values_: WALKING, WALKING_UPSTAIRS,  WALKING__DOWNSTAIRS SITTING, STANDING, LAYING

### measurement  variables:

- _description_: describes the feature that was measured

- _variable build-up_:

    - time/freq: indicates whether time or frequency domain signals were captured

    - body/gravity: indicates whether body or gravity sensor acceleration signals were captured

    - accelerometer/gyroscopre: indicates the sensor signals

    - jerk/magnitude: body linear acceleration and angular velocity were derived in time to obtain jerk signals. Magnitude of these 3-dimensional signals were calculated using the Euclides norm.

    - mean/stdev: indicates whether the average value or standard deviation was measured

    - X/Y/Z:  used to denote the direction of the 3-axial signals.

- _values_: measurements  are normalized and bounded within [-1,1]

- _variables_:
    
  
time.body.accelerometer.mean.X

time.body.accelerometer.mean.Y

time.body.accelerometer.mean.Z

time.body.accelerometer.stdev.X

time.body.accelerometer.stdev.Y

time.body.accelerometer.stdev.Z

time.gravity.accelerometer.mean.X

time.gravity.accelerometer.mean.Y

time.gravity.accelerometer.mean.Z

time.gravity.accelerometer.stdev.X

time.gravity.accelerometer.stdev.Y

time.gravity.accelerometer.stdev.Z

time.body.accelerometer.jerk.mean.X

time.body.accelerometer.jerk.mean.Y

time.body.accelerometer.jerk.mean.Z

time.body.accelerometer.jerk.stdev.X

time.body.accelerometer.jerk.stdev.Y

time.body.accelerometer.jerk.stdev.Z

time.body.gyroscope.mean.X

time.body.gyroscope.mean.Y

time.body.gyroscope.mean.Z

time.body.gyroscope.stdev.X

time.body.gyroscope.stdev.Y

time.body.gyroscope.stdev.Z

time.body.gyroscope.jerk.mean.X

time.body.gyroscope.jerk.mean.Y

time.body.gyroscope.jerk.mean.Z

time.body.gyroscope.jerk.stdev.X

time.body.gyroscope.jerk.stdev.Y

time.body.gyroscope.jerk.stdev.Z

time.body.accelerometer.magnitude.mean

time.body.accelerometer.magnitude.stdev

time.gravity.accelerometer.magnitude.mean

time.gravity.accelerometer.magnitude.stdev

time.body.accelerometer.jerk.magnitude.mean

time.body.accelerometer.jerk.magnitude.stdev

time.body.gyroscope.magnitude.mean

time.body.gyroscope.magnitude.stdev

time.body.gyroscope.jerk.magnitude.mean

time.body.gyroscope.jerk.magnitude.stdev

freq.body.accelerometer.mean.X

freq.body.accelerometer.mean.Y

freq.body.accelerometer.mean.Z

freq.body.accelerometer.stdev.X

freq.body.accelerometer.stdev.Y

freq.body.accelerometer.stdev.Z

freq.body.accelerometer.jerk.mean.X

freq.body.accelerometer.jerk.mean.Y

freq.body.accelerometer.jerk.mean.Z

freq.body.accelerometer.jerk.stdev.X

freq.body.accelerometer.jerk.stdev.Y

freq.body.accelerometer.jerk.stdev.Z

freq.body.gyroscope.mean.X

freq.body.gyroscope.mean.Y

freq.body.gyroscope.mean.Z

freq.body.gyroscope.stdev.X

freq.body.gyroscope.stdev.Y

freq.body.gyroscope.stdev.Z

freq.body.accelerometer.magnitude.mean

freq.body.accelerometer.magnitude.stdev

freq.body.accelerometer.jerk.magnitude.mean

freq.body.accelerometer.jerk.magnitude.stdev

freq.body.gyroscope.magnitude.mean

freq.body.gyroscope.magnitude.stdev

freq.body.gyroscope.jerk.magnitude.mean

freq.body.gyroscope.jerk.magnitude.stdev

## Data Manipulations:

Describing the most significant data manipulations in the run_analysis.R script

- features
    - the second column of features.txt contains the measurements. The first column is dropped
    - only the mean and standard deviation measurments should be kept. (You can discuss about whether or not to keep the meanFreq variables, I didn't...but this choice is debatable)
    - features contains the column names of X_test and X_train. 

- activity_labels:
    - id is used to link the activity label to the activity the volunteers were performing at time of measurement (y_test and y_train file)
    - once linked: id is dropped,only the description is kept

- variable clean up:
    - t. replaced by time.
    - f. replaced by freq.
    - -mean() replaced by mean
    - -std() replaced by stdev
    - Acc replaced by acceloremeter
    - Gyro replaced by gyroscope
    - Mag replaced by magnitude
    - Jerk replaced by jerk
    - BodyBody replaced by body
    - Body replaced by body
    - Gravity replaced by gravity

- tidyset:
   - create tidy data set with the average of each variable for each activity and subject
   - First melt the data frame, indicate which columns are the id columns (the first 2 columns, being subject and activity)
and which columns are the measure variables (leaving blank means that all non-ids are considered measure variables).
Recast the melted set into a dataframe taking the mean of each variable for each subject and activity




