library(readr)
library(dplyr)
library(tidyr)

##Read the activity labels file
##Set working directory
setwd("C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/dataset")
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("no", "labels")

##Read the features file
features <- read.table("features.txt")
names(features) <- c("no", "full_function")


##Read the training dataset
##Reset working directory
setwd("C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/dataset/train")
subject_train <- read.table("subject_train.txt")
names(subject_train) <- c("subject")
train_set <- read.table("X_train.txt")
names(train_set) <- features$full_function
train_label <- read.table("y_train.txt")
names(train_label) <- c("label")

##Combine the 3 files
train <- cbind(subject_train, train_label, train_set, dataset = rep("train", 7352))
for(i in 1:6){
        train$label <- sub(pattern = i, replacement = activity_labels[i, 2], x = train$label)
}


##combine the Inertial Signals files
index_train_inter_Sig <- dir(path = "C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/dataset/train/Inertial Signals", pattern = ".txt")
index_train_inter_Sig <- gsub(".txt", "", index_train_inter_Sig)
train_internal_signals <- cbind(body_acc_x_train, body_acc_y_train, body_acc_z_train, body_gyro_x_train,body_gyro_y_train, body_gyro_z_train, total_acc_x_train, total_acc_y_train, total_acc_z_train)



##Read the testing dataset
##Reset working directory
setwd("C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/dataset/test")
subject_test <- read.table("subject_test.txt")
names(subject_test) <- c("subject")
test_set <- read.table("X_test.txt")
names(test_set) <- features$full_function
test_label <- read.table("y_test.txt")
names(test_label) <- c("label")

##Combine the 3 files
test <- cbind(subject_test, test_label, test_set, dataset = rep("test", 2947))
for(i in 1:6){
        test$label <- sub(pattern = i, replacement = activity_labels[i, 2], x = test$label)
}


##combine the Inertial Signals files
index_test_inter_Sig <- dir(path = "C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/dataset/test/Inertial Signals", pattern = ".txt")
index_test_inter_Sig <- gsub(".txt", "", index_test_inter_Sig)
test_internal_signals <- cbind(body_acc_x_test, body_acc_y_test, body_acc_z_test, body_gyro_x_test,body_gyro_y_test, body_gyro_z_test, total_acc_x_test, total_acc_y_test, total_acc_z_test)



##Combine the test and train dataset.
train_test <- rbind(train, test)



##Extracts only the measurements on the mean and standard deviation for each measurement.
train_test_select <- train_test[,grep("subject|label|mean|std", names(train_test))]



## creates a second, independent tidy data set with the average of each variable for each activity and each subject.
train_test_select_group <- train_test_select %>% group_by(subject, label) %>% summarise_all(funs(mean))


##Output the required data.frame.
write.table(train_test_select_group, file = "C:/Users/sunxi/Coursera/Data_Science/3-week4/Project/train_test_select_group.txt", row.names = FALSE)