# Getting-And-Cleaning-Data-Activity-Recognition-Project

#The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six #activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the #waist. 

#Data for 561 different attributes/features was recorded. Please refer to coodebook.md in the same repo for more details on features.

#First we collate the  data:
#  1.Rename column names for Y_test and subject_test to avoid ambiguity.
# 2.Combine Y_test(activity sequence) with subject_test(subjects that performed the activity in same sequence) and then finally with the #    X_test(values for all 561 features in same order)
#  3.Repeat step 2 and 3 for train data
#  4.Rename the features columns for both test and train data using the features.txt file
#  5.Combine test and train data by appending the rows and store the result in "data" dataset.
#  6.Subset data dataset for mean and std deviation columns and store the result in "selecteddata" dataset.
#  7.Rename the activity col values using the activity_labels.txt file.
#  8.Melt the seleceddata dataset and  dcast it to average the values of all columns for each activity and each subject. Store the result #    in "finaldata" dataset.
#  9.Write the dataset to activityRecognitionDataset.txt file.

  
