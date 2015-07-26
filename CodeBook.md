---
title: "CodeBook"
author: "Matt Baddeley"
date: "July 18, 2015"
output: html_document
---

Cleaned & Summarized Data For Human Activity Recognition Using Smartphones Dataset
Version 1.0

##Experimental design and background: 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

##Raw data: 
**The input data set includes the following information:**

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

**The dataset includes the following files:**

* 'features_info.txt': Shows information about the variables used on the observation (feature) vector.
* 'features.txt': List of all observations (features).
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

**Notes:**
* Observations are normalized and bounded within [-1,1], so they are unitless, relative values
* Each observation vector is a row on the text file.


##Processed data: 
###Data extracted from the raw files


The following measurements are included in the output dataset:

Measurement           | Description
----------------------|------------
Body Acceleration     | Linear acceleration, after compensating for gravity
Gravity Acceleration  | Linear acceleration component due to gravity
Body Jerk             | "Jerk" is the first derivative of acceleration (rate of change of acceleration)
Angular Velocity      | Measured by gyroscope. This is mis-labeled as acceleration in the raw dataset.
Angular Acceleration  | This is labeled as "jerk" in the raw dataset, but since it is the first derivative of velocity, it is actually acceleration.

All measurements include:

* both mean and standard deviation values
* X,Y and Z axis components plus a magnitude value
* both time and frequency domain values

**Note:** Frequency domain observations of Angular Acceleration are limited to magnitude only

See the file "TidyLabels.csv" for the mapping of raw data labels to output data labels


###Annotation

The test and training datasets are combined into a single dataset.  Each row in the dataset is annotated with the subject (integer) and the type of activity (factor)


###Summarization

The summarized data in the output file "tidyData.txt" contains cumulative mean values for all measurements for each subject for each activity. 

