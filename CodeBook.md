CodeBook for the R script run_analysis.R

Main Variables and data:

testData : test data read from X_test.txt
trainData : train data read from X_train.txt
mergedData : result of merging testData and trainData by rbind function
v_feature : feature vector read from feather.txt
col_meanstd : mean and std column number by using grep function on v_feature
transActData : translated activity data by using activity_lables.txt
extData : extracted data with mean/std variables , activity and subject
meltResult : the result of melt extData by activity and subject
result : the final tidy result to write out


Main step:

1.Use rbind func to merge test and train data set.
2.Extract mean and std column by using grep func.
3.Append translated activity column to data set.
4.Append subject column
5.Get the tidy result using melt and dcast function.
6.Output the result to text file without row names.
