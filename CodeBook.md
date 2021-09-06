The run_analysis.R script helps us make the data tidy for analysis by following the 5 required steps.

First of all we download the data set and then unzip it under the folder called UCI HAR Dataset.

Also, assign each data to variables
features <- features.txt : 561 rows, 2 columns
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
activities <- activity_labels.txt : 6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its codes (labels)
subject_test <- test/subject_test.txt : 2947 rows, 1 column
contains test data of 9/30 volunteer test subjects being observed
x_test <- test/X_test.txt : 2947 rows, 561 columns
contains recorded features test data
y_test <- test/y_test.txt : 2947 rows, 1 columns
contains test data of activities’code labels
subject_train <- test/subject_train.txt : 7352 rows, 1 column
contains train data of 21/30 volunteer subjects being observed
x_train <- test/X_train.txt : 7352 rows, 561 columns
contains recorded features train data
y_train <- test/y_train.txt : 7352 rows, 1 columns
contains train data of activities’code labels

Then we perform the following steps:

1. Merging test and train data sets:
subject_data (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function
x_data (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
y_data (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
data (10299 rows, 563 column) is created by merging subject_data, y_data and x_data using cbind() function

2. Extract measurements on the mean and standard deviation for each measurement:
tidy_data (10299 rows, 88 columns) is created by subsetting data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

3. Use descriptive activity names:
Numbers in code column of the tidy_Data are replaced with corresponding activity taken from second column of the activities variable

4. Label the data set with descriptive variable names:
a) code column in tidy_data is renamed into activities
b) All Acc in column’s name replaced by Accelerometer
c) All Gyro in column’s name replaced by Gyroscope
d) All BodyBody in column’s name replaced by Body
e) All Mag in column’s name replaced by Magnitude
f) All start with character f in column’s name replaced by Frequency
g) All start with character t in column’s name replaced by Time

5. Create a new independent tidy data set with the average of each variable for each activity and each subject:
prepared_data (180 rows, 88 columns) is created by sumarizing tidy_data taking the means of each variable for each activity and each subject, after groupped by subject and activity.

Export prepared_data into data.txt file.