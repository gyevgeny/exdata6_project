#!/bin/sh

cat ../test/X_test.txt ../train/X_train.txt >> x.txt
cat ../test/y_test.txt ../train/y_train.txt >> y.txt
cat ../test/subject_test.txt ../train/subject_train.txt >> subject.txt
mkdir inertial_signals
cat "../test/Inertial Signals/body_acc_x_test.txt" "../train/Inertial Signals/body_acc_x_train.txt" >> "inertial_signals/body_acc_x.txt"
cat "../test/Inertial Signals/body_acc_y_test.txt" "../train/Inertial Signals/body_acc_y_train.txt" >> "inertial_signals/body_acc_y.txt"
cat "../test/Inertial Signals/body_acc_z_test.txt" "../train/Inertial Signals/body_acc_z_train.txt" >> "inertial_signals/body_acc_z.txt"

cat "../test/Inertial Signals/body_gyro_x_test.txt" "../train/Inertial Signals/body_gyro_x_train.txt" >> "inertial_signals/body_gyro_x.txt"
cat "../test/Inertial Signals/body_gyro_y_test.txt" "../train/Inertial Signals/body_gyro_y_train.txt" >> "inertial_signals/body_gyro_y.txt"
cat "../test/Inertial Signals/body_gyro_z_test.txt" "../train/Inertial Signals/body_gyro_z_train.txt" >> "inertial_signals/body_gyro_z.txt"

cat "../test/Inertial Signals/total_acc_x_test.txt" "../train/Inertial Signals/total_acc_x_train.txt" >> "inertial_signals/total_acc_x.txt"
cat "../test/Inertial Signals/total_acc_y_test.txt" "../train/Inertial Signals/total_acc_y_train.txt" >> "inertial_signals/total_acc_y.txt"
cat "../test/Inertial Signals/total_acc_z_test.txt" "../train/Inertial Signals/total_acc_z_train.txt" >> "inertial_signals/total_acc_z.txt"
