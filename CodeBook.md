This is the Code Book for "Getting-and-Cleaning-data-Course-Project.

The run_analysis.R script all the steps required to clean the data and produce the result.

  Download the data into folder "UCI HAR Dataset".
  Assign filename "GetdataUCIHAR".
  
  Make sure that data.table and dplyr are loaded.
  
  
  
**Assign and name variables.**

  ActivityLabels:  6 rows, 2 columns.
    Describes the six activities measured by the wearer.
  Features:  561 rows, 2 columns.
    Describes the 561 functions.
  SubjectTest:  2947 rows, 1 column.
    List of activites by number (WALKING, WALKING_UPSTAIRS etc.)
  XTest:  2947 rows, 561 columns.
    Contains the actual data in the X axis.
  YTest:  2947 rows, 1 Column.
    List of Y axis activities by number.
  SubjectTrain:  7352 rows, 1 column.
    List of training activies by number.
  XTrain:  7352 rows, 561 columns.
    Contains the actual data by numbers in the X axis for trainers.
  YTrain:  7352 rows, 1 column.
    List of Y axis training data by number.
    
