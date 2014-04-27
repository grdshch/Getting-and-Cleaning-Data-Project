Getting and Cleaning Data Project
=================================

### How to use the script
1. Download the data archive from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Put the archive into directory with run_analysis.R script
3. Set working directory in R to the directory with the data and the script
4. Run the script - source('run_analysis.R')

### Getting the result data sets
The result of running the script is 2 data files:
* mean_std_data.txt - file with mean and std data with descriptive labels
* average_data.txt - file with average data for different subjects and activities
Files are created in the same directory with the script and the data archive.

### Data transformations
CodeBook.md file contains datailed description of all data transformations performed by the script.