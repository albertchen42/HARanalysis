### This script obtains and cleans the data from the HARUS Dataset
### http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
### It presents a tidy data set of means and standard deviations of all measurements,
### and presents a second tidy data set of means of each variable for each activity and each subject

## obtain and unzip data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="HAR.zip",method="curl")
unzip("HAR.zip")

## define relevant variables - mean, standard deviations, and activities
features <- read.table("./HAR/UCI HAR Dataset/features.txt")
var <- rep(0,561)
var[grep("mean()",features[,2],fixed=T)] <- 1
var[grep("std()",features[,2],fixed=T)] <- 1
var_index <- var*features[,1]
var_names <- as.vector(features[var_index,2])
activity_labels <- read.table("./HAR/UCI HAR Dataset/activity_labels.txt")


## read, merge, and label test and training data for mean and standard deviation measurements
colClasses <- rep("NULL",561)
colClasses[var_index] <- "numeric"
test <- read.table("./HAR/UCI HAR Dataset/test/X_test.txt",colClasses=colClasses)
subject_test <- read.table("./HAR/UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./HAR/UCI HAR Dataset/test/y_test.txt")[[1]]
y_test_convert <- activity_labels[y_test,2]
test <- cbind(subject_test,activity = y_test_convert,test)
train <- read.table("./HAR/UCI HAR Dataset/train/X_train.txt",colClasses=colClasses)
subject_train <- read.table("./HAR/UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./HAR/UCI HAR Dataset/train/y_train.txt")[[1]]
y_train_convert <- activity_labels[y_train,2]
train <- cbind(subject_train,activity = y_train_convert,train)
data <- rbind(test,train)
colnames(data)<-c("subject","activity",var_names)

## sort data based on subject and activity
## this is the first tidy data set
data$subject <- factor(data$subject)
data$activity <- factor(data$activity,levels = activity_labels[2][[1]])
data <- data[order(data$subject,data$activity),]

## calculate average of each type of measurement for each subject for each activity
key <- paste(data$subject,data$activity)
temp <- cbind(data,key=key)
data2 <- unique(temp[,c("key","subject","activity")])
for(i in 3:(length(temp)-1)){
  temp2 <- tapply(temp[[i]],temp$key,mean)
  temp2 <- cbind(key = row.names(temp2),temp2)
  data2 <- merge(data2,temp2,by = "key")
}

## sort data based on subject and activity and re-label
##this is the second tidy data set
data2 <- data2[order(data2$subject,data2$activity),]
data2 <- data2[,2:length(data2)]
colnames(data2)<-c("subject","activity",var_names)

##write the second tidy data set to a text file
write.table(data2,"tidydata2.txt",row.names=FALSE,sep="\t")
