---
title: "Getting and Cleaning Data project README"
output: html_document
---
    
    
This is the README file for the course project on the Coursera module Getting and Cleaning Data.
    
    
This project contains 3 files:
   
* this `README.md` file
* `CodeBook.md` which describes the variables and how they were generated
* the R script `run_analysis.R` which processes the original datafiles and produces the clean datafile `mean_values.txt`
  
  
The original datafiles are part of the Human Activity Recognition Using Smartphones Dataset.
Copies of the files were retrieved from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unpacked into a local directory.  
  
  
The R script assumes that the datafiles are in the current working directory.
To ensure this is the case, the setwd command at the start of the R script should be 
changed to the location where the data files were unpacked.