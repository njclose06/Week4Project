## Download files

if(!file.exists("./project")){dir.create("./project")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./project/Datasetwk4.zip")

## UnCompress files
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

##Add columns to Test and Train data to designate whether record is part of Test group or Train group
FeaturesDataTest$V562 <- "TEST"
FeaturesDataTrain$V562 <- "TRAIN"

##Add Feature Name "group" to Feature Names dataframe
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

## Combine columns to Create One Data Set
DataTestTrain <- cbind(SubjectData,ActivityData)
DataOne <- cbind(FeaturesData,DataTestTrain)

##Extract mean(), std() and group labeled columns from the combined data set
FeaturesNamesSubset <- FeaturesNamesData$V2[grep("mean\\(\\)|std\\(\\)|group", FeaturesNamesData$V2)]
SelectedCategories <- c(as.character(FeaturesNamesSubset),"subject", "activity")

DataOne <- subset(DataOne,select=SelectedCategories)

## Replace numeric values in activity column to descriptive activity names
DataOne$activity[DataOne$activity==1] <- "WALKING"
DataOne$activity[DataOne$activity==2] <- "WALKING_UPSTAIRS"
DataOne$activity[DataOne$activity==3] <- "WALKING_DOWNSTAIRS"
DataOne$activity[DataOne$activity==4] <- "SITTING"
DataOne$activity[DataOne$activity==5] <- "STANDING"
DataOne$activity[DataOne$activity==6] <- "LAYING"

## Replace column name with more descriptive column names for measurement data
names(DataOne) <- gsub("^t", "time", names(DataOne))
names(DataOne) <- gsub("^f", "frequency", names(DataOne))
names(DataOne) <- gsub("BodyAcc", "bodyacceleration", names(DataOne))
names(DataOne) <- gsub("GravityAcc", "gravityacceleration", names(DataOne))
names(DataOne) <- gsub("Mag", "magnitude", names(DataOne))
names(DataOne) <- gsub("BodyGyro", "bodygyroscope", names(DataOne))
names(DataOne) <- gsub("Jerk", "jerk", names(DataOne))
names(DataOne) <- gsub("Bodybody", "body", names(DataOne))

## Create Tidy Data Set
library(dplyr)
TidyData4 <- aggregate(. ~group + subject + activity, DataOne, mean)
TidyData4 <- TidyData4[order(TidyData4$group,TidyData4$subject,TidyData4$activity),]

write.table(TidyData4,file="tidydata.txt",row.names = FALSE)