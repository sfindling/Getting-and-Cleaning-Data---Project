Getting and Cleaning Data Project - README.md
========================================================
*Serge Findling*
*serge.findling@gmail.com*
*Spring, Texas - April 2014*

Script Objective
-----------------
The dataset  represents data collected from the accelerometers from the Samsung Galaxy S smartphone in a trial of 30 subjects. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    
The data set has been separated in two different sets:
  * Training set
  * Test set
This is a classic approach when building models or learning systems. The training set is used to discover the rules and the second set is used to test that those rules effectively work on a different set of data.

This script does the following:
* Merge the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Labeled 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
* Output results as files in the working directory

Preparation tasks
-----------------
You will need R to run this script. The script has been written with the concern to be run on any platform and use generic choices whenever possible. However development and testing was performed on the following platform:

* *Windows 8.0 US*
* *R Version 3.1.0 (2014-04-10)*

The dataset used is located at:

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
The working directory refers to the working directory set in are. If want to use a different directory, set the working directory to the one you want to use before to use the script. This script expect the data sets to be located in a structure of sub-folders and files similar as the structure in the zip file
1. Download the dataset
2. Unzip the dataset and copy it in your working directory
3. Download the script  "run_analysis.R" in your working directory

You should have one folder named "UCI HAR Dataset" in your working directory.
The script will test if this directory is present and will display an error message if missing.

Dataset
-------
Only some of the files are used by this script. Used files are as follows:

* features.txt
* activity_labels.txt
* train/subject_train.txt
* test/subject_tst.txt
* train/X_train.txt
* train/y_train.txt
* test/X_test.txt
* test/y_test.txt
For more details about all files please read the README.txt file.

Results
-------
Run the script "run_analysis.R" in R.
The following files will be created in the working directory:

1. **Merged** (train+test) data sets with only measurements on the mean and standard deviation for each measurement.
  * X.txt
  * y.txt
  * subject.txt

2. **Combined data frame** SyX (Subject+y+X) with labels in csv and txt format:
  * SyX.csv
  * SyX.txt

3. **Tidy** data set with the average of each variable for each activity and each subject
  * tidy.csv
  * tidy.txt



Repository Content
------------------
The repository contents the following files:
* README.md         --- The current document
* CodeBook.md       --- data specifications and processing
* run_analysis.R    --- the R script



