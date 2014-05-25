run_analysis <- function(){
    
    ## Tasks:
    # Merge the training and the test sets to create one data set.
    # Extract only the measurements on the mean and standard deviation 
    # for each measurement. 
    # Use descriptive activity names to name the activities in the data set
    # Appropriately labels the data set with descriptive activity names. 
    # Create a second, independent tidy data set 
    # with the average of each variable for each activity and each subject. 
    
    
    ## The working directory must include the Samsung Data
    
    # Read Tables
    
    ActivityLabels <- read.table("activity_labels.txt", header=F)
    
    Features <- read.table("features.txt", header=F)
    
    X_train <- read.table("train/X_train.txt",header=F)
    
    y_train <- read.table("train/y_train.txt",header=F) 
    
    subject_train <- read.table("train/subject_train.txt",header=F)
    
    X_test  <- read.table("test/X_test.txt",header=F)
    
    y_test  <- read.table("test/y_test.txt",header=F)
    
    subject_test <- read.table("test/subject_test.txt",header=F)
      
    # Extract column names
    colnames(X_train) <- Features$V2
    colnames(X_test)  <- Features$V2
    
    # Merge the training and the test sets to create one data set.
    train_Merged <- cbind(X_train,y_train,subject_train)
    test_Merged  <- cbind(X_test,y_test, subject_test)
    mergedData <- rbind( train_Merged, test_Merged)
    
    # Appropriately label the data set 
    # Use descriptive activity names to name the activities in the data set
    colnames(mergedData)[563] <- "Subject" 
    mergedData<-merge(mergedData,ActivityLabels)
    mergedData<-mergedData[-1]
    colnames(mergedData)[563] <- "Activity"
    
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