# Week4Project


DATA OVERVIEW
=============

Read README file in UCI HAR Dataset directory to read an overview of the data.
The features_info.txt file contains a write up of the variables (features) in the UCI HAR Dataset


DATA MANIPULATION TO GET TIDY DATA SET
======================================

Instructions
============
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Based on instructions only the following files of the downloaded dataset are used:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Subjects in Training group.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Subjects in Test group.

The data sets in the Inertial Signals directories are not used.

Use script: run_analysis.R to accomplish these steps.

run_analysis.R (written in R Studio Version 0.99.902 – © 2009-2016 RStudio, Inc.)

Annotated run_analysis.R Script:

## Download files

if(!file.exists("./project")){dir.create("./project")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./project/Datasetwk4.zip")

## UnCompress downloaded Datasetwk4.zip to a directory called project
unzip(zipfile = "./project/Datasetwk4.zip", exdir="./project")

## Create a variable for the path to files to be used
data_Files <- file.path("./project","UCI HAR Dataset")

## Create dataFrames for each data file to be used
ActivityDataTest <- read.table(file.path(data_Files,"test","y_test.txt"), header=FALSE)
ActivityDataTrain <- read.table(file.path(data_Files, "train", "y_train.txt"), header=FALSE)
SubjectDataTest <- read.table(file.path(data_Files,"test","subject_test.txt"), header=FALSE)
SubjectDataTrain <- read.table(file.path(data_Files,"train","subject_train.txt"), header=FALSE)
FeaturesDataTrain <- read.table(file.path(data_Files,"train","X_train.txt"), header=FALSE)
FeaturesDataTest <- read.table(file.path(data_Files,"test","X_test.txt"), header=FALSE)
LabelsActivity <-read.table(file.path(data_Files, "activity_labels.txt"), header = FALSE)
FeaturesNamesData <- read.table(file.path(data_Files,"features.txt"),header = FALSE)

## Before combining Test and Train data sets, add a column to each dataset to indicate if it is the Test or Train dataset 
## Add columns to Test and Train data to designate whether record is part of Test group or Train group
FeaturesDataTest$V562 <- "TEST"
FeaturesDataTrain$V562 <- "TRAIN"

##Add Feature Name "group" to Feature Names dataframe to accommodate new "group" column in Features dataset
newFeatureName <- data.frame(V1=562, V2="group")
FeaturesNamesData <- rbind(FeaturesNamesData,newFeatureName)

## Merge Training and Test Dataframes Per Category by Row
SubjectData <- rbind(SubjectDataTest, SubjectDataTrain)
ActivityData <- rbind(ActivityDataTest, ActivityDataTrain)
FeaturesData <- rbind(FeaturesDataTest, FeaturesDataTrain)


##Set names of columns
names(SubjectData) <- c("subject")
names(ActivityData) <- c("activity")
names(FeaturesData) <-FeaturesNamesData$V2

## Combine columns to create DataOne dataframe
DataTestTrain <- cbind(SubjectData,ActivityData)
DataOne <- cbind(FeaturesData,DataTestTrain)

## Extract mean(), std() and group labeled columns from the combined Feature Labels dataset
FeaturesNamesSubset <- FeaturesNamesData$V2[grep("mean\\(\\)|std\\(\\)|group", FeaturesNamesData$V2)]
SelectedCategories <- c(as.character(FeaturesNamesSubset),"subject", "activity")

## Extract selected columns of DataOne
DataOne <- subset(DataOne,select=SelectedCategories)

## Replace numeric values in activity column to descriptive activity names
DataOne$activity[DataOne$activity==1] <- "WALKING"
DataOne$activity[DataOne$activity==2] <- "WALKING_UPSTAIRS"
DataOne$activity[DataOne$activity==3] <- "WALKING_DOWNSTAIRS"
DataOne$activity[DataOne$activity==4] <- "SITTING"
DataOne$activity[DataOne$activity==5] <- "STANDING"
DataOne$activity[DataOne$activity==6] <- "LAYING"

## Replace DataOne column names with more descriptive column names for measurement data - make all lower case
names(DataOne) <- gsub("^t", "time", names(DataOne))
names(DataOne) <- gsub("^f", "frequency", names(DataOne))
names(DataOne) <- gsub("BodyAcc", "bodyacceleration", names(DataOne))
names(DataOne) <- gsub("GravityAcc", "gravityacceleration", names(DataOne))
names(DataOne) <- gsub("Mag", "magnitude", names(DataOne))
names(DataOne) <- gsub("BodyGyro", "bodygyroscope", names(DataOne))
names(DataOne) <- gsub("Jerk", "jerk", names(DataOne))
names(DataOne) <- gsub("Bodybody", "body", names(DataOne))

## Check if have dplyr package installed
library(dplyr)

## Get mean of DataOne columns excluding group, subject, activity
TidyData4 <- aggregate(. ~group + subject + activity, DataOne, mean)

# Sort dataframe
TidyData4 <- TidyData4[order(TidyData4$group,TidyData4$subject,TidyData4$activity),]

## Create Tidy Data Set
write.table(TidyData4,file="tidydata.txt",row.names = FALSE)
