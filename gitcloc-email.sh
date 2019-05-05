#!/bin/bash

if [ -z "$1" ] #If first parameter is empty, send error message and exit in 
#failure
then
  echo "First Parameter Is Empty, Must Be GitHub Repository URL"
  exit 1
elif [ -z "$2" ] #If second parameter is empty, send error message and exit 
#in failure
then
  echo "Second Parameter Is Empty, Must Be Email Address"
  exit 2
else #Otherwise, run script as normal
  
  #Run Git Clone Command to Temporary Repository
  git clone "$1" temp-repo
  
  #Run Cloc Command to Output to Temporary Text File with Statistics from 
  #Temporary Repository
  cloc --out=temp-repo.txt temp-repo
  
  #Use Cat Command to Output Temporary Text File Information, Pipe Into Mail 
  #Command to send Information to Email Address
  cat temp-repo.txt | mail -s "CLOC Information" "$2"
  
  #Delete Temporary Repository and Temporary Text File
  rm -rf temp-repo
  rm -f temp-repo.txt
fi
