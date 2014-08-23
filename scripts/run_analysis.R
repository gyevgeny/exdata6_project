setwd("~/coursera/getdata/project/UCI HAR Dataset/data")

bindMeanSd <- function(fname, vname, df){
  tmp <- read.table(fname, header=FALSE)
  
  df <- cbind(df, no_name = apply(tmp, 1, mean))
  colnames(df)[length(names(df))] = paste0(vname,"Mean") 
  df <- cbind(df, no_name = apply(tmp, 1, sd))
  colnames(df)[length(names(df))] = paste0(vname,"Sd")
  df
}

# Points #2, #4
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Appropriately labels the data set with descriptive variable names. 
subject = read.table("subject.txt", header=FALSE)
data = data.frame(Subject=subject$V1)

y <- read.table("y.txt", header=FALSE)
data <- cbind(data, Activity = y$V1)

data <- bindMeanSd("inertial_signals/body_acc_x.txt", "tBodyAccX", data)
data <- bindMeanSd("inertial_signals/body_acc_y.txt", "tBodyAccY", data)
data <- bindMeanSd("inertial_signals/body_acc_z.txt", "tBodyAccZ", data)

data <- bindMeanSd("inertial_signals/body_gyro_x.txt", "tBodyGyroX", data)
data <- bindMeanSd("inertial_signals/body_gyro_y.txt", "tBodyGyroY", data)
data <- bindMeanSd("inertial_signals/body_gyro_z.txt", "tBodyGyroZ", data)

data <- bindMeanSd("inertial_signals/total_acc_x.txt", "tTotalAccX", data)
data <- bindMeanSd("inertial_signals/total_acc_y.txt", "tTotalAccY", data)
data <- bindMeanSd("inertial_signals/total_acc_z.txt", "tTotalAccZ", data)

# Load features list V1:V561
# Not sure if should rename all features, that will be hard to use. Better to left indexes.  
x <- read.table("x.txt", header=FALSE)

# I have attached all features to data.frame because idea of point #2 is to cryptic.
# If i should left only features with mean & sd, we should use following string.
# data <- cbind(data, c(1:6,41:46,81:86, 121:126 ... ))
data <- cbind(data, x)

# Point #3
data$Activity <- factor(data$Activity,
                 levels = 1:6, 
                 labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# Point #5
tidyData <- aggregate(. ~ Subject + Activity, FUN=mean, data=data)

write.table(tidyData, "tidy.txt", row.name=FALSE)