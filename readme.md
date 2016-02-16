# Getting and Cleaning Data: Course Project

## Introduction
The goal of this project is to prepare tidy data that is synthesized from human activity data collected using a Samsung Galaxy S smartphone.  This data can be used for later analysis.

A full description of the human activity data is available at the site where the data was obtained:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set can be found in a zipped file at:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Tidy Data and Script
The tidy data was created using R script called 'run_analysis.R' that does the following.

1. Merges the training and the test sets from the downloaded data to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set, and appropriately labels the data set with descriptive variable names.
4. From the dataset above, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output is a tidy data in a file named 'tidy.txt.'  

##Code Book
Also included here is a code book 'codebook.md' describing the variables.