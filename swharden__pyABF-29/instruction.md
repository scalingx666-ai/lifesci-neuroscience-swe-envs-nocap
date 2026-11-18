# Issue

**Title:** Epochs: Support loading custom waveforms from ATF files

## Description

PClamp allows to describe a stimulus epoch by giving a waveform in an ATF/ABF file.

We now support reading the ATF files and return that for the stimulus in
Epoch.stimulusWaveform().

As parsing and loading the ATF files from disc takes a considerable
amount of time, the ABF class learned to use the new ATFStorage class
which caches ATF files.

The ATFStorage class also allows to load ATF files from a different
folder on disc.

Usage:

```python
 storage = pyabf.ATFStorage("../sample_data/protocols/")
 abf1 = pyabf.ABF(somefile, preloadData=True, atfStorage=storage)

 # let abf1 go out of scope

 # reuse storage class
 abf2 = pyabf.ABF(somefile, preloadData=True, atfStorage=storage)
```

I only implemented reading ATF files as that is what we are using.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18b20a147e20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.