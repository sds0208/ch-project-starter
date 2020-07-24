#!/bin/bash

echo -e "\nREADY TO START ON YOUR NEW PROJECT?\n\n"
echo -e "This script will perform the following tasks: \n"
echo "1. Confirm the directory for your new project"
echo "2. Clone master branch of the specified repository"
echo "3. Rename repository"
echo "5. npm install"
echo -e "6. Create two new branches - develop and release, both locally and remote\n\n"

echo -e "PRESS CONTROL+C AT ANY TIME TO EXIT THIS PROGRAM.\n\n"

CURRENT_DIR=$(pwd)

echo -e "You are currently in the following directory: \n\n$CURRENT_DIR\n\n"
read -p "Enter Y if this is the directory you'd like your new project to be in. If not, enter the path for the directory. Example - ~/dir1/dir2/my-projects: " PARENT_DIR

if [ "$PARENT_DIR" != "Y" ]
then
  cd PARENT_DIR
fi

echo -e "\n\nGreat, your new project will be located in $(pwd)"

read -p "Enter the url for the repository that you'd like to clone: " URL

git clone "$URL"

LIST=($(ls -t))
read -p "Enter new name for project directory: " NEW_DIR_NAME
mv ${LIST[0]} ${NEW_DIR_NAME}
cd ${NEW_DIR_NAME}

npm install

read -p "Enter the branch name starting with the /, for example /abc-12.3-example-name: " BRANCH_NAME

git checkout -b "release${BRANCH_NAME}"
git push --set-upstream origin "release${BRANCH_NAME}"
git checkout -b "develop${BRANCH_NAME}"
git push --set-upstream origin "develop${BRANCH_NAME}"

echo "NOW CD INTO YOUR NEW PROJECT DIRECTORY AND GET STARTED!"
