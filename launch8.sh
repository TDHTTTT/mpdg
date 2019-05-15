#!/bin/bash

# ./launch.sh #runs #events/run #randseed_start

source ./init.sh
mkdir Run_${3}
cp *.tar.gz Run_${3}
cd Run_${3}
tar -xzf *.tar.gz
# don't need by default
#mv run_01_gridpack/* ./
#rm -r run_01_gridpack
chmod -R 700 ./
cd ./madevent/bin
./compile
cd ../../

mkdir -p ../Events ../Roots
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
rm -rf tmp
cd ..
rm -rf Run_${3}
