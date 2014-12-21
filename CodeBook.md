## Script Overview

The Human Activity Recognition Using Smartphones Dataset downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" contains one training dataset and one test dataset plus several supporting files, such as feastures.txt, activity_labels.txt. Each dataset contains three separate text files, 1) data, 2) labels, and 3) subjects. For the text files that contain data, they are tables each with 561 features (measurements made during each activity from different subject). The training dataset has 7352 observations (rows) and the test dataset has 2947 observations. For the text file that contain labels, they are tables each with 1 feature, which indicate the activity performed by each subject. For the text file that contain subject, they are also tables each with 1 feature, which indicate which subject performs these activities for each observation appeared in the training and test datasets.

Our job is to create a tidy dataset, which is a combination of both the training dataset and test dataset, but only include the averaged mean and standard deviation of each distinct measurements made for all activities performed by all subjects. 

## Key Steps

### Preparation:
* Load the package "plyr" into R
* Download the dataset from the url given above, unzip the downloaded file, and make this as your working directory.

### First Step:
Merge the training dataset and test dataset. Use read.table() function to read in the training data and test data, training labels and test labels, as well as training subjects and test subjects. Then use rbind() to merge the data, labels and subjects separately.

### Second Step:
Extract only the measurements on the mean and standard deviation for each measurement. This is done by the help of "features.txt" file, where all the feature names are saved. grep() function is used here to extract only those columns whose feature name contain either "-mean()" or "-std()". A new data frame is created to save these extracted data.  

### Third Step:
Uses descriptive activity names to name the activities in the data set. This is done by replacing the class labels in the merged label data with the activity names appearing in the "activity_labels.txt" file. 

### Fourth Step:
Appropriately labels the data set with descriptive variable names. This is done by change the variable name of activity class in labels data to "Activity" and the variable name of subject in subject data to "Subject". In this step, we also create a new data frame by merge the data, labels and subject data. This is done by calling the cbind() function. 

### Fifth Step:
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is done by using the ddply() function in the "plyr" package, which splits the new data frame according to the specified variables, here they are "Activity" and "Subject", and apply the colMeans() function to all 66 features for each activity and subject, and then return a new data frame which only contains the average of each variable for each activity and subject. Finally, write this tidy data set into a text file "tidyDataSet.txt" using write.table() function. 

## Variables

* trainDataX, trainDataY, trainSubject are data frames, of dimensions 7352 by 561, 7352 by 1, and 7352 by 1, which contain the data, labels, and subjects respectively obtained from the training dataset "X_train.txt", "y_train.txt" and "subject_train.txt". 
* testDataX, testDataY, testSubject are data frames, of dimensions 2947 by 561, 2947 by 1 and 2947 by 1, which contain the data, labels, and subjects respectively obtained from the test dataset "X_test.txt", "y_test.txt" and "subject_test.txt".
* combinedDataX, combinedDataY, combinedSubject are data frames, of dimensions 10299 by 561, 10299 by 1, and 10299 by 1, which save the merged dataset using both the training and test datasets
* featureNames is a data frame, of a dimension 561 by 2, which contains all the feature names obtained from "features.txt"
* namesWithMeanStd is an integer vector, which contains all the column numbers in the combinedDataX that correspond to measurements on the mean and standard deviation for each measurement.
* data is a new data frame, of dimension 10299 by 66, that saves the extracted data from combinedDataX using namesWithMeanStd
* activityNames is a data frame, of dimension 6 by 2, which contains all the activity names obtained from "activity_labels.txt". The activityNames will be used to replace the class labels in combinedDataY data frame
* newDataSet is a merged data frame, of dimension 10299 by 68, by combining the data, combinedDataY, and combinedSubject data frame.
* tidyDataSet is a new data frame, of dimension 180 by 68, which is the returned result of ddply() function. This data frame contains averaged features for each activity and subject. 
 