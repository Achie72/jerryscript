#!/bin/bash

# Running gcov to calculate measurment files
# and place them under ./gcov-measures
mkdir -p ~/gcov-measures
ARRAY=`ls ./tests/jerry/ | grep -e ".js"`
for script in $ARRAY; do
  echo "Running Script $script ..."
  mkdir -p ~/gcov-measures/$script;
  ./build/bin/jerry ./tests/jerry/$script;
  GCNO_FILES=`find ./build/ -name "*.gcno"`
  for gcno in $GCNO_FILES; do
    echo "Gcov $gcno file"
    gcov ./jerry-core/api/jerry.c -o $gcno
    GCOV_FILES=`find ./ -name "*.gcov"`
    #echo "Running gcov on $gcno ... outputted by $script"
    for gcov in $GCOV_FILES; do
      mv $gcov ~/gcov-measures/$script &>> /dev/null
      echo "Moving $gcov into ~/gcov-measures/$script"
    done
  done
  echo "---------------------"
done
mv ~/gcov-measures ./gcov-measures

# Merging the directiories under gcov-measures
# by two at a time with gcov-tool merge command
# starting by selecting first directory, and Merging
# all others into it
