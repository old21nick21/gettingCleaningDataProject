## Script for the data tranformation for Getting and Cleaning Data course project

## Set the working directory

setwd("~/R/UCI HAR Dataset");

#### Read the source table (not all, but only relevant ones)

## a. training values
x_train <- read.table("train/X_train.txt");


y_train <- read.table("train/y_train.txt");

subject_train <- read.table("train/subject_train.txt");
  1

## b. test values
x_test <- read.table("test/X_test.txt");

y_test <- read.table("test/y_test.txt")

subject_test <- read.table("test/subject_test.txt")
    1

#### Combine the training and test values into common dataset
x_common <- rbind(x_train, x_test)

y_common <- rbind(y_train, y_test)

subject_common <- rbind(subject_train, subject_test)
    1

#### get the values for the features, and extract only mean and standard deviation values
features <- read.table("features.txt")



library(plyr)
##Warning message:
##package ‘plyr’ was built under R version 3.1.2 

## this works only with plyr package
features_mean_std <- grep("-(mean|std)\\(\\)", features[, 2])


## mean and std are applied to x values
x_common <- x_common[, features_mean_std]


## modify the column names for x data
names(x_common) <- features[features_mean_std, 2]

## modify the column names for y data
activity_labels <- read.table("activity_labels.txt")
y_common[, 1] <- activity_labels[y_common[, 1], 2]
names(y_common) <- "activities"
names(subject_common) <- "subjects"

## Combine x, y, and subject columns in new dataset
total_data <- cbind(x_common, y_common, subject_common)

## Create new dataset for aggregate functions
averages_common <- ddply(total_data, .(subjects, activities), function(x) colMeans(x[, 1:66]))

## Export new dataset into the text file "averages_common.txt"
write.table(averages_common, "averages_common.txt", row.name=FALSE)
