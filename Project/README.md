# README 
==========================

# Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# Objective

To create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Files included in the Github repo

run_analysis.R - The R script that performs the objectives of the project and creates two tidy datasets. 
Instruction_list.Rmd - The step-by-step recipe that explains the workflow.
Codebook_data1.md - Codebook that provides information about the variables, summary choices, and study design for dataset1.
Codebook_data2.md - Codebook for dataset2.
Colnames_data1.txt - Column names of all the columns in dataset1, including the SubjectId, features, and Activity. 
tidy_data1.txt - The first tidy data that is expected from the project objective.
tidy_data2.txt - The second tidy data that is expected from the project objective.
