##------------------------------------------------
# Program: run_analysis.R
# Course: Getting and Cleaning Data 
# Author: Alfredo Sosa
# Date: 4/19/2020 v 1212
##------------------------------------------------

# clean up the workspace
rm(list = ls())

##------------------------------------------------
# TRAINING DATA
##------------------------------------------------
##------------------------------------------------
# read the subject data subject_train.txt (1-30)
##------------------------------------------------
#rm(subject_train)
subject_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/subject_train.txt", quote="\"", comment.char="")
#View(subject_train)
dim(subject_train)
# add the variable name subject_id
names(subject_train) <- c("subject_id")
# create the variable key
subject_train$key <- seq_along(subject_train$subject_id)
# reorder the data frame
subject_train <- subject_train[,c(2,1)]

##------------------------------------------------
# read the activity label data y_train.txt (1-6)
##------------------------------------------------
#rm(y_train)
y_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/y_train.txt", quote="\"", comment.char="")
#View(y_train)
# rename variable activity_levels
names(y_train) <- "activity_level"
# create the variable key
y_train$key <- seq_along(y_train$activity_level)
# reorder the data frame
y_train <- y_train[,c(2,1)]

# create the character vector
y_train$activity_level_f <- as.numeric(y_train$activity_level)
y_train$activity_level_f <- factor(y_train$activity_level_f, levels = 1:6,
                                   labels = 
                                     c("WALKING",
                                       "WALKING_UPSTAIRS",
                                       "WALKING_DOWNSTAIRS",
                                       "SITTING",
                                       "STANDING",
                                       "LAYING"))
                             
# activity labels 
# 1 = WALKING
# 2 = WALKING_UPSTAIRS
# 3 = WALKING_DOWNSTAIRS
# 4 = SITTING
# 5 = STANDING
# 6 = LAYING

##------------------------------------------------
# read the features data
##------------------------------------------------
# read the features.txt data  
features <- read.table("~/R/Getting and Cleanning Data/project/data/features.txt", quote="\"", comment.char="")
#View(features)

##------------------------------------------------
# read the X_train.txt data (7352 x 561)
##------------------------------------------------
X_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/X_train.txt", quote="\"", comment.char="")
#View(X_train)
# dimensions of X_train (7352 x 561)
dim(X_train) 
# create the key variable
X_train$key <- seq_along(X_train$V1)
# move the column key to the beginning of the data frame
dim(X_train)
X_train <- X_train[,c(562,1:561)]
# create the names vector from the features data
names_features <- features$V2
#names_features
class(names_features)
# convert names_features to character
names_features <- as.character(names_features)
class(names_features)
# change the names of the X_train data
names(X_train) <- c("key",names_features)

##---------------------------------------
## Read total_acc training data sets
##---------------------------------------
# read the total_acc_x_train.txt data
#rm(total_acc_x_train)
total_acc_x_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/Inertial Signals/total_acc_x_train.txt", quote="\"", comment.char="")
#View(total_acc_x_train)
dim(total_acc_x_train)
# create the key variable
total_acc_x_train$key <- seq_along(total_acc_x_train$V1)
dim(total_acc_x_train)
# reorder the columns
total_acc_x_train <- total_acc_x_train[,c(129,1:128)]
# create variable names
varnum <- 1:128
library(stringr)
varnames <- str_c("total_acc_x_",varnum)
#varnames
names(total_acc_x_train) <- c("key",varnames)
names(total_acc_x_train)

# read total_acc_y_train.txt
#rm(total_acc_y_train)
total_acc_y_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/Inertial Signals/total_acc_y_train.txt", quote="\"", comment.char="")
#View(total_acc_y_train)
dim(total_acc_y_train)
# create the key variable
total_acc_y_train$key <- seq_along(total_acc_y_train$V1)
# reorder the columns
total_acc_y_train <- total_acc_y_train[,c(129,1:128)]
# create variable names
varnum <- 1:128
library(stringr)
varnames <- str_c("total_acc_y_",varnum)
names(total_acc_y_train) <- c("key",varnames)

