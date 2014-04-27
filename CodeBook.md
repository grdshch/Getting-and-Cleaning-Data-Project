Getting and Cleaning Data Project Code Book
========================================================

### Getting data
The data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br/>
The full description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Loading and merging data
Data loaded from <i>train/X_train.txt</i> and <i>test/X_test.txt</i> is merged to <b>x</b> data frame (10299 x 561).<br/>
Data loaded from <i>train/y_train.txt</i> and <i>test/y_test.txt</i> is merged to <b>y</b> data frame (10299 x 1).<br/>
Data loaded from <i>train/subject_train.txt</i> and <i>test/subject_test.txt</i> is merged to <b>subject</b> data frame (10299 x 1).<br/>

### Cleaning data
Feature names are loaded from <i>features.txt</i> file and put to <b>features</b> data frame (561 x 2).<br/>
The list of indices of mean() and std() features (which names contain '-mean()' or '-std()') are extracted from <b>features</b> data frame and put to <b>mean_std</b> list (int [1:66]).<br/>

### Getting the first result data set
Activity labels are loaded from <i>activity_labels.txt</i> file and put to <b>labels</b> data frame( 6 x 2).<br/>
Data from <b>subject</b>, <b>activity</b> and columns from <b>x</b> specified by <b>mean_std</b> indices are merged into <b>result</b> data frame (10299 x 68) which is written to <b><i>mean_std_data.txt</i></b> result file.<br/>

### Getting the second result data set
<b>dt</b> data table is created from the first result data set. Mean data of all variables are calculated using subset of data table, grouping by 'Subject' and 'Activity' columns and applying <b>mean</b> function.<br/>
The result is put into <b>tidy</b> data frame (180 x 68) which is written to <b><i>average_data.txt</i></b> result file.<br/>

### Format of result files
Result files have a header with feature names and index column for observations.<br/>
Data is separated by spaces. Strings are put without quotes.<br/>
The full description of all features can be found in <i>features_info.txt</i> original data file.
