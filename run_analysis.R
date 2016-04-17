library(plyr)

# assigning train and test data into new variable

datatrain_x <- read.table("./train/X_train.txt")
datatest_x <- read.table("./test/X_test.txt")
datatrain_y <- read.table("./train/y_train.txt")
datatest_y <- read.table("./test/y_test.txt")
datasubject_train <- read.table("./train/subject_train.txt")
datasubject_test <- read.table("./test/subject_test.txt")

# combining all x, y and subject into single variable
the_x <- rbind(datatrain_x, datatest_x)
the_y <- rbind(datatrain_y, datatest_y)
the_subject <- rbind(datasubject_train, datasubject_test)


# Extracting measurements of mean and standard deviation
act <- read.table("features.txt")
mean_and_std <- grep("-(mean|std)\\(\\)", act[, 2])

# assigning subset to columns for data x
the_x <- the_x[, mean_and_std]

# column names for data x
names(the_x) <- act[mean_and_std, 2]

# descriptive activity names to name the activities as in data label
moves <- read.table("activity_labels.txt")

# update values with correct activity names
the_y[, 1] <- moves[the_y[, 1], 2]

# column name
names(the_y) <- "activity"


# label the data set with descriptive variable names
names(the_subject) <- "subject"

# combine all the data in a one unit data set
combo_data <- cbind(the_x, the_y, the_subject)


# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

make_averages <- ddply(combo_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(make_averages, "combine_averages.txt", row.name=FALSE)