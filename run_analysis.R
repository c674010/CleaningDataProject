setwd("c://JHU//CleaningData")

colTitle <-read.table("features.txt", header=FALSE)
colTitleName <-colTitle[, "V2"]

train_x <-read.table("X_train.txt", header = FALSE, sep = "")
train_id <-read.table("subject_train.txt", header = FALSE)
colnames(train_id) <-"id"
train_act <-read.table("y_train.txt", header = FALSE)
colnames(train_act) <-"activity"
colnames(train_x) <-colTitleName
train_act$activity <-as.factor(train_act$activity)
levels(train_act$activity) <-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

test_x <-read.table("X_test.txt", header = FALSE, sep = "")
test_id <-read.table("subject_test.txt", header = FALSE)
colnames(test_id) <-"id"
test_act <-read.table("y_test.txt", header = FALSE)
colnames(test_act) <-"activity"
colnames(test_x) <-colTitleName
test_act$activity <-as.factor(test_act$activity)
levels(test_act$activity) <-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

train <-cbind(train_id, train_act, train_x)
test <-cbind(test_id, test_act, test_x)
final <-rbind(train,test)

measure1 <-subset(final, select=(grep("mean()",colnames(final))))
measure2 <-subset(final, select=(grep("std()",colnames(final))))
measure <-cbind(measure1,measure2)
test <-subset(measure, select=(-grep("meanFreq()", colnames(measure))))

write.csv(test, file="project.csv", row.names=FALSE)
