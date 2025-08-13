#!/bin/bash
commit_variable=$(date)
echo "The date and time of commit is $commit_variable"
git add .
git commit -m "$commit_variable"
git push 
