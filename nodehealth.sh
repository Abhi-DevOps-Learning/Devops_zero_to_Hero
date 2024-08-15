#!/bin/bash
#############################################################
#This script is use to check the health of system/nodes.

#Author: Abhishek Sontakke
#Date:30/07/2024
#Version: V1




#########################Details of Scripting##############################
#ps -ef | grep "bound" | awk -F " " '{print$2}' we learn this command in this script
#ps -ef is to get all the running process
#| is a pipe operator this will get the output from first command send back to the second command
#grep command use to filter the information based on words
#awk is most widley use command to search for articular information.


set -x # run in debug mode print you all the command when script get excuted.
set -e # exit the script when there is error eg: "rhf" this is not command so the script get exist at this point of command.
set -o pipefail # when pipe operator used, sometime set -e will not work eg: aghjdghsgfsjhf | echo for this will get a output means it will get excuted because it consider the command after pipe operator. but what if we do like this echo | bvrb3r then script get exist as error. 

df -h

free -g

nproc

ps -ef | grep bound | awk -F " " '{print $2}'

