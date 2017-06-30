##1st, Read the "activity_labels.txt" into a data.frame called "activity_labels". Renamed the column name.
##no, the mark of the test taken.
##labels, the name of the test taken.

##2nd, Read the "features.txt" into a data.frame called "features". Renamed the column name.
##no, frequency numbers.
##full_function, the transformation used to clean up the data.

##3rd, Read the "subject_train.txt" into a data.frame called "subject_train". Renamed the column name.
##subject, identify the people who take the test.

##4th, Read the "X_train.txt" into a data.frame called "X_train". Record the test result of each subject who take the test.

##5th, Read the "y_train.txt" into a data.frame called "y_train". Renamed the column name.
##label, the mark of the test taken.

##6th, combine the data.frame from step 3-5, add a new variable "dataset", and replace the mark of the test taken with their names.
##dataset, mark the data source is from train or test.

##7th, follow the same procedure(step 3-6) in cleanning up the data of test.

##8th, Combine the test and train dataset by rows, and save the result to "train_test".

##9th, Extracts only the measurements on the mean and standard deviation for each measurement, and save the result to "train_test_select".

##10th, creates a second, independent tidy data set with the average of each variable for each activity and each subject, and save the result to "train_test_select_group".