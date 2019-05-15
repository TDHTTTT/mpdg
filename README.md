# mpdg

Running Madgraph5 + Pythia8 + Delphes4 to generate particle collision simulation, with a focus on running on cluster. 

To customize the behavior of Pythia/Delphes, edit the corresponding card in `Cards/`

## Prerequisite

Add `run_01_gridpack.tar.gz`, from running [madgraph5 with gridpack][mg-grid] `True = gridpack`  


## Running locally

### Pythia6
Add your mg5 directory in `./process_lhef.sh`

### Pythia8
Add your delphes directory in `./process8_lhef.sh`  

Now it is ready to produce some ROOT files.  

To generate 100 runs with 10000 events per run, using pythia6:

```bash
./launch.sh 100 10000
```

To generate 100 runs with 10000 events per run, using pythia6:

```bash
./launch8.sh 100 10000
```

## Running on HPC:
Some wrapping scripts are provided to execute the code on UCI's HPC,

## Running with docker:



To generate 100 runs with 10000 events per run, using pythia6:

[mg-grid]: https://cp3.irmp.ucl.ac.be/projects/madgraph/wiki/IntroGrid/
