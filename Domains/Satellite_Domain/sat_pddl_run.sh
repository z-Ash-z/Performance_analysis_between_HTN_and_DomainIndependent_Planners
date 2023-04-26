#!/bin/bash

WORKING_PATH="../Satellite_Domain"
PLANNER_PATH="./../../domain_independent_planners/Metric-FF-v2.0/ff"
DOMAIN_PATH="${WORKING_PATH}/satellite_domain.pddl"
RESULTS_PATH="${WORKING_PATH}/results"

TIMER=300

if [ ! -d "${RESULTS_PATH}" ]
then
  mkdir -p "${RESULTS_PATH}"
  echo "Created directory: ${RESULTS_PATH}"
else
  echo "Directory already exists: ${RESULTS_PATH}"
fi

echo "Problem Size, Plan Length, Nodes Expanded, Total Time" > $"$RESULTS_PATH/stats.txt"

for dir in "${WORKING_PATH}/problem"
do
    if [[ -d "$dir" ]]
    then
        echo "Found directory: ${dir}"
        for file in "${dir}/"*.pddl
        do
            echo "Processing $(basename "$file" .pddl)"
            filename="for_$(basename "$file" .pddl).txt"
            timeout ${TIMER} $PLANNER_PATH $"-o" $DOMAIN_PATH $"-f" $file > $"$RESULTS_PATH/$filename"

            if [ $? -eq 124 ]
            then
                data="$(echo $(basename "$file" .pddl)), FAILED, 0, ${TIMER}"

            else
                plan_length=$(sed -n '/step/{:a;N;/time spent/!ba;p}' "$RESULTS_PATH/$filename" | grep -c .)
                total_time_line=$(tail -n 2 "$RESULTS_PATH/$filename" | head -n 1)

                data="$(echo $(basename "$file" .pddl)),
                $(( plan_length - 2 )),
                $(grep -oP '(?<= evaluating )\d+(\.\d+)?' "$RESULTS_PATH/$filename"),
                $(echo "$total_time_line" | grep -Eo '[0-9]+\.[0-9]+' | sed -E 's/.*([0-9]+\.[0-9]+).*/\1/')"
            fi
            echo $data
            echo $data >> $"$RESULTS_PATH/stats.txt"

            rm $"$RESULTS_PATH/$filename"
        done
    fi
done