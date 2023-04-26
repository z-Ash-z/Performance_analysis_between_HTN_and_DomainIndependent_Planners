#!/bin/bash

WORKING_PATH="."
RESULTS_PATH="./results"
PLANNER_PATH="./../../domain_independent_planners/fast-downward-22.12/fast-downward.py"
DOMAIN_PATH="BWS_domain.pddl"

TIMER=300

if [ ! -d "${RESULTS_PATH}" ]
then
  mkdir -p "${RESULTS_PATH}"
  echo "Created directory: ${RESULTS_PATH}"
else
  echo "Directory already exists: ${RESULTS_PATH}"
fi

echo "Problem Size, Plan Length, Nodes Expanded, Total Time" > $"$RESULTS_PATH/stats.txt"
for dir in "$WORKING_PATH/problem"*
do
  if [[ -d "$dir" ]]
  then
    # Directory handling code here
    echo "Found directory: $dir"
    for file in "$dir/"*.pddl
    do
      echo "Processing $(basename "$file" .pddl)"
      filename="for_$(basename "$file" .pddl).txt"
      timeout ${TIMER} $PLANNER_PATH $"--alias" $"lama-first" $DOMAIN_PATH $file > $"$RESULTS_PATH/$filename"

      if [ $? -eq 124 ]
      then
        data="$(echo $(basename "$file" .pddl)), FAILED, 0, ${TIMER}"
      
      else
        data="$(echo "$(basename "$file" .pddl)"),
              $(grep -oP '(?<=Plan length: )\d+(\.\d+)?' "$RESULTS_PATH/$filename"),
              $(grep -oP '(?<=Evaluated )\d+(\.\d+)?' "$RESULTS_PATH/$filename"),
              $(grep -oP '(?<=Total time: )\d+(\.\d+)?' "$RESULTS_PATH/$filename")"
      fi
      echo $data
      echo $data >> $"$RESULTS_PATH/stats.txt"
      rm $"$RESULTS_PATH/$filename"
    done
  fi
done