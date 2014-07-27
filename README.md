CleaningDataProject
===================

A folder to host porject of Getting and Cleaning Data Class

==================================================================
Data Cleaning Project
==================================================================
This file describe the step-by-step how to create a tidy dataset by
combining and cleaning the different dataset using R
==================================================================



- Define the working directory : 
	setwd("c://JHU//CleaningData")

- Read features.txt file into R and assign to a character vector. This file contain the column titles.
	colTitle <-read.table("features.txt", header=FALSE)
	colTitleName <-colTitle[, "V2"]

- Read the main training dataset into R: 
	train_x <-read.table("X_train.txt", header = FALSE, sep = "")

- Read the training subject dataset into R and create a column title:
	train_id <-read.table("subject_train.txt", header = FALSE)
	colnames(train_id) <-"id"

- Read the training activity dataset into R and lable the activities based on features_info.txt file:
	train_act <-read.table("y_train.txt", header = FALSE)
	colnames(train_act) <-"activity"
	train_act$activity <-as.factor(train_act$activity)
	levels(train_act$activity) <-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

- Rename the column title for main training dataset.
	colnames(train_x) <-colTitleName

- Combine the different conponents for training dataset:
	train <-cbind(train_id, train_act, train_x)

- Do the same process for test dataset.

- Combine the training and test dataset:
	final <-rbind(train,test)
