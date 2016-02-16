# Code Book for the data in dt_tidy.txt

## Introduction and Data Source
The data in dt_tidy.txt is synthesized from human activity data collected using a Samsung Galaxy S smartphone.

The source of the data set can be found in a zipped file at:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters, and further separated using low pass filters.

The following files from the zipped folder were used in constructing the tidy data set:
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_test.txt' and 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Tidy Data Creation Proces
The tidy data was created using R script called 'run_analysis.R' that does the following.

1. Merges the training and the test sets from the downloaded data to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set, and appropriately labels the data set with descriptive variable names.
4. From the dataset above, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output is a tidy data in a file named 'dt_tidy.txt.'  

##  Tidy Variables Description
In the derived tidy dataset the signals (features) in test and training data sets were merged and summarized to compute the mean [suffixed with a mean()] and standard deviation [suffixed with a std()] below: 

*tBodyAcc-XYZ
*tGravityAcc-XYZ
*tBodyAccJerk-XYZ
*tBodyGyro-XYZ
*tBodyGyroJerk-XYZ
*tBodyAccMag
*tGravityAccMag
*tBodyAccJerkMag
*tBodyGyroMag
*tBodyGyroJerkMag
*fBodyAcc-XYZ
*fBodyAccJerk-XYZ
*fBodyGyro-XYZ
*fBodyAccMag
*fBodyAccJerkMag
*fBodyGyroMag
*fBodyGyroJerkMag

Also, additional vectors obtained by averaging the angle() variable:

*gravityMean
*tBodyAccMean
*tBodyAccJerkMean
*tBodyGyroMean
*tBodyGyroJerkMean

Other estimates have been removed for the purpose of this excercise.

Note: features are normalized and bounded within [-1,1] and other estimates have been ignored.