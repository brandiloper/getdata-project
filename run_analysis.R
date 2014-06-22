## clean workspace
rm(list=ls())

## set working directory to location of the UCI HAR Dataset 
setwd("~/UCI HAR Dataset")

## 1. Merge the training and the test sets to create one data set.

## read in the data files
## read in features and activity txt files 
features = read.table('./features.txt',header=FALSE)
activity = read.table('./activity_labels.txt',header=FALSE)

## read in train data files 
subject.train = read.table('./train/subject_train.txt',header=FALSE) 
x.train  = read.table('./train/x_train.txt',header=FALSE) 
y.train  = read.table('./train/y_train.txt',header=FALSE)

## read in test data files
subject.test = read.table('./test/subject_test.txt',header=FALSE)
x.test = read.table('./test/X_test.txt', header=FALSE)
y.test = read.table('./test/y_test.txt',header=FALSE)

## assign column names to data files
colnames(activity) <- c('activityID','activityType')
colnames(subject.train) <- "subjectID"
colnames(x.train) <- features[,2] 
colnames(y.train) <- "activityID"
colnames(subject.test) <- "subjectID"
colnames(x.test) <- features[,2]
colnames (y.test) <- "activityID"

## create one data set for train data files
trainData <- cbind(subject.train,y.train,x.train)

## create one data set for test files
testData <- cbind(subject.test,y.test,x.test)

## combine trainData and testData in one dataset
## raw data
data <- rbind(trainData,testData)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

##create a vector 'x' to use to obtain the deisred measurements, mean and std
x <- names(data)

## create a logical vector called 'tmp' to extract on the desired columns 
tmp <- (grepl("activity..",x) | grepl("subject..",x) | grepl("-mean..",x) & !grepl("-meanFreq..",x)| grepl("-std..",x))
      

## create a subset of the data set based on the logical vector called 'tmp' to get the necessary colums
data <- data[tmp==TRUE]


## 3. Uses descriptive activity names to name the activities in the data set

## merge raw data set called 'data' with activity table to obtain activity names
data <- merge(data,activity,by='activityID',all.x=TRUE)

## 4. Appropriately labels the data set with descriptive variables names

## Cleaning up the variable names
names <- names(data)
names <- gsub('-mean', 'Mean', names) 
names <- gsub('-std', 'Std', names) 
names <- gsub('[()-]', '', names) 
names <- gsub('BodyBody', 'Body', names) 


## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

tmp1 <- data[, names(data) != 'activityType'] ## removed activityType before taking the mean

tidy.data <- aggregate(. ~ subjectID + activityID, data=tmp1, FUN = mean)

## add activity names back to tidy data set
tidy.data <- merge(tidy.data, activity, by="activityID", all.x=TRUE)

## export tidy data set 
write.table(tidy.data, './tidy.data.txt', quote=FALSE,row.names=FALSE, sep='\t')
