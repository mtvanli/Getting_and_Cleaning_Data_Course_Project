run_analysis <- function(){
    
    ## Tasks:
    # Merge the training and the test sets to create one data set.
    # Extract only the measurements on the mean and standard deviation 
    # for each measurement. 
    # Use descriptive activity names to name the activities in the data set
    # Appropriately labels the data set with descriptive activity names. 
    # Create a second, independent tidy data set 
    # with the average of each variable for each activity and each subject. 
    
    
    ## The working directory must include the UCI HAR Dataset (Samsung Data)
    
    # Read Tables
    
    ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header=F)
    
    Features <- read.table("UCI HAR Dataset/features.txt", header=F)
    
    X_train <- read.table("UCI HAR Dataset/train/X_train.txt",header=F)
    
    y_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=F) 
    
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=F)
    
    X_test  <- read.table("UCI HAR Dataset/test/X_test.txt",header=F)
    
    y_test  <- read.table("UCI HAR Dataset/test/y_test.txt",header=F)
    
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=F)
      
    # Extract column names
    colnames(X_train) <- Features$V2
    colnames(X_test)  <- Features$V2
     
    # Use descriptive activity names to name the activities in the data set
    y_train <- merge(y_train,ActivityLabels)[2]
    y_test <- merge(y_test,ActivityLabels)[2]
    
    # Merge the training and the test sets to create one data set.
    train_Merged <- cbind(X_train,y_train,subject_train)
    test_Merged  <- cbind(X_test,y_test, subject_test)
    mergedData <- rbind( train_Merged, test_Merged)
    
    # Appropriately label the data set 
    colnames(mergedData)[562] <- "Activity"
    colnames(mergedData)[563] <- "Subject"
    
    # Extract only the measurements on the mean and standard deviation 
    # for each measurement.
    MeanStdColumns  <- grep("mean\\(\\)|std\\(\\)", Features$V2)
    MeanStdValues   <- mergedData[c(MeanStdColumns, 562, 563)]
    
    # Clear brackets ()  from the column names. 
    # I think they make the text look messy
    colnames(MeanStdValues)<- gsub("\\()", "", colnames(MeanStdValues))
    
    # Create a tidy data set
    tidyDataSet <- aggregate(. ~ Activity+Subject, data = MeanStdValues, mean)
    write.table( tidyDataSet, file="tidyDataSet.txt", row.names=FALSE)
    
    
}