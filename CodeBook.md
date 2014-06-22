This is a codebook that describes the variables,the data or any transformations used to clean up the data. 

## Script
** Set the working directory to which you unzip the files.

1. After setting the directory for the files, read in the data files located in:

- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

 Assign column names and merge to create one data set, called 'data'.


2. Create a logical vector using the 'grepl' function to use to obtain the deisred measurements, mean and std.
Subset this data to keep only the necessary columns.


3. Merge data with activity table to obtain descriptive activity names

4. Use the 'gsub' function for pattern replacement to clean up the data labels.

5. Create a tidy data set with the average of each variable for each activity and each subject.

## Data 
### Raw Data 
The raw data contains 69 variables:

- subjectID: identifier for the subject who performed
- activityID: identifier for the activity performed
- activityType: names the activity


this data set also includes 66 filtered features described below:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

these set of variables were estimated on: 

- mean(): mean value 
- std(): standard deviation

### Tidy Data 
The tidy data set contains the same variables as the raw data set:

The following replacements were performed to clean up the data:

- Replace -mean with Mean
- Replace -std with Std
- Remove characters -()
- Replace BodyBody with Body

