CodeBook for the tidy dataset
=============================

Data source
-----------
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Description of the original dataset 
-----------------------------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


Merged data files
-----------------
Merged the training and the test sets to create one data set.
First concatanated the data tables by rows, then merged the columns to get the dataset.

Extracted data
--------------
I extracted only the measurements on the mean and standard deviation for each measurement.

mean(): Mean value
std(): Standard deviation

Descriptive activity names
--------------------------
Descriptive activity names are used to name the activities in the data set as given in the activity_labels.txt in the original dataset.

Descriptive variable names
--------------------------
I labeled the data set with descriptive variable names as follows:

Original | Modified
-------- | --------
tBodyAcc-XYZ | timeBodyAccelerometer-XYZ
tGravityAcc-XYZ | timeGravityAccelerometer-XYZ
tBodyAccJerk-XYZ | timeBodyAccelerometerJerk-XYZ
tBodyGyro-XYZ | timeBodyGyroscope-XYZ
tBodyGyroJerk-XYZ | timeBodyGyroscopeJerk-XYZ
tBodyAccMag | timeBodyAccelerometerMagnitude-XYZ
tGravityAccMag | timeGravityAccelerometerMagnitude-XYZ
tBodyAccJerkMag | timeBodyAccelerometerJerkMagnitude-XYZ
tBodyGyroMag | timeBodyGyroscopeMagnitude-XYZ
tBodyGyroJerkMag | timeBodyGyroscopeJerkMagnitude-XYZ
fBodyAcc-XYZ | frequencyBodyAccelerometer-XYZ
fBodyAccJerk-XYZ | frequencyBodyAccelerometerJerk-XYZ
fBodyGyro-XYZ | frequencyBodyGyroscope-XYZ
fBodyAccMag | frequencyBodyAccelerometerMagnitude-XYZ
fBodyAccJerkMag | frequencyBodyAccelerometerJerkMagnitude-XYZ
fBodyGyroMag | frequencyBodyGyroscopeMagnitude-XYZ
fBodyGyroJerkMag | frequencyBodyGyroscopeJerkMagnitude-XYZ

Tidy Data
---------
The tidydata.txt file contains data set with the average of each variable for each activity and each subject.
(This file will be created when run_analysis.R file is executed.)
