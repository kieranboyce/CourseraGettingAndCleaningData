---
title: "CodeBook.md"
output: html_document
---

The datafile `mean_values.txt` is a summary of data available from the Human Activity Recognition
Using Smartphones Dataset, a copy of which was downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The output datafile consists of 88 variables:

* ActivityName. One of six possible values:  
    + WALKING
    + WALKING_UPSTAIRS
    + WALKING_DOWNSTAIRS
    + SITTING
    + STANDING
    + LAYING
* Subject. Values of 1 to 30 representing each of the 30 volunteers from whom data was captured
* The remaining 86 variables are the mean values of each of the variables in the original dataset for each activity and each subject.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*  tBodyAcc-XYZ
*  tGravityAcc-XYZ
*  tBodyAccJerk-XYZ
*  tBodyGyro-XYZ
*  tBodyGyroJerk-XYZ
*  tBodyAccMag
*  tGravityAccMag
*  tBodyAccJerkMag
*  tBodyGyroMag
*  tBodyGyroJerkMag
*  fBodyAcc-XYZ
*  fBodyAccJerk-XYZ
*  fBodyGyro-XYZ
*  fBodyAccMag
*  fBodyAccJerkMag
*  fBodyGyroMag
*  fBodyGyroJerkMag

The mean and standard deviations were estimated for each of these signals.


The following steps were performed on the original dataset:

*  the training and test datasets were combined
*  only variables with "mean" and "std" in their names were included
*  the following abbreviations in the variable names were expanded:
    + Acc -> Accelerometer
    + Gyro -> Gyroscope
    + Mag -> Magnitude
    + Freq -> Frequency
    + t (at the start of a name) -> time
    + f (at the start of a name) -> fft
*  the Subject identifier and Activity Name were added 
*  finally, the mean was calculated for the measurement variables across Activity Name and Subject
   and the resulting table was written out as a text file named `mean_values.txt`

