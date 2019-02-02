#!/bin/bash

# ./launch.sh #runs #events/run

tar -xzf *.tar.gz
chmod -R 700 ./
cd madevent/bin
./compile
cd ../..

mkdir Events Roots
for ((i=1; i<=$1; i++));
do
    ./run.sh $2 $i
    mv events.lhe.gz ./Events/events_${i}.lhe.gz
done

mkdir tmp
cp ./process8_lhef.sh ./tmp
cd tmp
./process8_lhef.sh $1

cd ../
mv ./tmp/*.root ./Roots
rm -rf tmp