# read total_acc_z_train.txt
total_acc_z_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/Inertial Signals/total_acc_z_train.txt", quote="\"", comment.char="")
#View(total_acc_z_train)
dim(total_acc_z_train)
# create the variable key
total_acc_z_train$key <- seq_along(total_acc_z_train$V1)
# reorder the columns
total_acc_z_train <- total_acc_z_train[,c(129,1:128)]
# rename the variables
varnum <- 1:128
varnames <- str_c("total_acc_z_",varnum)
#varnames
names(total_acc_z_train) <- c("key",varnames)

##---------------------------------------
## Read body_acc training data sets
##---------------------------------------
# read body_acc_x_train.txt data
body_acc_x_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/Inertial Signals/body_acc_x_train.txt", quote="\"", comment.char="")
#View(body_acc_x_train)
dim(body_acc_x_train)
# create the variable key
body_acc_x_train$key <- seq_along(body_acc_x_train$V1)
# reorder the columns
body_acc_x_train <- body_acc_x_train[,c(129,1:128)]
# rename the variables
varnum <- 1:128
library(stringr)
varnames <- str_c("body_acc_x_",varnum)
#varnames
names(body_acc_x_train) <- c("key",varnames)

# read body_acc_y_train.txt
body_acc_y_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/Inertial Signals/body_acc_y_train.txt", quote="\"", comment.char="")
#View(body_acc_y_train)
dim(body_acc_y_train)
# create variable key
body_acc_y_train$key <- seq_along(body_acc_y_train$V1)
# reorder columns
body_acc_y_train <- body_acc_y_train[,c(129,1:128)]
# rename variables
varnum <- 1:128
library(stringr)
varnames <- str_c("body_acc_y_",varnum)
names(body_acc_y_train) <- c("key",varnames)

# read body_acc_z_train.txt
body_acc_z_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/Inertial Signals/body_acc_z_train.txt", quote="\"", comment.char="")
#View(body_acc_z_train)
dim(body_acc_z_train)
# create the key variable
body_acc_z_train$key <- seq_along(body_acc_z_train$V1)
# reorder the columns
body_acc_z_train <- body_acc_z_train[,c(129,1:128)]
# rename the variables
varnum <- 1:128
library(stringr)
varnames <- str_c("body_acc_z_",varnum)
#varnames
names(body_acc_z_train) <- c("key",varnames)

##---------------------------------------
## Read body_gyro  training data sets
##---------------------------------------
# read body_gyro_x_train.txt
body_gyro_x_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/Inertial Signals/body_gyro_x_train.txt", quote="\"", comment.char="")
#View(body_gyro_x_train)
dim(body_gyro_x_train)
# create the key variable
body_gyro_x_train$key <- seq_along(body_gyro_x_train$V1)
# reorder the columns
body_gyro_x_train <- body_gyro_x_train[,c(129,1:128)]
# rename variables
varnum <- 1:128
library(stringr)
varnames <- str_c("body_gyro_x_",varnum)
#varnames
names(body_gyro_x_train) <- c("key",varnames)

# read body_gyro_y_train.txt
body_gyro_y_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/Inertial Signals/body_gyro_y_train.txt", quote="\"", comment.char="")
#View(body_gyro_y_train)
dim(body_gyro_y_train)
# create the key variable
body_gyro_y_train$key <- seq_along(body_gyro_y_train$V1)
# reorder the columns
body_gyro_y_train <- body_gyro_y_train[,c(129,1:128)]
# rename columns
varnum <- 1:128
library(stringr)
varnames <- str_c("body_gyro_y_",varnum)
names(body_gyro_y_train) <- c("key",varnames)

# read body_gyro_z_train.txt
body_gyro_z_train <- read.table("~/R/Getting and Cleanning Data/project/data/train/Inertial Signals/body_gyro_z_train.txt", quote="\"", comment.char="")
#View(body_gyro_z_train)
dim(body_gyro_z_train)
# create the variable key
body_gyro_z_train$key <- seq_along(body_gyro_z_train$V1)
# reorder columns
body_gyro_z_train <- body_gyro_z_train[,c(129,1:128)]
# rename columns
varnum <- 1:128
library(stringr)
varnames <- str_c("body_gyro_z_",varnum)
#varnames
names(body_gyro_z_train) <- c("key",varnames)
                          
