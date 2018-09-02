# mpdg

Add ```run_01_gridpack.tar.gz```, from running mg5 with ```.true.  = gridpack```

Add your mg5 directory in ```./process_lhef.sh```

Make sure you can excute by ```chmod 700 ./launch.sh```

To customize the behavior of pythia/delphes, edit the corresponding card.

Now it is ready to produce some .root files.

To generate 100 runs with 10000 events per run:
```bash
./launch.sh 100 10000
```
