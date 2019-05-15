#!/bin/bash

# ./process8_lhef.sh #runs #randseed_start

DELPHES_DIR=/pub/daohangt/Delphes-3.4.1

for ((i=$2; i<$1+$2; i++));
do
    if [ -e "../../Roots/delphes_${i}.root" ]; then
        echo "Delphes file already exists! Abort."
        exit 1
    fi

    # unzip the input events, if necessary
    if [ ! -e "../../Events/events_${i}.lhe" ]; then
        if [ -e "../../Events/events_${i}.lhe.gz" ]; then
            cp ../../Events/events_${i}.lhe.gz ./unweighted_events.lhe.gz
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

    $DELPHES_DIR/DelphesPythia8 ../../Cards/delphes_card.tcl ../../Cards/configLHE.cmnd delphes_${i}.root
    delphes_code=$?
    if [ $delphes_code -ne 0 ]; then
        echo "Delphes returned error! Code=$delphes_code" >&2
        exit $delphes_code
    fi

done
