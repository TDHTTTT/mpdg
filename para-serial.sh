#!/bin/bash
#$ -N ppjj_225a
#$ -ckpt restart
#$ -q free*
#$ -pe openmp 8

# Try to be conservative before figuring out low cpu
./launch8.sh $1 $2 $3 > log_${3}
