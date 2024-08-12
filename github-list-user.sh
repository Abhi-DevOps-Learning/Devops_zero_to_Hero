#!/bin/bash


################
#About: This Script calls the git api with an provided end point which collborator and prints the list of user have accesss to the particular repository
#Input: We need to export 'username' and 'token' and run the script by providing this two arguments 'repo owner' and 'repo name'
#Owner: Abhishek Sontakke
#Date : 12 August 2024
#Version: V1

# calling the helper function
helper()

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token getting this two things from terminal( exporting)
USERNAME=$username
TOKEN=$token

# Setting an arguments which we need to pass to the script which is user/orgnisation name and repository name(command line arguments)
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
   collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."

# Helper function if anyone run the script without giving the command line arguments

function helper {

if [ "$#" -ne 2 ]; then

echo " Please execute the script with required cmd args"
exit 1
fi
}
