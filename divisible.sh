#!/bin/bash
#############################################################
#This script is use to print numbers that are divisible 3 and 5 but not divisible by 15.

#Author: Abhishek Sontakke
#Date:31/07/2024

#Version: V1

### Divisible by 3 and 5 , not by 15 and range is between 1 to 100

for i in {1..100}; do

	if ([ $((i % 3)) -eq 0 ] || [ $((i % 5)) -eq 0 ]) && [ $((i % 15)) -ne 0 ] ; then

echo $i

fi;

done

