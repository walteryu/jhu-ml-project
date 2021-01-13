# 02.00, final project: model training

# load packages: machine learning models
# references: course quiz and assignments
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
install.packages("caret", dependencies = TRUE)
install.packages("parallel")
install.packages("doParallel")
library(caret)
library(parallel)
library(doParallel)

# set random number generation/seed
# references: course quiz and assignments
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
RNGversion("3.5.1")
set.seed(3523)

# set random number generation/seed
# references:
# class lecture slides on random forest (set 21, slide 4)
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
inTrain = createDataPartition(df_training$classe, p = 0.7, list=FALSE)
training = df_training[ inTrain,]
testing = df_training[-inTrain,]

# setup x and y to speed up with model training
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
y <- training[,91]
x <- training[,-91]

# configure parallel model training
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
print("setting up cluster and trainControl object...")
cluster <- makeCluster(detectCores() - 1)
registerDoParallel(cluster)

# create fitControl object with cross validation parameter
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
fitControl <- trainControl(
    method = "cv",
    number = 5,
    allowParallel = TRUE
)

# train model with random forest
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
print("model training with random forest...")
fit <- train(x,y,
    method="rf",
    data=df_training,
    trControl = fitControl
)
# fit <- train(classe ~ .,
#     method="rf",
#     data=df_training,
#     trControl = fitControl
# )

# shutdown parallel processing cluster
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
print("stop cluster after model training...")
stopCluster(cluster)
registerDoSEQ()

# evaluate results with confusion matrix
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
fit
fit$resample
confusionMatrix.train(fit)
