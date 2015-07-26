
dataDir <- "UCI HAR Dataset"

runAnalysis <- function () {
    ## Coursera "Getting and Cleaning Data" course project script file
    ##
    ## 
    ## 
    ## 1. Merges the training and the test sets to create one data set.
    ## 2. Extracts only the measurements on the mean and standard deviation for 
    ##      each measurement. 
    ## 3. Uses descriptive activity names to name the activities in the data set
    ## 4. Appropriately labels the data set with descriptive variable names. 
    ## 5. From the data set in step 4, creates a second, independent tidy data 
    ##      set with the average of each variable for each activity and each 
    ##      subject


    frameList <- loadData()
    tidyData1 <- createTidyDataSet1 (frameList)
    tidyData2 <- createTidyDataSet2 (tidyData1)
    write.table(tidyData2,"tidyData.txt",row.names=FALSE)
    
}
     
createTidyDataSet1 <- function(frameList) {
    ## reduces the data frame "rawData" to only the mean and standard deviation 
    ## values and adds descriptive labels to each column
    
    # read in measurement labels of interest and their "tidy" (human readable) 
    # translations
    tidyLabels <- read.csv("TidyLabels.csv",stringsAsFactors=FALSE)
    
    #create a mapping of raw labels and id's to new labels
    labelLookup <- merge(tidyLabels, 
                         frameList$Labels, 
                         by.x="SourceLabel", 
                         by.y="MeasurementLabel")
    
    # extract only the measurements of interest
    tidyData <- select(frameList$Data,labelLookup$MeasurementId)
        
    # replace existing measurement labels with new labels
    names(tidyData) <- labelLookup$NewLabel
    
    #create a column of activity names
    activities <- merge(frameList$Activities, frameList$ActivityLabels)
    
    #return the tidy data frame
    cbind(Activity=activities$ActivityLabel,frameList$Subjects,tidyData)

    
}

createTidyDataSet2 <- function(tidyData1) {
    ## creates 
    tidyData2 <- group_by(tidyData1,Activity,SubjectId)
    tidyData2 <- summarise_each(tidyData2,funs(mean))
    tidyData2 <- arrange(tidyData2,Activity,SubjectId)
}

loadData <- function() {
    curPath = getwd()
    setwd(dataDir)

    # read in the table of measurement labels and index values
    labels <- read.table("features.txt",sep="",col.names=c("MeasurementId",
                                                           "MeasurementLabel"))

    # read in the table of activity labels and index values
    activityLabels <- read.table("activity_labels.txt",sep="",col.names=c("ActivityId",
                                                        "ActivityLabel"))
    
    ## Read Test Data
    setwd("test")
    
    testData = read.table("X_test.txt",sep="")
    testActivityIds = read.table("y_test.txt",sep="")
    testSubjectIds = read.table("subject_test.txt",sep="")
 
    ## Read Training Data
    setwd("../train")
    
    trainData = read.table("X_train.txt",sep="")
    trainActivityIds = read.table("y_train.txt",sep="")
    trainSubjectIds = read.table("subject_train.txt",sep="")
    
    ## merge the datasets
    rawData = rbind(testData,trainData)
    activities = rbind(testActivityIds,trainActivityIds)
    subjects = rbind(testSubjectIds,trainSubjectIds)
    
    names(activities) <- "ActivityId"
    names(subjects) <- "SubjectId"
    
    setwd(curPath)

    list(Data=rawData,
         Activities=activities,
         Subjects=subjects,
         Labels=labels,
         ActivityLabels=activityLabels)    
}

