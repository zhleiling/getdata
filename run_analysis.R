#merges the test and training set
library(plyr)
library(reshape2)

setwd("D:/Rworkspace/getting-and- cleaning-data/Course Project");

testFile <- "./UCI HAR Dataset/test/X_test.txt"
testData <- read.csv(testFile, header = FALSE, sep = "", )
trainFile <- "./UCI HAR Dataset/train/X_train.txt"
trainData <- read.csv(trainFile, header = FALSE, sep = "")

mergedData <- rbind(testData, trainData)
#extract mean and stddev
feature <- read.csv("./UCI HAR Dataset/features.txt", header = FALSE, sep = "", stringsAsFactor = FALSE)
v_feature <- feature[,2]
col_meanstd <- grep("-(mean|std)\\(\\)-?", v_feature)
v_feature <- gsub("\\(\\)", "", v_feature)
v_feature <- gsub("-mean", "Mean", v_feature)
v_feature <- gsub("-std", "Std", v_feature)
v_feature <- gsub("-", "", v_feature)
names(mergedData) <- v_feature
extData <- mergedData[,col_meanstd]

#append activity column
testActFile <- "./UCI HAR Dataset/test/y_test.txt"
testActData <- read.csv(testActFile, header = FALSE, sep = "", )
trainActFile <- "./UCI HAR Dataset/train/y_train.txt"
trainActData <- read.csv(trainActFile, header = FALSE, sep = "")

mergedActData = rbind(testActData, trainActData)
names(mergedActData) <- "activity"

labelDic <- read.csv("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "")
names(labelDic) <- c("activity","desc")

transActData <- join(mergedActData, labelDic, by = "activity")
extData <- cbind(extData, transActData$desc)
names(extData)[length(names(extData))] <- "activity"

# append subject column
testSubFile <- "./UCI HAR Dataset/test/subject_test.txt"
testSubData <- read.csv(testSubFile, header = FALSE, sep = "", )
trainSubFile <- "./UCI HAR Dataset/train/subject_train.txt"
trainSubData <- read.csv(trainSubFile, header = FALSE, sep = "")

mergedSubData <- rbind(testSubData, trainSubData)
names(mergedSubData) <- "subject"

extData <- cbind(extData, mergedSubData)

#summerize the data set using melt and dcast
meltResult <- melt(extData, id.vars = c("subject","activity"))
result <- dcast(meltResult, subject + activity ~ variable, fun = mean)

# write to file
write.table(result, file = "./tidy_result.txt",row.names = FALSE)
