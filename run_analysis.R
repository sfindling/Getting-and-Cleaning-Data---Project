################
# run_analysis.R
################
# Serge Findling
# Spring, Texas - April 2014
#=========================================================================================
# This scritp requires reshape2 package
#   install.packages("reshape2")
# The dataset is located at:
#   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# * Download the dataset
# * Unzip the dataset and copy it in your working directory
#
# The dataset is all included in a folder "UCI HAR Dataset". 
# You should see that folder in your working directory
#
# You may want to set your working directory. Adapt the following example and remove the #
#   setwd("~/R/GettingData/Getting and Cleaning Data Project")
#=========================================================================================

# load libraries

library(reshape2)

# Check if "UCI HAR Dataset" folder exist or not
if(!file.exists("UCI HAR Dataset")) {print("UCI HAR Dataset folder not found !!!!!!!!!!!!!")}
DatasetPath="./UCI HAR Dataset/"
# Reading data
features=read.table(paste(DatasetPath,"features.txt",sep=""))
activity_labels=read.table(paste(DatasetPath,"activity_labels.txt",sep=""))
subject_train=read.table(paste(DatasetPath,"train/subject_train.txt",sep=""))
subject_test=read.table(paste(DatasetPath,"test/subject_test.txt",sep=""))
X_train=read.table(paste(DatasetPath,"train/X_train.txt",sep=""))
y_train=read.table(paste(DatasetPath,"train/y_train.txt",sep=""))
X_test=read.table(paste(DatasetPath,"test/X_test.txt",sep=""))
y_test=read.table(paste(DatasetPath,"test/y_test.txt",sep=""))

# Merging Test and Train
X=rbind(X_train,X_test)
y=rbind(y_train,y_test)
subject=rbind(subject_train,subject_test)

# Save merged data set
write.table(X,"X.txt",row.names=FALSE,col.names=FALSE)
write.table(y,"y.txt",row.names=FALSE,col.names=FALSE)
write.table(subject,"subject.txt",row.names=FALSE,col.names=FALSE)
print(paste("X.txt,y.txt, and subject.txt created in ",getwd(),sep=""))
#Name the columns
names(X)=features[,2]

#Extracts only the measurements on the mean and standard deviation for each measurement. 
meanlocation=grep("mean",features[,2],ignore.case = TRUE)
stdlocation=grep("std",features[,2],ignore.case = TRUE)
MeanOrStd=sort(c(meanlocation,stdlocation))
ExtractX=X[,MeanOrStd]

#Uses descriptive activity names to name the activities in the data set
y[,1]=activity_labels[y[,1],2]

# Appropriately labels the data set with descriptive activity names. 
names(subject)="Subject"
names(y)="Activity"
SyX=cbind(subject,y,ExtractX)
write.table(SyX,"SyX.txt")
write.csv(SyX,"SyX.csv")
print(paste("SyX.csv and SyX.txt created in ",getwd(),sep=""))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
melted=melt(SyX,id.vars=c("Activity","Subject"))
tidy=dcast(melted, Subject + Activity ~ variable, mean)
# Change content of subject column by addin the word subject in from of the subject's number.
# This change is to avoid confusion and help reader to understand
tidy[,1]=paste("subject",tidy[,1],sep="")
write.csv(tidy,"tidy.csv")
write.table(tidy,"tidy.txt")
print(paste("tidy.csv and tidy.txt created in ",getwd(),sep=""))