##---------------------------------------
## Merge all the data sets
##---------------------------------------
trainingData <- subject_train
# merge y_train
trainingData <- merge(trainingData,y_train, by = "key")
# merge X_train
trainingData <- merge(trainingData,X_train,by = "key")
# merge total_acc_x_train
trainingData <- merge(trainingData,total_acc_x_train,by="key")
# merge total_acc_y_train
trainingData <- merge(trainingData,total_acc_y_train, by = "key")
# merge total_acc_z_train
trainingData <- merge(trainingData,total_acc_z_train,by = "key")
# merge body_acc_x_train
trainingData <- merge(trainingData,body_acc_x_train, by = "key")
# merge body_acc_y_train
trainingData <- merge(trainingData,body_acc_y_train, by = "key")
# merge body_acc_z_train
trainingData <- merge(trainingData,body_acc_z_train, by = "key")
# merge body_gyro_x_train
trainingData <- merge(trainingData,body_gyro_x_train, by = "key")
# merge body_gyro_y_train
trainingData <- merge(trainingData,body_gyro_y_train, by = "key")
# merge body_gyro_z_train
trainingData <- merge(trainingData,body_gyro_z_train, by = "key")

# add variable group
trainingData$group <- "Training"
# reorder the v=columns
trainingData <- trainingData[,c(1718,1:1717)]


##------------------------------------------------
# TEST DATA
##------------------------------------------------
##------------------------------------------------
# read subject_test.txt (1-30)
##------------------------------------------------
subject_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/subject_test.txt", quote="\"", comment.char="")
#View(subject_test)
# rename the variable subject_id
names(subject_test) <- "subject_id"
# create the variable key
subject_test$key <- seq_along(subject_test$subject_id)
# reorder columns
subject_test <- subject_test[,c(2,1)]
dim(subject_test) # 2947 x 2

##------------------------------------------------
# read y_test.txt activity levels (1-6)
##------------------------------------------------
y_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/y_test.txt", quote="\"", comment.char="")
# View(y_test)
# verify the 6 levels
table(y_test)
# name the variable activity_level
names(y_test) <- "activity_level"
# create the key variable
y_test$key <- seq_along(y_test$activity_level)
# reorder the columns
y_test <- y_test[,c(2,1)]
# add the activity_level_f = factor
y_test$activity_level_f <- as.numeric(y_test$activity_level)
y_test$activity_level_f <- factor(y_test$activity_level_f,
                                  levels = 1:6,
                                  labels = 
                                    c("WALKING",
                                      "WALKING_UPSTAIRS",
                                      "WALKING_DOWNSTAIRS",
                                      "SITTING",
                                      "STANDING",
                                      "LAYING"))


##------------------------------------------------
# read the features data
##------------------------------------------------
# read the features.txt data  
features <- read.table("~/R/Getting and Cleanning Data/project/data/features.txt", quote="\"", comment.char="")
#View(features)
##------------------------------------------------
# read X_test.txt
##------------------------------------------------
X_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/X_test.txt", quote="\"", comment.char="")
#View(X_test)
# create variable key
X_test$key <- seq_along(X_test$V1)
dim(X_test)
# reorder the columns
X_test <- X_test[,c(562,1:561)]
# get the names from the features data
namesX_test <- as.character(features$V2)
#namesX_test
# assign variable names
names(X_test) <- c("key",namesX_test)

