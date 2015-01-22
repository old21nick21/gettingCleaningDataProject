Variables
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_common, y_common and subject_common merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in features_mean_std, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
total_data merges x_common, y_common and subject_common in a big dataset.
Finally, averages_common contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
