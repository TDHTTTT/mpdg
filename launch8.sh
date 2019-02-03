#!/bin/bash

# ./launch.sh #runs #events/run #randseed_start

mkdir Run_${3}
cp *.tar.gz Run_${3}
cd Run_${3}
tar -xzf *.tar.gz
mv expgrid/* ./
chmod -R 700 ./
cd ./madevent/bin
./compile
cd ../../

#mkdir Events Roots

for ((i=$3; i<$1+$3; i++));
do
    ./run.sh $2 $i
    mv events.lhe.gz ../Events/events_${i}.lhe.gz
done

mkdir tmp
cp ../process8_lhef.sh ./tmp
cd tmp
./process8_lhef.sh $1 $3

cd ../
mv ./tmp/*.root ../Roots
#rm -rf tmp
