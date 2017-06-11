# get the list of files
files<-list.files("UCI HAR Dataset", recursive=TRUE)
files

#------------------------------------------------------------------------------

# Step 1 
# Merges the training and the test sets to create one data set.

# Read data from the files into the variables
dataActivityTest  <- read.table(file.path("UCI HAR Dataset", "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain  <- read.table(file.path("UCI HAR Dataset", "train" , "Y_train.txt" ),header = FALSE)
dataSubjectTrain <- read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt"),header = FALSE)
dataSubjectTest <- read.table(file.path("UCI HAR Dataset", "test", "subject_test.txt"),header = FALSE)
dataFeaturesTest  <- read.table(file.path("UCI HAR Dataset", "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain  <- read.table(file.path("UCI HAR Dataset", "train" , "X_train.txt" ),header = FALSE)

str(dataActivityTest)
str(dataActivityTrain)

# Merges the training and test data
# Concatanate the data tables by rows
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataSubject<- rbind(dataSubjectTrain, dataSubjectTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

# Set names to variables
names(dataSubject)<-c("subject")
names(dataActivity)<-c("activity")
dataFeaturesNames <- read.table(file.path("UCI HAR Dataset","features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

# Merge columns to get the data frame
data_S_A <- cbind(dataSubject,dataActivity)
Data <- cbind(data_S_A,dataFeatures)

# -----------------------------------------------------------------------------

# Step 2
# Extracts only the measurements on the mean and standard deviation for each measurement.

mean_std_FeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
str(mean_std_FeaturesNames)
Q2subsetNames <- c("subject","activity",as.character(mean_std_FeaturesNames))
Q2subsetData <- subset(Data,select = Q2subsetNames)
str(Q2subsetData)

# ------------------------------------------------------------------------------

# Step 3
# Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"),header = FALSE)
Q2subsetData$activity <- factor(Q2subsetData$activity, labels = as.character(activityLabels$V2))
head(Q2subsetData$activity,50)

# -------------------------------------------------------------------------------

# Step 4
# Appropriately labels the data set with descriptive variable names.
        # t is replaced by time
        # Acc is replaced by Accelerometer
        # Gyro is replaced by Gyroscope
        # f is replaced by frequency
        # Mag is replaced by Magnitude
        # BodyBody is replaced by Body

names(Q2subsetData)<-gsub("^t", "time", names(Q2subsetData))
names(Q2subsetData)<-gsub("Acc", "Accelerometer", names(Q2subsetData))
names(Q2subsetData)<-gsub("Gyro", "Gyroscope", names(Q2subsetData))
names(Q2subsetData)<-gsub("^f", "frequency", names(Q2subsetData))
names(Q2subsetData)<-gsub("Mag", "Magnitude", names(Q2subsetData))
names(Q2subsetData)<-gsub("BodyBody", "Body", names(Q2subsetData))

names(Q2subsetData)

# -------------------------------------------------------------------------------

# Step 5
# From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.

library(dplyr)
?aggregate
Q5Data <-aggregate(. ~subject + activity, Q2subsetData, mean)
Q5Data<-Q5Data[order(Q5Data$subject,Q5Data$activity),]
write.table(Q5Data, file = "tidydata.txt",row.name=FALSE)



