

## zip archive with data to process s
zipFile = 'getdata-projectfiles-UCI HAR Dataset.zip'
if(!file.exists(zipFile)){
    stop(paste(zipFile, ' data archive can\'t be found'))
}

#unzip(zipFile)
setwd('UCI HAR Dataset')

x_train <- read.table('train/X_train.txt')
x_test <- read.table('test/X_test.txt')
y_train <- read.table('train/y_train.txt')
y_test <- read.table('test/y_test.txt')
subject_train <- read.table('train/subject_train.txt')
subject_test <- read.table('test/subject_test.txt')

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

features <-read.table('features.txt', stringsAsFactors=FALSE)
names(x) <- features[[2]]
mean_std <- grep('-mean\\(\\)|-std\\(\\)', features[[2]])

names(subject) <- 'Subject'

labels <- read.table('activity_labels.txt')
activity <- labels[y[[1]], 2]
names(activity) <- 'Activity'

result <- cbind(subject, activity, x[, mean_std])

library(data.table)
group <- c('Subject', 'Activity')
tidy <- dt[, lapply(.SD, mean), by=group, .SDcols=3:68]

setwd('..')

write.table(result, 'mean_std_data.txt', quote=FALSE)
write.table(tidy, 'average_data.txt', quote=FALSE)
