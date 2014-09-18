---
title: "README.md"
author: "Albert Chen"
date: "September 18, 2014"
output: html_document
---
Running the script "run_analysis.R" is sufficient to repeat the process of obtaining and cleaning the UCI HAR Dataset to obtain the means and standard deviations for each type of measurement, averaged across all time points collected.

RStudio Version 0.98.976 for MacOSX Mavericks was used.

run_analysis.R does the following:

1. The UCI HAR Dataset was downloaded and unzipped
  +https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Information about each variable and activity were read into R
  +var_index shows the index of variables only for mean and standard deviation
  +var_names shows names of variables only for mean and standard deviation
3. Raw data for mean and standard deviation for all variables were read into R
4. Data set was cleaned to produce a tidy data set named "data"
  +All variables and activities were named
  +Training and test data sets were merged
5. Data set was further cleaned to produce a tidy data set named "data2"
  +A unique key was generated for each subject performing each activity (e.g. "1 Walking")
  +The mean for each variable was calculated for each unique key
  +The data for those means were sorted

The final result of run_analysis.R ("data2") is read out as tidydata2.txt.