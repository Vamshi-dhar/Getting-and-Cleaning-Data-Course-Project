#  **Project activity recognition**

Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

##  Procedure:
1. Importing of data from the exxtracted files.
  + features.txt   
  + X_train.txt  
  + y_train.txt   
  + subject_train.txt   
  + X_test.txt   
  + y_test.txt  
  + subject_test.txt  
  + activity_labels.txt  
2. Selecting names having *mean* and *std* pattern into object.
3. Cleaning feature names.
4. Extracting variables having *mean* and *std* pattern among all features.
5. Combining train and test.
6. Assigning col names.
7. Assiging labels to activityl lables.
8. Creating Independent tidy data set with the average of each variable.
9. Apply mean function using dcast function.
10. Writing tidydata.


###  License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
