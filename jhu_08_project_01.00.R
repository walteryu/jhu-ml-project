# 01.00, final project: data prep

# reference: download and read data
# https://stackoverflow.com/questions/12460938/r-reading-in-a-zip-data-file-without-unzipping-it
# har_data_subset <- read.table(
#     unzip("http://some_file.zip", list=TRUE)
# )
# har_data_subset

# reference: read csv data
# https://stackoverflow.com/questions/6299220/access-a-url-and-read-data-with-r
# https://stackoverflow.com/questions/25771071/r-read-csv-more-columns-than-column-names-error
har_data = read.csv(
    url("https://raw.githubusercontent.com/walteryu/jhu-ml-project/main/dataset-har-PUC-Rio-ugulino.csv"),
    sep=";"
)
dim(har_data)
names(har_data)

wt_data = read.csv(
    url("https://raw.githubusercontent.com/walteryu/jhu-ml-project/main/WearableComputing_weight_lifting_exercises_biceps_curl_variations.csv"),
    sep=","
)
dim(wt_data)
names(wt_data)

# note: data appears to contain nulls upon initial inspection, so check for na count
# reference: count null values within each column and output results
# https://sebastiansauer.github.io/sum-isna/
sapply(wt_data, function(x) sum(is.na(x)))

# note: columns below contained null values (includes count)
# user_name = 0
# raw_timestamp_part_1 = 0
# raw_timestamp_part_2 = 0
# cvtd_timestamp = 0
# new_window = 0
# num_window = 0
# roll_belt = 0
# pitch_belt = 0
# yaw_belt = 0
# total_accel_belt = 0
# kurtosis_roll_belt = 0
# kurtosis_picth_belt = 0
# kurtosis_yaw_belt = 0
# skewness_roll_belt = 0
# skewness_roll_belt.1 = 0
# skewness_yaw_belt = 0
# max_roll_belt = 38403
# max_picth_belt = 38403
# max_yaw_belt = 0
# min_roll_belt = 38403
# min_pitch_belt = 38403
# min_yaw_belt = 0
# amplitude_roll_belt = 38403
# amplitude_pitch_belt = 38403
# amplitude_yaw_belt = 0
# var_total_accel_belt = 38403
# avg_roll_belt = 38402
# stddev_roll_belt = 38403
# var_roll_belt = 38403
# avg_pitch_belt = 38403
# stddev_pitch_belt = 38403
# var_pitch_belt = 38403
# avg_yaw_belt = 38403
# stddev_yaw_belt = 38403
# var_yaw_belt = 38403
# gyros_belt_x = 0
# gyros_belt_y = 0
# gyros_belt_z = 0
# accel_belt_x = 0
# accel_belt_y = 0
# accel_belt_z = 0
# magnet_belt_x = 0
# magnet_belt_y = 0
# magnet_belt_z = 0
# roll_arm = 0
# pitch_arm = 0
# yaw_arm = 0
# total_accel_arm = 0
# var_accel_arm = 38403
# avg_roll_arm = 38403
# stddev_roll_arm = 38403
# var_roll_arm = 38403
# avg_pitch_arm = 38403
# stddev_pitch_arm = 38403
# var_pitch_arm = 38403
# avg_yaw_arm = 38403
# stddev_yaw_arm = 38403
# var_yaw_arm = 38403
# gyros_arm_x = 0
# gyros_arm_y = 0
# gyros_arm_z = 0
# accel_arm_x = 0
# accel_arm_y = 0
# accel_arm_z = 0
# magnet_arm_x = 0
# magnet_arm_y = 0
# magnet_arm_z = 0
# kurtosis_roll_arm = 0
# kurtosis_picth_arm = 0
# kurtosis_yaw_arm = 0
# skewness_roll_arm = 0
# skewness_pitch_arm = 0
# skewness_yaw_arm = 0
# max_roll_arm = 38403
# max_picth_arm = 38403
# max_yaw_arm = 38403
# min_roll_arm = 38403
# min_pitch_arm = 38403
# min_yaw_arm = 38403
# amplitude_roll_arm = 38403
# amplitude_pitch_arm = 38403
# amplitude_yaw_arm = 38403
# roll_dumbbell = 1
# pitch_dumbbell = 0
# yaw_dumbbell = 0
# kurtosis_roll_dumbbell = 0
# kurtosis_picth_dumbbell = 0
# kurtosis_yaw_dumbbell = 0
# skewness_roll_dumbbell = 0
# skewness_pitch_dumbbell = 0
# skewness_yaw_dumbbell = 0
# max_roll_dumbbell = 38403
# max_picth_dumbbell = 38403
# max_yaw_dumbbell = 0
# min_roll_dumbbell = 38403
# min_pitch_dumbbell = 38403
# min_yaw_dumbbell = 0
# amplitude_roll_dumbbell = 38403
# amplitude_pitch_dumbbell = 38403
# amplitude_yaw_dumbbell = 0
# total_accel_dumbbell = 0
# var_accel_dumbbell = 38403
# avg_roll_dumbbell = 38403
# stddev_roll_dumbbell = 38403
# var_roll_dumbbell = 38403
# avg_pitch_dumbbell = 38403
# stddev_pitch_dumbbell = 38403
# var_pitch_dumbbell = 38403
# avg_yaw_dumbbell = 38403
# stddev_yaw_dumbbell = 38403
# var_yaw_dumbbell = 38403
# gyros_dumbbell_x = 0
# gyros_dumbbell_y = 0
# gyros_dumbbell_z = 0
# accel_dumbbell_x = 0
# accel_dumbbell_y = 0
# accel_dumbbell_z = 0
# magnet_dumbbell_x = 0
# magnet_dumbbell_y = 0
# magnet_dumbbell_z = 0
# roll_forearm = 0
# pitch_forearm = 0
# yaw_forearm = 0
# kurtosis_roll_forearm = 0
# kurtosis_picth_forearm = 0
# kurtosis_yaw_forearm = 0
# skewness_roll_forearm = 0
# skewness_pitch_forearm = 0
# skewness_yaw_forearm = 0
# max_roll_forearm = 38403
# max_picth_forearm = 38403
# max_yaw_forearm = 0
# min_roll_forearm = 38403
# min_pitch_forearm = 38403
# min_yaw_forearm = 0
# amplitude_roll_forearm = 38403
# amplitude_pitch_forearm = 38403
# amplitude_yaw_forearm = 0
# total_accel_forearm = 0
# var_accel_forearm = 38403
# avg_roll_forearm = 38403
# stddev_roll_forearm = 38403
# var_roll_forearm = 38403
# avg_pitch_forearm = 38403
# stddev_pitch_forearm = 38403
# var_pitch_forearm = 38403
# avg_yaw_forearm = 38403
# stddev_yaw_forearm = 38403
# var_yaw_forearm = 38403
# gyros_forearm_x = 0
# gyros_forearm_y = 0
# gyros_forearm_z = 0
# accel_forearm_x = 0
# accel_forearm_y = 0
# accel_forearm_z = 0
# magnet_forearm_x = 0
# magnet_forearm_y = 0
# magnet_forearm_z = 0
# classe = 0
