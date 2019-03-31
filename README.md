# mpdg

Add ```run_01_gridpack.tar.gz```, from running mg5 with ```True  = gridpack```
To customize the behavior of pythia/delphes, edit the corresponding card.

### Pythia6
Add your mg5 directory in ```./process_lhef.sh```

### Pythia8
Add your delphes directory in ```./process8_lhef.sh```

Now it is ready to produce some .root files.

To generate 100 runs with 10000 events per run, using pythia6:
```bash
./launch.sh 100 10000
```

To generate 100 runs with 10000 events per run, using pythia8 (note the $3 specifies the starting random seed which gets incremented to guarantee different seed):
```bash
./launch8.sh 100 10000 1
```
