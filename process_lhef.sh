#!/bin/bash


MG_DIR=
export PYTHIA_DIR=${MG_DIR}/pythia-pgs/src
export DELPHES_DIR=${MG_DIR}/Delphes

LHAPATH=$PYTHIA_DIR/PDFsets

# need to export this magic variable for pythia
export PDG_MASS_TBL=${PYTHIA_DIR}/mass_width_2004.mc

# and make sure pythia can find the LHAPATH
echo "      LHAPATH=$LHAPATH" >> ../Cards/pythia_card.dat

for ((i=1; i<=$1; i++));
do
    if [ -e "../Roots/delphes_${i}.root" ]; then
        echo "Delphes file already exists! Abort."
        exit 1
    fi

    # unzip the input events, if necessary
    if [ ! -e "../Events/events_${i}.lhe" ]; then
        if [ -e "../Events/events_${i}.lhe.gz" ]; then
            cp ../Events/events_${i}.lhe.gz ./unweighted_events.lhe.gz
            gunzip -f ./unweighted_events.lhe.gz
            if [ $? -ne 0 ]; then
                echo "Failed to unzip LHE!" >&2
                exit 1
            fi
        else
            echo "No events file found!" >&2
            exit 1
        fi
    fi

    # run pythia
    $PYTHIA_DIR/pythia

    pythia_code=$?
    if [ $pythia_code -ne 0 ]; then
        echo "Pythia returned error! Code=$pythia_code" >&2
        exit $pythia_code
    fi

    # run delphes
    $DELPHES_DIR/DelphesSTDHEP ../Cards/delphes_card.dat delphes_${i}.root pythia_events.hep

    delphes_code=$?
    if [ $delphes_code -ne 0 ]; then
        echo "Delphes returned error! Code=$delphes_code" >&2
        exit $delphes_code
    fi

    # clean the hep file
    rm pythia_events.hep

done
