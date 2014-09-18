---
title: "CodeBook.md"
author: "Albert Chen"
date: "September 18, 2014"
output: html_document
---
#CodeBook
Note: this CodeBook was modified from features_info.txt from the UCI HAR Dataset found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

More information can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##Information about raw data set:
Information about processing can be found in the next section.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation

Note: more variables were estimated in original data set. See features_info.txt (see above).


##Information about processing:
###Steps:
Every row is an entry for one subject performing one activity. The data presented are means and standard deviations for each type of measurement, averaged across all time points collected.

1. Only mean() and std() variables were selected from test/X\_test.txt and train/X\_train.txt, using the grep function.
2. Subjects for each measurement from step 1 were obtained from test/subject\_test.txt and train/subject\_train.txt
3. Activities for each measurement from step 1 were obtained from test/y\_test.txt and train/y\_train.txt
4. Variables and activities were converted from numeric coding to descriptive names using the keys found in features.txt and activity_labels.txt respectively. See previous section for description of variables.
5. Activities were transformed into factors (levels = Walking, Walking_Upstairs, Walking_Downstairs,Sitting,Standing,Laying)
6. Subjects were transformed into factors (levels = 1:30)
7. All data was sorted based on subject and activity. 
8. Mean for mean() and std() variables were calculated for each subject performing each activity using the tapply function.