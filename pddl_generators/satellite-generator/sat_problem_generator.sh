#!/bin/bash

# Author: Aneesh Chodisetty
# Copyright (c)

SAT_START=21
SAT_END=40

SEED_START=1
SEED_END=20

STORE_PATH="../../Domains/Satellite_Domain/problem"

for i in $(seq $SAT_START $SAT_END)
do
    for j in $(seq $SEED_START $SEED_END)
    do
        filename="${i}_${j}_satellite_problem.pddl"
        echo "Generating ${filename}.."
        ./satgen -n $j 10 10 5 $i 2 > $"${STORE_PATH}/${filename}"
    done
done    