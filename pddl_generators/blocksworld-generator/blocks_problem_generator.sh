#!/bin/bash

# Author: Aneesh Chodisetty
# Copyright (c)

BLOCKS_START=21
BLOCKS_END=40

COUNT_START=1
COUNT_END=20

STORE_PATH="../../Domains/BWD/problem"

for i in $(seq $BLOCKS_START $BLOCKS_END)
do
    for j in $(seq $COUNT_START $COUNT_END)
    do
        filename="${i}block_${j}_problem.pddl"
        echo "Generating ${filename}.."
        ./blocksworld 3 ${i} > $"${STORE_PATH}/${filename}"
    done
done 