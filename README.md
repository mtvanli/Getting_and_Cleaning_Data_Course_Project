## Getting_and_Cleaning_Data_Course_Project
========================================

## About the project:

The run_analysis.R script reads data from the "Human Activity Recognition 
Using Smartphones Dataset Version 1.0" and produces a new tidy dataset.

The data in the "Human Activity Recognition Using Smartphones Dataset 
Version 1.0" have been taken from experiments carried out with a group of 30 
volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 
3-axial angular velocity at a constant rate of 50Hz data were captured. 
The experiments were video-recorded to label the data manually. 
The obtained dataset was randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data 
and 30% the test data.

The original dataset included the following data files:

'features.txt': List of all features.

'activity_labels.txt': List of class labels and their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'train/subject_train.txt': ID's of subjects in the training data

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

'test/subject_test.txt': ID's of subjects in the training data


The original data set can be downloaded from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## A brief description of the script:

For script to run R working directory must include the Samsung Data

The run_analysis.R script merges data from a number of .txt files and produces a tidy data set which may be used for further analysis.

The script does the followings:

* It reads all required data and labels from the .txt files

* It then extracts the variable names from the Features.txt to later use as field names in the merged data

* It merges the training and the test sets to create one data set.

* It relabels the last columns of the merged data set as "Subject"

* It merges the Activity Labels with the mergedData to get the descriptive activity names in the dataset(i.e replace 1-6 with WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING). 

* It relabels the new last columns of as "Activity" and removes the Activity numbers. 

* It extracts only the measurements on the mean and standard deviation for each measurement.

* It tidies up the field names by clearing brackets () from the column names. ( I think () make the text look messy)

* Finally it creates a tidy data set called "tidyDataSet.txt" containing the average of filtered variables for each activity and each subject. 

A description of the "tidyDataSet.txt" file may be found in the "CodeBook.md" file.

## Acknowledgements:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.