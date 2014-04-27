Getting and Cleaning Data Project Code Book
========================================================

### Getting data
* The data is downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The full description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Loading and merging data
* Data loaded from 'train/X_train.txt' and 'test/X_test.txt' is merged to 'X' data frame (10299 x 561).
* Data loaded from 'train/y_train.txt' and 'test/y_test.txt' is merged to 'y' data frame (10299 x 1).
* Data loaded from 'train/subject_train.txt' and 'test/subject_test.txt' is merged to 'subject' data frame (10299 x 1).

### Cleaning data
* Feature names are loaded from 'features.txt' file and put to 'features' data frame (561 x 2).
* The list of indices of mean() and std() features are extracted from 'features' data frame and put to 'mean_std' list (int [1:66]).

### Getting the first result data set
* Activity labels are loaded from 'activity_labels.txt' file and put to 'labels' data frame( 6 x 2).
* Data from 'subject', 'activity' and columns from 'x' specified by 'mean_std' indices are merged into 'result' data frame (10299 x 68) which is written to 'mean_std_data.txt' result file.

### Getting the second result data set
'dt' data table is created from the first result data set. Mean data of all variables are calculated using subset of data table, grouping by 'Subject' and 'Activity' columns and applying 'mean' function.
The result is put into 'tidy' data frame (180 x 68) which is written to 'average_data.txt' result file.

### Format of result files
* Result files have a header with feature names and index column for observations.
* Data is separated by spaces, strings are put without quotes.
