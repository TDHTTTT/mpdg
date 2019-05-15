#!/bin/bash

#./qsub.sh start end
#./qsub.sh 101 1000
# 10 10000 works well on HPC (to avoid getting migrated)

for ((i=$1; i<$2; i+=10));
do
    qsub ./para-serial.sh 10 10000 $i
done
