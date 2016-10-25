###################################
# R-script to acheive the following objectives:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####################################

# Clean up workspace
rm(list=ls())

# Load libraries
library(plyr)

# 1. Creating data frames of relevant training and test sets. \
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# 2. Transform sub_train and sub_test data.frame columns class to "factor". \
sub_train <- transform(sub_train, V1 = as.factor(V1))
sub_test <- transform(sub_test, V1 = as.factor(V1))

# 3. Transform y_train and y_test data.frame columns class to "character". \
y_train <- transform(y_train, V1 = as.character(V1))
y_test <- transform(y_test, V1 = as.character(V1))

# 4. Mergeing the measurements of training and the test sets to create one data set. \
x_merge <- rbind(x_train, x_test)

# 5. Creating features data frame. \
features <- read.table("./UCI HAR Dataset/features.txt")

# 6. Adding feature names as heading to the merged dataframe, x_merge. \
names(x_merge) <- features[,2]

# 7. Extracting only the measurements on the mean and standard deviation for each measurement. \
x_merge_mean_std <- x_merge[,(grepl("mean()", names(x_merge), fixed = TRUE) | grepl("std()", names(x_merge), fixed = TRUE))]

# 8. Creating SubjectId and Activity dataframes by merging respective training and test data. \
sub_merge <- rbind(sub_train, sub_test)
y_merge <- rbind(y_train, y_test)
names(sub_merge) <- "SubjectId"
names(y_merge) <- "Activity"

# 9. Combining SubjectId, x_merge_mean_std, and Activity using cbind. \
mer_data <- cbind(sub_merge, x_merge_mean_std, y_merge)

# 10. Using descriptive activity names to name the activities in the data set. \
mer_data$Activity <- mapvalues(mer_data$Activity, from = c("1", "2", "3", "4", "5", "6"), to = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# 11. Write the first dataset to a .txt file \
write.table(mer_data, "tidy_data_1.txt", row.name=FALSE) 

# 12. From the data set in step 11, creates a second, independent tidy data set with the average of each variable for each activity and each subject. \
average_by_act_sub <- ddply(mer_data, .(Activity, SubjectId), function(x) colMeans(x[, 2:67]))

# 13. Write the second dataset to a second .txt file. \
write.table(average_by_act_sub, "tidy_data_2.txt", row.name=FALSE)

