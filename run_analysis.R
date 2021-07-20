## Set directory for the project.  Unzip the file to it's default directories.

setwd("~/Desktop/Data Science Courses")

##  Make sure that these libraries are loaded.

library(data.table)
library(dplyr)

##  Read in all the .txt files.

FeatureNames <- read.table("UCI HAR Dataset/features.txt")
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
XTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
YTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
YTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

##  Combine files.

Subject <- rbind(SubjectTrain, SubjectTest)
XData <- rbind(XTrain, XTest)
YData <- rbind(YTrain, YTest)

## Name the columns.

colnames(features) <- t(FeatureNames[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
CombinedData <- cbind(features,activity,subject)
ColumnsMeanSTD <- grep(".*Mean.*|.*Std.*", names(CombinedData), ignore.case=TRUE)
FinishedColumns <- c(ColumnsMeanSTD, 562, 563)
dim(CombinedData)
ExtractedData <- CombinedData[,FinishedColumns]
dim(ExtractedData)

## Characterize extracted data.

ExtractedData$Activity <- as.character(ExtractedData$Activity)
for (i in 1:6){
        ExtractedData$Activity[ExtractedData$Activity == i] <- as.character(ActivityLabels[i,2])
}

## Check the current column labels.

names(ExtractedData)

## Appropriately labels the data set with descriptive variable names.

names(ExtractedData)<-gsub("Acc", "Accelerometer", names(ExtractedData))
names(ExtractedData)<-gsub("Gyro", "Gyroscope", names(ExtractedData))
names(ExtractedData)<-gsub("BodyBody", "Body", names(ExtractedData))
names(ExtractedData)<-gsub("Mag", "Magnitude", names(ExtractedData))
names(ExtractedData)<-gsub("^t", "Time", names(ExtractedData))
names(ExtractedData)<-gsub("^f", "Frequency", names(ExtractedData))
names(ExtractedData)<-gsub("tBody", "TimeBody", names(ExtractedData))
names(ExtractedData)<-gsub("-mean()", "Mean", names(ExtractedData))
names(ExtractedData)<-gsub("-std()", "STD", names(ExtractedData))
names(ExtractedData)<-gsub("-freq()", "Frequency", names(ExtractedData))
names(ExtractedData)<-gsub("angle", "Angle", names(ExtractedData))
names(ExtractedData)<-gsub("gravity", "Gravity", names(ExtractedData))

## Put extracted data into a table.

ExtractedData$Subject <- as.factor(ExtractedData$Subject)
ExtractedData <- data.table(ExtractedData)

## Clean data.

CleanData <- aggregate(. ~Subject + Activity, ExtractedData, mean)
CleanData <- CleanData[order(CleanData$Subject,CleanData$Activity),]
write.table(CleanData, file = "Clean.txt", row.names = FALSE)

