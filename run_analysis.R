# load packages that will be used in this assignment for generating the tidy 
# dataset
library(plyr)

dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
datasetName <- "UCL_data.zip"
download.file(dataURL, destfile = datasetName, method = "curl")
unzip(datasetName)
files <- list.files()
dataDirectoryName <- files[grep("HAR", files)]
setwd(paste("./", dataDirectoryName, sep = ""))

# Step 1: Merge the training and test datasets to one single dataset
# 'X' data
trainDataX <- read.table("train/X_train.txt")
testDataX <- read.table("test/X_test.txt")
combinedDataX <- rbind(trainDataX, testDataX)

# 'Y' data
trainDataY <- read.table("train/y_train.txt")
testDataY <- read.table("test/y_test.txt")
combinedDataY <- rbind(trainDataY, testDataY)

# 'Subject' data
trainSubject <- read.table("train/subject_train.txt")
testSubject <- read.table("test/subject_test.txt")
combinedSubject <- rbind(trainSubject, testSubject)

# Step 2: Extracts only the measurements on the mean and standard deviation for 
# each measurement
featureNames <- read.table("features.txt")

namesWithMeanStd <- grep("-(mean|std)\\(\\)", featureNames[, 2])

data <- combinedDataX[, namesWithMeanStd]

names(data) <- featureNames[namesWithMeanStd, 2]

# Step 3: Uses descriptive activity names to name the activities in the data set
activityNames <- read.table("activity_labels.txt")

combinedDataY[, 1] <- activityNames[combinedDataY[, 1], 2]

names(combinedDataY) <- "Activity"

# Step 4: Appropriately labels the data set with descriptive variable names
names(combinedSubject) <- "Subject"

newDataSet <- cbind(data, combinedDataY, combinedSubject)

# Step 5: From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject
tidyDataSet <- ddply(newDataSet, .(Activity, Subject), function (x) colMeans(x[, 1:66]))

write.table(tidyDataSet, file = "tidyDataSet.txt", row.names = FALSE)
