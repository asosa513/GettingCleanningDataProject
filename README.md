# GettingCleanningDataProject
Peer-graded Assignment: Getting and Cleaning Data Course Project

The file run_analysis [04192020 1211].R runs all the analyses needed in this project.

Training Data
1) Reads the subject_train.txt and assigns a variable "key" to be able to merge with all the files of the training data
2) Reads the file y_train.txt and assigns a variable "key" as well as converts the activity_level into a factor with its corresponding labels
3) Reads the X_train.txt data, assigns the variable "key" and names the variables using the features.txt data
4) For the sets of files total_acc_xyz_train.txt, body_acc_xyz_train.txt and body_gyro_x,y,z_train.txt the script reads the files, assigns a variable "key" and renames the variables by concatenating the prefix, for example, total_acc_x with the variable number 1:128
5) The scripts merges all the data sets into one consolidated training data called trainingData

Test Data
1) Reads the subject_test.txt and assigns a variable "key" to be able to merge with all the files of the test data
2) Reads the file y_test.txt and assigns a variable "key" as well as converts the activity_level into a factor with its corresponding labels
3) Reads the X_test.txt data, assigns the variable "key" and names the variables using the features.txt data
4) For the sets of files total_acc_xyz_test.txt, body_acc_xyz_test.txt and body_gyro_x,y,z_test.txt the script reads the files, assigns a variable "key" and renames the variables by concatenating the prefix, for example, total_acc_x with the variable number 1:128
5) The scripts merges all the data sets into one consolidated test data called testData





