### JHU-DSCI Practical Machine Learning - Peer-graded Assignment

* Name: Walter Yu
* Date: January 2021

### Submission Notes

1. This project is an analysis of the Human Activity Recognition [dataset][01.00].

[01.00]: http://web.archive.org/web/20161224072740/http:/groupware.les.inf.puc-rio.br/har

2. Some charts and analysis output have been commented out to minimize overall length of document. Given project scope, it was a challenge to document all work while keeping document below maximum page length.

3. The course mentor [example project][01.01] and [model training example][01.02]  were referenced while developing this project to resolve issues with random forest model training times which were excessive without parallel processing.

[01.01]: http://lgreski.github.io/practicalmachinelearning/
[01.02]: https://github.com/lgreski/datasciencectacontent/blob/master/markdown/pml-randomForestPerformance.md

4. The caret package was unable to be installed on my Windows installation of the Anaconda application, so project was completed using Jupyter Notebook with [Google Colab][01.03]. All files and output remain the same, but project was completed with Jupyter in lieu of R markdown.

[01.03]: https://stackoverflow.com/questions/54595285/how-to-use-r-with-google-colaboratory

### Methodology

1. Project is organized into 3 parts: 1) data processing, 2) model training, and 3) model testing. Each part includes analysis and code of steps taken to train/test model and make predictions.

2. Both train/test datasets contain 160 columns; many of them contain all null values upon visual inspection and checking for null value count within each column. Also, the assignment instructions and HAR dataset documentation indicates that exercise movement and whether they were done correctly are of primary interest. As a result, irrelevant columns and rows with excessive null values were removed from train/test datasets.

3. Random forest was selected for the machine learning model since it is typically regarded as the most accurate without excessive model complexity per the course lecture videos and forum discussions.

4. The parallel and doParallel packages were used to speed up model training, and the course mentor example was referenced as noted above.

5. Model was trained by splitting the training dataset into train/test partitions. Results were evaluated with confusion matrices. Predictions were made with the testing dataset.
