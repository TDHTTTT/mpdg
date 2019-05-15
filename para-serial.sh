#!/bin/bash
#$ -N <NAME-OF-THE-JOB>
#$ -ckpt restart
#$ -q free*
#$ -pe openmp 4

# Try to be conservative before figuring out low cpu
../launch8.sh $1 $2 $3 > log_${3}
