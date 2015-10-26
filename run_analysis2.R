# Reading training data 
X_train<- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train<- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
train_subj<- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")

# Reading test data
X_test<- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test<- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
test_subj<- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")


feature<- read.table ("./UCI HAR Dataset/features.txt")
activity<- read.table("./UCI HAR Dataset/activity_labels.txt")

#Merging train and test data
X_data<- rbind(X_train, X_test)
Y_data<- rbind(Y_train, Y_test)
subj_data<- rbind(test_subj, train_subj)

# Extracting the mean and standard deviation measurement
mean_std<- grep("-mean\\(\\)|-std\\(\\)", feature[,2])
X_data<- X_data[,mean_std]


# Making descreptive activity names
Y_data[,1] <-  activity[Y_data[,1], 2]

# Making descriptive variable names

names(X_data)<- feature[mean_std, 2]
Data<- cbind (subj_data, Y_data, X_data)

write.table(Data, "clean_data.txt", row.names = F)




