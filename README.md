# GetData Course Project Repository
Course Project repository for the Coursera Data Science Specialization Course, "Getting and Cleaning Data""

## Contents
The repository contains the following files:

1. run_anlaysis.R:  The R script file to generate a tidy data set
2. TidyLabels.csv: A list of values to be extracted from the raw data set, and their corresponding human-readable labels.  Changes to this file will change the columns that appear in the output "tidyData.csv"
3. CodeBook.md: Explanation of the data used and how it is transformed
4. README.md: this file

## How to Run
This script processes data from the "Human Activity Recognition Using Smartphones Dataset
Version 1.0".  The dataset is hosted here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The data files must be downloaded and extracted to the working directory where the script is to be run.  After extraction, there should be a directory called "UCI HAR Dataset" in the working directory.  "TidyLabels.csv" must also be in the same working directory. 

From the R prompt, simply run the commmand run_analysis().  The tidy data set will be written to a file called "tidyData.txt"."

**Packages Required:**

* reshape2
* data.table
* dplyr