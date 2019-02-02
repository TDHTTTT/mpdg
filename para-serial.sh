#!/bin/bash
#$ -N ppbb_201ap
#$ -ckpt restart
#$ -q free*,pub64
#$ -pe openmp 8-64
#$ -m beas

./launch8.sh $1 $2 $3 > log_${3}
