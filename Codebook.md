# Week4Project

##Source Data
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
==================================================================

Explanation of dataset and features found in README file and features_info.txt files of UCI HAR Dataset

###Based on project instructions only the following files of UCI HAR Dataset are used:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Subjects in Training group.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Subjects in Test group.

The datasets in the Inertial Signals directories are not used.

###Variables in result dataset

Only variables that are a mean() or std() are used from raw dataset

- group: Test or Train
- activity: 1:WALKING, 2:WALKING_UPSTAIRS, 3:WALKING_DOWNSTAIRS, 4:SITTING, 5:STANDING, 6:LAYING
- subject: 30 participants, numbered 1 through 30

- tBodyAcc-mean()-X: timebodyacceleration-mean()-X
- tBodyAcc-mean()-Y: timebodyacceleration-mean()-Y
- tBodyAcc-mean()-Z: timebodyacceleration-mean()-Z
- tBodyAcc-std()-X: timebodyacceleration-std()-X
- tBodyAcc-std()-Y: timebodyacceleration-std()-Y
- tBodyAcc-std()-Z: timebodyacceleration-std()-Z
- tGravityAcc-mean()-X: timegravityacceleration-mean()-X
- tGravityAcc-mean()-Y: timegravityacceleration-mean()-Y
- tGravityAcc-mean()-Z: timegravityacceleration-mean()-Z
- tGravityAcc-std()-X: timegravityacceleration-std()-X
- tGravityAcc-std()-Y: timegravityacceleration-std()-Y
- tGravityAcc-std()-Z: timegravityacceleration-std()-Z
- tBodyAccJerk-mean()-X: timebodyaccelerationjerk-mean()-X
- tBodyAccJerk-mean()-Y: timebodyaccelerationjerk-mean()-Y
- tBodyAccJerk-mean()-Z: timebodyaccelerationjerk-mean()-Z
- tBodyAccJerk-std()-X: timebodyaccelerationjerk-std()-X
- tBodyAccJerk-std()-Y: timebodyaccelerationjerk-std()-Y
- tBodyAccJerk-std()-Z: timebodyaccelerationjerk-std()-Z
- tBodyGyro-mean()-X: timebodygyroscope-mean()-X
- tBodyGyro-mean()-Y: timebodygyroscope-mean()-Y
- tBodyGyro-mean()-Z: timebodygyroscope-mean()-Z
- tBodyGyro-std()-X: timebodygyroscope-std()-X
- tBodyGyro-std()-Y: timebodygyroscope-std()-Y
- tBodyGyro-std()-Z: timebodygyroscope-std()-Z
- tBodyGyroJerk-mean()-X: timebodygyroscopejerk-mean()-X
- tBodyGyroJerk-mean()-Y: timebodygyroscopejerk-mean()-Y
- tBodyGyroJerk-mean()-Z: timebodygyroscopejerk-mean()-Z
- tBodyGyroJerk-std()-X: timebodygyroscopejerk-std()-X
- tBodyGyroJerk-std()-Y: timebodygyroscopejerk-std()-Y
- tBodyGyroJerk-std()-Z: timebodygyroscopejerk-std()-Z
- tBodyAccMag-mean(): timebodyaccelerationmagnitude-mean()
- tBodyAccMag-std(): timebodyaccelerationmagnitude-std()
- tGravityAccMag-mean(): timegravityaccelerationmagnitude-mean()-X
- tGravityAccMag-std(): timegravityacceleration-std()-X
- BodyAccJerkMag-mean(): bodyaccelerationjerkmagnitude-mean()
- tBodyAccJerkMag-std(): timebodyaccelerationjerkmagnitude-std()
- BodyGyroMag-mean(): bodygyroscopemagnitude-mean()
- tBodyGyroMag-std(): timebodygyroscopemagnitude-std()
- tBodyGyroJerkMag-mean(): timebodygyroscopejerkmagnitude-mean()
- tBodyGyroJerkMag-std(): timebodygyroscopejerkmagnitude-std()
- fBodyAcc-mean()-X: frequencybodyacceleration-mean()-X
- fBodyAcc-mean()-Y: frequencybodyacceleration-mean()-Y
- fBodyAcc-mean()-Z: frequencybodyacceleration-mean()-Z
- fBodyAcc-std()-X: frequencybodyacceleration-std()-X
- fBodyAcc-std()-Y: frequencybodyacceleration-std()-Y
- fBodyAcc-std()-Z: frequencybodyacceleration-mean()-Z
- fBodyAccJerk-mean()-X: frequencybodyaccelerationjerk-mean()-X 
- fBodyAccJerk-mean()-Y: frequencybodyaccelerationjerk-mean()-Y
- fBodyAccJerk-mean()-Z: frequencybodyaccelerationjerk-mean()-Z
- fBodyAccJerk-std()-X: frequencybodyaccelerationjerk-std()-X
- fBodyAccJerk-std()-Y: frequencybodyaccelerationjerk-std()-Y
- fBodyAccJerk-std()-Z: frequencybodyaccelerationjerk-std()-Z
- fBodyGyro-mean()-X: frequencybodygyroscope-mean()-X
- fBodyGyro-mean()-Y: frequencybodygyroscope-mean()-Y
- fBodyGyro-mean()-Z: frequencybodygyroscope-mean()-Z
- fBodyGyro-std()-X: frequencybodygyroscope-std()-X
- fBodyGyro-std()-Y: frequencybodygyroscope-std()-Y
- fBodyGyro-std()-Z: frequencybodygyroscope-std()-Z
- fBodyAccMag-mean(): frequencybodyaccelerationmagnitude-mean()
- fBodyAccMag-std(): frequencybodyaccelerationmagnitude-std()
- fBodyBodyAccJerkMag-mean(): frequencybodyaccelerationjerkmagnitude-mean()
- fBodyBodyAccJerkMag-std(): frequencybodyaccelerationjerkmagnitude-std()
- fBodyBodyGyroMag-mean(): frequencybodygyroscopemagnitude-mean()
- fBodyBodyGyroMag-std(): frequencybodygyroscopemagnitude-std()
- fBodyBodyGyroJerkMag-mean(): frequencybodygyroscopejerkmagnitude-mean()
- fBodyBodyGyroJerkMag-std(): frequencybodygyroscopejerkmagnitude-std()

##Procedure
Run the run_analysis.R script to:
  - Download the UCI HAR Dataset
  - combine the test and training datasets
  - extract only that data with mean() or std()
  - apply column headers to resultset
  - replace numeric values in activity data with descriptive labels
  - make column names more descriptive
  - export a text file of the mean of each variable per subject and activity 
