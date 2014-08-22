#
# Getting and Cleaning Data course project
#
# Download the data file from: 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# and unpack it to your local hard drive

# set the current directory 
# change this location to where you unpacked the data file
setwd("~/modules/Coursera/Getting and Cleaning Data/assignments/project/UCI HAR Dataset/")

#
# Step 1: Merges the training and the test sets to create one data set
#

# read the training datasets: subject, x and y 
subject_train <- read.table("train/subject_train.txt", header=FALSE)
x_train <- read.table("train/X_train.txt",  header=FALSE)
y_train <- read.table("train/y_train.txt", header=FALSE)

# read the test datasets
subject_test <- read.table("test/subject_test.txt", header=FALSE)
x_test <- read.table("test/X_test.txt",  header=FALSE)
y_test <- read.table("test/y_test.txt", header=FALSE)

# combine the training and test datasets
subject_df <- rbind(subject_train, subject_test)
x_df <- rbind(x_train, x_test)
y_df <- rbind(y_train, y_test)

# tidy up
remove(subject_train, subject_test, x_train, x_test, y_train, y_test)

# read the features and activities
features <- read.table("features.txt", header=FALSE)
activities <- read.table("activity_labels.txt", header=FALSE)


#
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
#

# find which measurements have "mean" or "std" in their name
mean_std_list <- grepl("mean|std", tolower(features[,2]))

# find the corresponding names
mean_std_names <- features[mean_std_list,2]

# extract out just the required columns from the full dataset
mean_std_df <- x_df[,mean_std_list]

# tidy up
remove(x_df)


#
# Step 4: Appropriately labels the data set with descriptive variable names
#         This step is being done now as its easier to name the variables
#         before adding any other variables
#

# first expand out the variable names
# Acc -> Accelerometer
mean_std_names <- sub("Acc", "Accelerometer", mean_std_names)    
# Gyro -> Gyroscope
mean_std_names <- sub("Gyro", "Gyroscope", mean_std_names)
# Mag -> Magnitude
mean_std_names <- sub("Mag", "Magnitude", mean_std_names)
# t (at the start of a name) -> time
mean_std_names <- sub("^t", "time", mean_std_names)
# f (at the start of a name) -> fft
mean_std_names <- sub("^f", "fft", mean_std_names)
# Freq -> Frequency
mean_std_names <- sub("Freq", "Frequency", mean_std_names)

# add these names to the dataset
names(mean_std_df) <- mean_std_names


#
# Step 3: Uses descriptive activity names to name the activities in the data set
#

# first, create a dataframe of the activity labels
names(y_df) <- "ActivityID"
names(activities) <- c("ActivityID", "ActivityName")
y_activities_df <- data.frame("ActivityName"=activities$ActivityName[y_df$ActivityID])

# add the activities to the mean_std_df dataset
mean_std_df <- cbind(y_activities_df, mean_std_df)

#
# Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#

# first add the subject dataset
names(subject_df) <- "Subject"
mean_std_df <- cbind(subject_df, mean_std_df)

# load library plyr
library(plyr)

# Calculate the mean for the measurement variables across Activity Name and Subject
mean_df <- ddply(mean_std_df, .(ActivityName, Subject), numcolwise(mean))


# Save this new dataset
write.table(mean_df, "mean_values.txt", row.names=FALSE)
