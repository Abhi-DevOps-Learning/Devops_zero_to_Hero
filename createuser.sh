#!/bin/bash


###########This script is checking likeit is running as root user and the create user ##########
#
#
#Author: Abhishek Sontakke
#Date: 15 August 2024
#Version: V1


#"$EUID" variable holds the effective user ID of the current user.

if [[ $EUID -ne 0 ]]; then 
       echo "This script must be run as root user"
       exit 1
fi

# Function to create a user

create_user() {

      local username=$1
      local password=$2

      # Create the user(-m create a home directory for the user and -s sets the user's default shell to /bin/bash)
      useradd -m -s /bin/bash "$username"

      # Set the password for user (it will change the password for the requested user to requested password)
      echo "$username:$password" | chpasswd

      # Display the username
      echo "Created user: $username"

}

# Create two users
create_user "gurpreet" "thdf75nfh"
create_user "makrpreet" "rndj76bd"

#Displaying the username of the created users
echo "Usernames of the created users:"
echo "gurpreet"
echo "makrpreet"
