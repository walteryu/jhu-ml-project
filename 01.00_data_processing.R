# 01.00, final project: data prep

# reference: read csv data (both har and weights data)
# https://stackoverflow.com/questions/6299220/access-a-url-and-read-data-with-r
# https://stackoverflow.com/questions/25771071/r-read-csv-more-columns-than-column-names-error
har_data = read.csv(
    url("https://raw.githubusercontent.com/walteryu/jhu-ml-project/main/dataset-har-PUC-Rio-ugulino.csv"),
    sep=";"
)
print("har_data dimensions: ")
dim(har_data)
# names(har_data)

wt_data = read.csv(
    url("https://raw.githubusercontent.com/walteryu/jhu-ml-project/main/WearableComputing_weight_lifting_exercises_biceps_curl_variations.csv"),
    sep=","
)
print("wt_data dimensions: ")
dim(wt_data)
# names(wt_data)

# note: data appears to contain nulls upon initial inspection, so check for na count
# reference: count null values within each column and output results
# https://sebastiansauer.github.io/sum-isna/
# sapply(wt_data, function(x) sum(is.na(x)))

# note: columns below contained null values (list shows null count per column)
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

# reference: subset by column names
# https://www.statmethods.net/management/subset.html
col_subset <- c(
    "user_name",
    "raw_timestamp_part_1",
    "raw_timestamp_part_2",
    "cvtd_timestamp",
    "new_window",
    "num_window",
    "roll_belt",
    "pitch_belt",
    "yaw_belt",
    "total_accel_belt",
    "kurtosis_roll_belt",
    "kurtosis_picth_belt",
    "kurtosis_yaw_belt",
    "skewness_roll_belt",
    "skewness_roll_belt.1",
    "skewness_yaw_belt",
    "max_yaw_belt",
    "min_yaw_belt",
    "amplitude_yaw_belt",
    "gyros_belt_x",
    "gyros_belt_y",
    "gyros_belt_z",
    "accel_belt_x",
    "accel_belt_y",
    "accel_belt_z",
    "magnet_belt_x",
    "magnet_belt_y",
    "magnet_belt_z",
    "roll_arm",
    "pitch_arm",
    "yaw_arm",
    "total_accel_arm",
    "gyros_arm_x",
    "gyros_arm_y",
    "gyros_arm_z",
    "accel_arm_x",
    "accel_arm_y",
    "accel_arm_z",
    "magnet_arm_x",
    "magnet_arm_y",
    "magnet_arm_z",
    "kurtosis_roll_arm",
    "kurtosis_picth_arm",
    "kurtosis_yaw_arm",
    "skewness_roll_arm",
    "skewness_pitch_arm",
    "skewness_yaw_arm",
    "pitch_dumbbell",
    "yaw_dumbbell",
    "kurtosis_roll_dumbbell",
    "kurtosis_picth_dumbbell",
    "kurtosis_yaw_dumbbell",
    "skewness_roll_dumbbell",
    "skewness_pitch_dumbbell",
    "skewness_yaw_dumbbell",
    "max_yaw_dumbbell",
    "min_yaw_dumbbell",
    "amplitude_yaw_dumbbell",
    "total_accel_dumbbell",
    "gyros_dumbbell_x",
    "gyros_dumbbell_y",
    "gyros_dumbbell_z",
    "accel_dumbbell_x",
    "accel_dumbbell_y",
    "accel_dumbbell_z",
    "magnet_dumbbell_x",
    "magnet_dumbbell_y",
    "magnet_dumbbell_z",
    "roll_forearm",
    "pitch_forearm",
    "yaw_forearm",
    "kurtosis_roll_forearm",
    "kurtosis_picth_forearm",
    "kurtosis_yaw_forearm",
    "skewness_roll_forearm",
    "skewness_pitch_forearm",
    "skewness_yaw_forearm",
    "max_yaw_forearm",
    "min_yaw_forearm",
    "amplitude_yaw_forearm",
    "total_accel_forearm",
    "gyros_forearm_x",
    "gyros_forearm_y",
    "gyros_forearm_z",
    "accel_forearm_x",
    "accel_forearm_y",
    "accel_forearm_z",
    "magnet_forearm_x",
    "magnet_forearm_y",
    "magnet_forearm_z",
    "classe"
)

# verify training dataset dimensions after subset
df_training = wt_data[col_subset]
print("training dimensions")
dim(df_training)
