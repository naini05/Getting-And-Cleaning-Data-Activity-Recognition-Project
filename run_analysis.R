rm(list=ls(all=TRUE))

feature = read.table("features.txt")
activity_label = read.table("activity_labels.txt")

subject_test = read.table(".\test\subject_test.txt")
x_test = read.table("./test/x_test.txt")
y_test = read.table("./test/y_test.txt")

subject_train = read.table("./train/subject_train.txt")
x_train = read.table("./test/x_train.txt")
y_train = read.table("./train/y_train.txt")

features <- feature[["V2"]]
features <- as.character(features)

names(subject_test) <- c("subject")
names(y_test) <- c("activity")
names(x_test) <- features

y_subject_test <- cbind(y_test, subject_test)
test <- cbind(y_subject_test, x_test)

names(subject_train) <- c("subject")
names(y_train) <- c("activity")
names(x_train) <- features

y_subject_train <- cbind(y_train, subject_train)
train <- cbind(y_subject_train,x_train)

data <- rbind(test, train)
selecteddata <- data[,c(1,2,which(grepl("(*mean\\(\\)*|*std\\(\\)*)", colnames(data))))]

library(plyr)

activity_names <- activity_label[["V2"]]
activity_labels <- activity_label[["V1"]]
activity_names <- as.character(activity_names)
activity_labels <- as.character(activity_labels)
selecteddata$activity <- mapvalues(selecteddata$activity, activity_labels, activity_names)

selecteddataMelt <- melt(selecteddata, id = c("activity", "subject"))
finalData <- dcast(selecteddataMelt, activity~variable, mean)

write.table(finalData, file = "./activityRecognitionDataset.txt", row.names = FALSE)
