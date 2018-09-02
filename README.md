# mpdg

Replace ```run_01_gridpack.tar.gz``` with your own gridpack (or you can try this as an example).

Add your mg5 directory in ```./process_lhef.sh```

Make sure if you can excute ```chmod 700 ./launch.sh```

To customize the behavior of pythia/delphes, edit the corresponding card.

Now it is ready to produce some .root files.

To generate 100 runs with 10000 events per run:
```bash
./launch.sh 100 10000
```
