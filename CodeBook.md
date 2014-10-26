CodeBook for the R script run_analysis.R

Main Variables and data:

testData : test data read from X_test.txt<br>
trainData : train data read from X_train.txt<br>
mergedData : result of merging testData and trainData by rbind function<br>
v_feature : feature vector read from feather.txt<br>
col_meanstd : mean and std column number by using grep function on v_feature<br>
transActData : translated activity data by using activity_lables.txt<br>
extData : extracted data with mean/std variables , activity and subject<br>
meltResult : the result of melt extData by activity and subject<br>
result : the final tidy result to write out


Main step:

1.Use rbind func to merge test and train data set.<br>
2.Extract mean and std column by using grep func.<br>
3.Append translated activity column to data set.<br>
4.Append subject column.<br>
5.Get the tidy result using melt and dcast function.<br>
6.Output the result to text file without row names.
