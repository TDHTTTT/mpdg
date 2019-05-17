# mpdg

Running Madgraph5 + Pythia8 + Delphes4 with gridpack support, optimized to run on cluster.   

To customize the behavior of Pythia/Delphes, edit the corresponding card in `Cards/`.  

## Prerequisite

+ Install Madgraph5 + Pythia8 + Delphes4 separately with [`DelphesPythia8`][dp8-url] built.
+ Add `run_01_gridpack.tar.gz`, from running [madgraph5 with gridpack][mg-grid] `True = gridpack`. Note this step can be completed either locally or on the cluster.  
+ Add your delphes directory in `init.sh` and do `source ./init.sh`.  

## Running locally

To generate 100 runs with 10000 events per run, with the seed for the first run being 27 (the seed will be incremeted in the following runs):

```bash
./launch8.sh 100 10000 27
```

## Running on HPC
Some wrapping scripts are provided to execute `launch8.sh` on UCI's HPC making the simulation jobs faster. The core idea to be faster is to submit lots of small jobs so that those jobs can run in parallel. On HPC, a tested combination is `10 runs x 10000 events/run per node`, which should be well within the CPU timing wall. Also, to keep track of the simulation, the seed is being used as the identifier of the events.  

To submit 10 jobs with 1 as the first seed and 100 as the last one:

```bash
cd hpc
./qsub.sh 1 100
```

## Running with docker
Work in progress  


## When it finishes
You will get

```bash
├ Events
│   └ events_seed#.lhe.gz
└ Roots
    └ delphes_seed#.root
```


[mg-grid]: https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/IntroGrid/
[dp8-url]: https://cp3.irmp.ucl.ac.be/projects/delphes/wiki/WorkBook/Pythia8/ 