##---------------------------------------
## Read total_acc test data sets
##---------------------------------------
##---------------------------------------
# read total_acc_x_test.txt
##---------------------------------------
total_acc_x_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/Inertial Signals/total_acc_x_test.txt", quote="\"", comment.char="")
#View(total_acc_x_test)
dim(total_acc_x_test)
# create the variable key
total_acc_x_test$key <- seq_along(total_acc_x_test$V1)
# reorder the columns
total_acc_x_test <- total_acc_x_test[,c(129,1:128)]
# rename the variables
varnum <- 1:128
library(stringr)
varnames <- str_c("total_acc_x_",varnum)
names(total_acc_x_test) <- c("key",varnames)
##---------------------------------------
# read total_acc_y_test.txt
##---------------------------------------
total_acc_y_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/Inertial Signals/total_acc_y_test.txt", quote="\"", comment.char="")
#View(total_acc_y_test)
dim(total_acc_y_test)
# create the key variable
total_acc_y_test$key <- seq_along(total_acc_y_test$V1)
# reorder columns
total_acc_y_test <- total_acc_y_test[,c(129,1:128)]
# assign variable names
varnum <- 1:128
library(stringr)
varnames <- str_c("total_acc_y_",varnum)
names(total_acc_y_test) <- c("key",varnames)
##---------------------------------------
# read total_acc_z_test.txt
##---------------------------------------
total_acc_z_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/Inertial Signals/total_acc_z_test.txt", quote="\"", comment.char="")
#View(total_acc_z_test)
# create variable key
total_acc_z_test$key <- seq_along(total_acc_z_test$V1)
# reorder columns
total_acc_z_test <- total_acc_z_test[,c(129,1:128)]
# rename variables
varnum <- 1:128
library(stringr)
varnames <- str_c("total_acc_z_",varnum)
names(total_acc_z_test) <- c("key",varnames)

##---------------------------------------
## Read body_acc test data sets
##---------------------------------------
##---------------------------------------
# read body_acc_x_test.txt
##---------------------------------------
body_acc_x_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/Inertial Signals/body_acc_x_test.txt", quote="\"", comment.char="")
#View(body_acc_x_test)
# create variable key
body_acc_x_test$key <- seq_along(body_acc_x_test$V1)
# reorder columns
body_acc_x_test <- body_acc_x_test[,c(129,1:128)]
# assign variable names
varnum <- 1:128
library(stringr)
varnames <- str_c("body_acc_x_",varnum)
names(body_acc_x_test) <- c("key",varnames)
##---------------------------------------
# read body_acc_y_test.txt
##---------------------------------------
body_acc_y_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/Inertial Signals/body_acc_y_test.txt", quote="\"", comment.char="")
#View(body_acc_y_test)
# create variable key
body_acc_y_test$key <- seq_along(body_acc_y_test$V1)
# reorder columns
body_acc_y_test <- body_acc_y_test[,c(129,1:128)]
# rename variables
varnum <- 1:128
library(stringr)
varnames <- str_c("body_acc_y_",varnum)
names(body_acc_y_test) <- c("key",varnames)
##---------------------------------------
# read body_acc_z_test.txt
##---------------------------------------
body_acc_z_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/Inertial Signals/body_acc_z_test.txt", quote="\"", comment.char="")
#View(body_acc_z_test)
# create variable key
body_acc_z_test$key <- seq_along(body_acc_z_test$V1)
# reorder columns
body_acc_z_test <- body_acc_z_test[,c(129,1:128)]
# rename variables
varnum <- 1:128
library(stringr)
varnames <- str_c("body_acc_z_",varnum)
names(body_acc_z_test) <- c("key",varnames)

##---------------------------------------
## Read body_gyro test data sets
##---------------------------------------
##---------------------------------------
## Read body_gyro_x_test.txt
##---------------------------------------
body_gyro_x_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/Inertial Signals/body_gyro_x_test.txt", quote="\"", comment.char="")
#View(body_gyro_x_test)
# create variable key
body_gyro_x_test$key <- seq_along(body_gyro_x_test$V1)
# reorder columns
body_gyro_x_test <- body_gyro_x_test[,c(129,1:128)]
# rename variables
varnum <- 1:128
library(stringr)
varnames <- str_c("body_gyro_x_",varnum)
names(body_gyro_x_test) <- c("key",varnames)
##---------------------------------------
## Read body_gyro_y_test.txt
##---------------------------------------
body_gyro_y_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/Inertial Signals/body_gyro_y_test.txt", quote="\"", comment.char="")
#View(body_gyro_y_test)
# create variable key
body_gyro_y_test$key <- seq_along(body_gyro_y_test$V1)
# reorder columns
body_gyro_y_test <- body_gyro_y_test[,c(129,1:128)]
# rename variables
varnum <- 1:128
library(stringr)
varnames <- str_c("body_gyro_y_",varnum)
names(body_gyro_y_test) <- c("key",varnames)
##---------------------------------------
## Read body_gyro_z_test.txt
##---------------------------------------
body_gyro_z_test <- read.table("~/R/Getting and Cleanning Data/project/data/test/Inertial Signals/body_gyro_z_test.txt", quote="\"", comment.char="")
#View(body_gyro_z_test)
# create variable key
body_gyro_z_test$key <- seq_along(body_gyro_z_test$V1)
# reorder columns
body_gyro_z_test <- body_gyro_z_test[,c(129,1:128)]
# rename variables
varnum <- 1:128
library(stringr)
varnames <- str_c("body_gyro_z_",varnum)
names(body_gyro_z_test) <- c("key",varnames)

