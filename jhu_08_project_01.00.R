# 01.00, final project: data prep

# reference: download and read data
# https://stackoverflow.com/questions/12460938/r-reading-in-a-zip-data-file-without-unzipping-it
# har_data_subset <- read.table(
#     unzip("http://groupware.les.inf.puc-rio.br/static/har/dataset-har-PUC-Rio-ugulino.zip", list=TRUE)
# )
# har_data_subset

# reference: read csv data
# https://stackoverflow.com/questions/6299220/access-a-url-and-read-data-with-r
# https://stackoverflow.com/questions/25771071/r-read-csv-more-columns-than-column-names-error
har_data_subset = read.csv(
    url("https://raw.githubusercontent.com/walteryu/jhu-ml-project/main/dataset-har-PUC-Rio-ugulino.csv"),
    sep=";"
)
dim(har_data_subset)
names(har_data_subset)
