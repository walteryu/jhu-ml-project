# 01.00, final project: data processing

# reference: read csv data and fill null values
# https://stackoverflow.com/questions/6299220/access-a-url-and-read-data-with-r
# https://stackoverflow.com/questions/25771071/r-read-csv-more-columns-than-column-names-error
train_data = read.csv(
    url("https://raw.githubusercontent.com/walteryu/jhu-ml-project/main/pml-training.csv"),
    na.strings = c('NA','NAN','#DIV/0!','NaN','')
)
print("train_data dimensions (all cases): ")
dim(train_data)
# import test dataset with same options
test_data = read.csv(
    url("https://raw.githubusercontent.com/walteryu/jhu-ml-project/main/pml-testing.csv"),
    na.strings = c('NA','NAN','#DIV/0!','NaN','')
)
print("test_data dimensions (all cases): ")
dim(test_data)

# subset for columns for null values
# https://stackoverflow.com/questions/15968494/how-to-delete-columns-that-contain-only-nas/45383054
# https://stackoverflow.com/questions/25188051/using-is-na-in-r-to-get-column-names-that-contain-na-values
train_data = train_data[,colSums(is.na(train_data)) == 0]
print("train_data dimensions (remove null columns): ")
dim(train_data)
# subset for columns for irrelevant columns
train_data <- train_data[,-c(1:7)]
print("train_data dimensions (remove irrelevant columns")
dim(train_data)

# subset for columns for null values
# https://stackoverflow.com/questions/15968494/how-to-delete-columns-that-contain-only-nas/45383054
# https://stackoverflow.com/questions/25188051/using-is-na-in-r-to-get-column-names-that-contain-na-values
test_data = test_data[,colSums(is.na(test_data)) == 0]
print("test_data dimensions (remove null columns): ")
dim(test_data)
# subset for columns for irrelevant columns
test_data <- test_data[,-c(1:7)]
print("test_data dimensions (remove irrelevant columns")
dim(test_data)

# subset first n rows to speed up training
# print("train_data dimensions (before subset): ")
# dim(train_data)
# df_training = train_data[1:10000,]
# print("train_data dimensions (after subset): ")
# dim(df_training)