##---------------------------------------
## Merge test data
##---------------------------------------
testData <- subject_test
#View(testData)
dim(testData)
# merge y_test
testData <- merge(testData,y_test, by = "key")
# merge X_test
testData <- merge(testData,X_test, by = "key")
# merge total_acc_x_test
testData <- merge(testData,total_acc_x_test, by = "key")
# merge total_acc_y_test
testData <- merge(testData,total_acc_y_test, by = "key")
# merge total_acc_z_test
testData <- merge(testData,total_acc_z_test, by = "key")
# merge body_acc_x_test
testData <- merge(testData,body_acc_x_test, by = "key")
# merge body_acc_y_test
testData <- merge(testData,body_acc_y_test, by = "key")
# merge body_acc_z_test
testData <- merge(testData, body_acc_z_test, by = "key")
# merge body_gyro_x_test
testData <- merge(testData,body_gyro_x_test, by = "key")
# merge body_gyro_y_test
testData <- merge(testData,body_gyro_y_test,by = "key")
# merge body_gyro_z_test
testData <- merge(testData,body_gyro_z_test,by = "key")

# add variable group
testData$group <- "Test"
# reorder the columns
testData <- testData[,c(1718,1:1717)]

dim(testData)

# remove unecessary files
#ls() # see which variables I have in my workspace
#rm(list = ls()) # clean up the workspace

removefiles <- c("body_acc_x_test","body_acc_x_train","body_acc_y_test",  
                 "body_acc_y_train","body_acc_z_test","body_acc_z_train", 
                 "body_gyro_x_test","body_gyro_x_train","body_gyro_y_test", 
                 "body_gyro_y_train","body_gyro_z_test","body_gyro_z_train",
                 "features","names_features","namesX_test",  
                 "subject_test","subject_train","total_acc_x_test","total_acc_x_train",
                 "total_acc_y_test","total_acc_y_train","total_acc_z_test","total_acc_z_train",
                 "varnames","varnum","X_test","X_train","y_test","y_train")

rm(list = removefiles) # clean up the workspace
rm(removefiles)

##---------------------------------------
## 1) Merge all data
##---------------------------------------
#View(trainingData)
#View(testData)
table(trainingData$subject_id)
table(testData$subject_id)

# variable intersection
length(intersect(names(trainingData), names(testData)))

allData <- rbind(trainingData,testData)
dim(allData)

table(allData$group)

# download the data
write.csv(allData, file = "./R/Getting and Cleanning Data/project/output/allData.csv")


##------------------------------------------------------------------
## 2) Calculates Mean and Standard Deviation of all the measures
##------------------------------------------------------------------
#View(allData)
vars <- allData[,c(6:dim(allData)[2])]
#View(vars)
means <- apply(vars, 2, mean)
sd <- apply(vars, 2, sd)

# download
write.csv(means, file = "./R/Getting and Cleanning Data/project/output/means.csv")
write.csv(sd, file = "./R/Getting and Cleanning Data/project/output/sd.csv")

##------------------------------------------------------------------
## 3) Uses descriptive activity names to name the activities in the data set
##------------------------------------------------------------------
# Done

##------------------------------------------------------------------
## 4) Appropriately labels the data set with descriptive variable names.
##------------------------------------------------------------------
# Done

##------------------------------------------------------------------
## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##------------------------------------------------------------------
# split the data
library(dplyr)
splitData <- allData %>%
  group_by(subject_id, activity_level)

# calculate means
means_split <- summarise_all(splitData, "mean")

# download
write.csv(means_split, file = "./R/Getting and Cleanning Data/project/output/means_split.csv")


