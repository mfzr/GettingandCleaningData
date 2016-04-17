# Code Book#

'run_analysis.R' will load data from UCI HAR Dataset folder then clean data set into specific format. In the end, will generate independent tidy data set with the average of each variable for each activity and each subject.

## Variable ##

* 'datatrain_x', 'datatest_x', 'datatrain_y', 'datatest_y', 'datasubject_train', 'datasubject_test' variable for data loaded from UCI HAR Dataset folder 
* 'the_x' represent combination of data in x_train and x_test file
* 'the_y' represent combination of data in y_train and y_test file
* 'the_subject' represent subject_train and subject_test file
* 'act' represent file loaded from features.txt
* 'mean_and_std' is to extract measturement of mean and standard deviation
* 'moves' represent label loaded from activity_label.txt
* 'make_averages' represent tidy data set with the average of each variable for each activity and each subject

## Result ##

average of each variable will display in 'combine_averages.txt' 