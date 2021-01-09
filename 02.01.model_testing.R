# 02.01, final project: model testing

# make predictions with test data
# reference: class lecture slides on random forest (set 21, slide 8)
pred = predict(fit,testing)
testing$predRight = pred==testing$classe
table(pred,testing$classe)
