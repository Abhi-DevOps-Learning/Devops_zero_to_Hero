#!/bin/bash



#############################################################
#This script is use to print how much time s is present in word.
  
#Author: Abhishek Sontakke
#Date:31/07/2024
#Version: V1


a=mississipi

grep -o "s" <<<"$a" | wc -l
