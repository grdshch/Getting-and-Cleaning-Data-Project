## Getting and Cleaning Data Project
## Full description of the data:
##   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## The data:
##   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## zip archive with data to process
zipFile = 'getdata-projectfiles-UCI HAR Dataset.zip'
if(!file.exists(zipFile)){
    stop(paste(zipFile, ' data archive can\'t be found'))
}
unzip(zipFile)
setwd('UCI HAR Dataset')

## loading train and test data
x_train <- read.table('train/X_train.txt')
x_test <- read.table('test/X_test.txt')
y_train <- read.table('train/y_train.txt')
y_test <- read.table('test/y_test.txt')
subject_train <- read.table('train/subject_train.txt')
subject_test <- read.table('test/subject_test.txt')

## merging train and test data
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
names(subject) <- 'Subject'

## loading feature names and selecting mean and std from them
features <- read.table('features.txt', stringsAsFactors=FALSE)
names(x) <- features[[2]]
mean_std <- grep('-mean\\(\\)|-std\\(\\)', features[[2]])

## getting activity labels for the data set
labels <- read.table('activity_labels.txt')
activity <- data.frame(labels[y[[1]], 2])
names(activity) <- 'Activity'

## adding subject and activity labels to mean and std data set
result <- cbind(subject, activity, x[, mean_std])

## calculating average values for subjects and activities
library(data.table)
group <- c('Subject', 'Activity')
dt <- data.table(result)
tidy <- dt[, lapply(.SD, mean), by=group, .SDcols=3:68]

setwd('..')

## writing results
write.table(result, 'mean_std_data.txt', quote=FALSE)
write.table(tidy, 'average_data.txt', quote=FALSE)
