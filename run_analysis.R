#set working directory to the "UCI HAR Dataset" directory
setwd("./UCI HAR Dataset")

#######read data into data tables
#'features.txt': List of all features. - 561 observations 
dt_features <- read.table("features.txt", header=FALSE, stringsAsFactors=FALSE)
#- 'activity_labels.txt': Links the class labels with their activity name - 6 rows
dt_activity <- read.table("activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)
#'train/X_train.txt': Training set -  7352 obs
dt_xtrain <- read.table("./train/X_train.txt", header=FALSE, stringsAsFactors=FALSE)
#'train/y_train.txt': Training labels - 7352 obs
dt_ytrain <- read.table("./train/y_train.txt", header=FALSE, stringsAsFactors=FALSE,col.names=c("activity"))
#'test/X_test.txt': Test - 2947 obs
dt_xtest <- read.table("./test/X_test.txt", header=FALSE, stringsAsFactors=FALSE)
#'test/y_test.txt': Test labels. - 2947 obs
dt_ytest <- read.table("./test/y_test.txt", header=FALSE, stringsAsFactors=FALSE,col.names=c("activity"))
#'train/subject_train.txt': Each row identifies the subject who performed the 
#'activity for each window sample. Its range is from 1 to 30. - 7352 obs.
dt_subj_train <- read.table("./train/subject_train.txt", header=FALSE, stringsAsFactors=FALSE, col.names=c("subject"))
#'test/subject_test.txt': Each row identifies the subject who performed the 
#'activity for each window sample. Its range is from 1 to 30. - 2947 obs.
dt_subj_test <- read.table("./test/subject_test.txt", header=FALSE, stringsAsFactors=FALSE, col.names=c("subject"))

#add activity and subject to train and test data
dt_xtrain<-cbind(dt_ytrain,dt_subj_train,dt_xtrain)
dt_xtest<-cbind(dt_ytest,dt_subj_test,dt_xtest)

#Merges the training and the test sets to create one data set.
dt_all<-rbind(dt_xtrain,dt_xtest)

#Extracts only the measurements on the mean and standard deviation for each measurement.
dt_all_extract<-dt_all[,c(1:2,grep('(mean|std)',dt_features[,2])+2)]
dt_features_extract <-dt_features[c(grep('(mean|std)',dt_features[,2])),2]

#Uses descriptive activity names to name the activities in the data set
dt_all_extract$activity<-as.factor(dt_all_extract$activity)
levels(dt_all_extract$activity)<-dt_activity$V2

#Appropriately labels the data set with descriptive variable names.
#assign names to variables; this is in dt_features_extract
names(dt_all_extract)=c("activity","subject", dt_features_extract)

#From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
dt_tidy <- ddply(dt_all_extract,.(activity,subject), summarize, Mean=colMeans(dt_all_extract[3:length(names(dt_all_extract))]))

#compute the number of repetitions of feature names, create a vector and insert that 
#as column in the tidy data table
num_distinct_feature_subj <- nrow(distinct(dt_all_extract,activity,subject))
dt_tidy_act_names<-rep(names(dt_all_extract[,3:(length(names(dt_all_extract)))]),num_distinct_feature_subj)
dt_tidy$Summarizedfeature<-dt_tidy_act_names

#write the tidy data table to a text file
write.table(dt_tidy, "tidy.txt",row.names=FALSE)