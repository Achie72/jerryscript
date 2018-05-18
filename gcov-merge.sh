#!/bin/bash
# Merging the directiories under gcov-measures
# by two at a time with gcov-tool merge command
# starting by selecting first directory, and Merging
# all others into it

# save first directory to which all others are merged
MERGE_DIRECTORY=`ls ./gcov-measures/*/ -d  | head -n 1`;
cp -fa $MERGE_DIRECTORY/ ./gcov_result;
RESULT_DIR=./gcov_result;

# count all directores for later use
# exclude the first one
DIRECTORY_COUNT=`ls ./gcov-measures/*/ -d  | wc -l`;
DIRECTORY_COUNT=$(($DIRECTORY_COUNT-1));
DIRECTORY_ARRAY=`ls ./gcov-measures/*/ -d  | tail -n $DIRECTORY_COUNT`;

for DIR in $DIRECTORY_ARRAY; do
  echo "Merging $DIR into result directory"
  #merge files into results dir, merge new data into existing one
  gcov-tool merge -o $RESULT_DIR ./gcov_result $DIR;
done
