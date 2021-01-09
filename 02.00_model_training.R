# 02.00, final project: model training

# load packages: machine learning models
# reference: course quiz and assignments
# install.packages("caret", dependencies = TRUE)
library(caret)

# load packages: parallel model training
# https://github.com/lgreski/datasciencectacontent/blob/7f88642673eeb5913459eb05bd5b58734c8f0bd5/markdown/pml-randomForestPerformance.md
# install.packages("parallel")
# install.packages("doParallel")
library(parallel)
library(doParallel)

# set random number generation/seed
# reference: course quiz and assignments
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

# Random Forest
#
# 29433 samples
#    90 predictor
#     5 classes: 'A', 'B', 'C', 'D', 'E'
#
# No pre-processing
# Resampling: Cross-Validated (5 fold)
# Summary of sample sizes: 23546, 23547, 23547, 23547, 23545
# Resampling results across tuning parameters:
#
#   mtry  Accuracy   Kappa
#    2    0.9943261  0.9928223
#   46    0.9996262  0.9995273
#   90    0.9993205  0.9991405
#
# Accuracy was used to select the optimal model using the largest value.
# The final value used for the model was mtry = 46.
#
# A data.frame: 5 × 3 Accuracy	Kappa	Resample
# <dbl>	<dbl>	<chr>
# 0.9996603	0.9995703	Fold1
# 1.0000000	1.0000000	Fold3
# 0.9991505	0.9989256	Fold2
# 1.0000000	1.0000000	Fold5
# 0.9993204	0.9991405	Fold4
#
# Cross-Validated (5 fold) Confusion Matrix
#
# (entries are percentual average cell counts across resamples)
#
#           Reference
# Prediction    A    B    C    D    E
#          A 28.4  0.0  0.0  0.0  0.0
#          B  0.0 19.3  0.0  0.0  0.0
#          C  0.0  0.0 17.4  0.0  0.0
#          D  0.0  0.0  0.0 16.4  0.0
#          E  0.0  0.0  0.0  0.0 18.4
#
#  Accuracy (average) : 0.9996
