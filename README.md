## Course Project - Getting and Cleaning Data

======================================================

This repository is created for the course project of the Coursera Getting and Cleaning Data Course. There are four files in this repository

* README.md
* CodeBook.md
* run_analysis.R
* tidyDataSet.txt

Dataset used in this course project can be downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Requirements of this course project are listed as follows:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


CodeBook.md describes all the variables, data, any transformations or work that are performed in run_analysis.R code for cleaning up the dataset and creating a new tidy data set.

run_analysis.R is the R script used to perform all the operations and analysis to clean up the data set and create a new tidy data set

tidyDataSet.txt is the newly created tidy data set which contains only the averaged mean and standard deviation of all measurements for each Activity and Object.