## Step - 1 Merging test and train data sets
subject_data <- rbind(subject_test, subject_train)
x_data <- rbind(x_test,x_train)
y_data <- rbind(y_test,y_train)
data <- cbind(subject_data,x_data,y_data)

## Step - 2 Extract measurements on the mean and standard deviation for each measurement
tidy_data <- data %>% select(subject, code, contains("mean"), contains("std"))

## Step - 3 Use descriptive activity names
tidy_data$code <- activities[tidy_data$code, 2]

## Step - 4 Label the data set with descriptive variable names
names(tidy_data)[2] = "activity"
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data)<-gsub("^t", "Time", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))
names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))

## Step - 5 Create a new independent tidy data set with the average of each variable for each activity and each subject
prepared_data <- tidy_data %>% group_by(subject, activity) %>% summarise_all(mean)

## Export Prepared Data
write.table(prepared_data, "data.txt", row.name = FALSE)
