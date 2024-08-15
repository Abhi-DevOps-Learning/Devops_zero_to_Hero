#!/bin/bash

###########This script is creating a directory for you ##########
#
#
#Author: Abhishek Sontakke
#Date: 15 August 2024
#Version: V1

#Checking if exactly three agrument are passed or not
#Command should be ./creatingdir.sh DevOps 1 5
if [ "$#" -ne 3 ]; then 
	echo "Usage: $0 <Directory_name> <Start_number> <End_number>"

	exit 1
fi

# Assigning argument to variable

dir_name=$1
start_var=$2
end_var=$3

# Creating Directories

for (( i=start_var; i <= end_var; i++ )); do

	mkdir "${dir_name}${i}"

done;

echo " Directories ${dir_name}${start_var} to ${dir_name}${end_var} created successfully."
