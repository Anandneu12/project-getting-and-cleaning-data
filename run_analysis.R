library(plyr)
x_t <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")

bindx <- rbind(x_t, x_test)

y_t <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")

bindy <- rbind(y_t, y_test)

s_t<- read.table("train/subject_train.txt")
s_test<- read.table("test/subject_test.txt")

binds<- rbind(s_t, s_test)

f<- read.table("features.txt")

mstd <- grep("-(mean|std)\\(\\)", f[,2])

extractx<- extractx[,mstd]
names(extractx) <- f[mstd, 2]

activityname <- read.table("activity_labels.txt")
correcty[,1] <- activityname[correcty[,1],2]
names(correcty) <- "activity"

names(binds) <- "subject"
allbind <- cbind(extractx, correcty, binds)



names(