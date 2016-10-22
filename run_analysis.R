#Getting and Cleaning Data Course Project
library(data.table)
library(reshape2)

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, "dataset.zip")
unzip("dataset.zip")

#importing data:
features <- fread("UCI HAR Dataset/features.txt")[[2]]
X_train <- fread("UCI HAR Dataset/train/X_train.txt")
Y_train <- fread("UCI HAR Dataset/train/y_train.txt")
train_sub <- fread("UCI HAR Dataset/train/subject_train.txt")
X_test <- fread("UCI HAR Dataset/test/X_test.txt")
Y_test <- fread("UCI HAR Dataset/test/y_test.txt")
test_sub <- fread("UCI HAR Dataset/test/subject_test.txt")
activity_labels <-  fread("UCI HAR Dataset/activity_labels.txt")

#selecting mean and Std variables from features
sel_features <- grep("mean|std", features)
features <-  features[sel_features]

#cleaning features object:
features <- gsub("[-(),]","",features)
features <- gsub("mean","Mean",features)
features <- gsub("std","Std",features)

### Preparing train and test datasets: 
#estracting mean and Std columns from train and test
X_train <- X_train[, sel_features, with = FALSE]
X_train <- cbind(Subject = train_sub, X_train, act = Y_train)
X_test <- X_test[, sel_features, with = FALSE]
X_test <- cbind(Subject = test_sub,X_test, act = Y_test)

#Combining train and test:
dall <- rbind(X_train,X_test)

#Assigning col names:
names(dall) <- c("Subject",features,"activitylabels")

#assiging labels to activityl lables:
dall$activitylabels <- factor(dall$activitylabels,levels = c(1:6),
                              labels = activity_labels[[2]])

# Independent tidy data set with the average of each variable
meltdata <-  melt(dall, id = c("Subject", "activitylabels"))

# Apply mean function using dcast function
tidydata  <-  dcast(meltdata, Subject + activitylabels ~ variable, mean)

#writing tidydata:
write.table(tidydata, file = "./tidy.txt")