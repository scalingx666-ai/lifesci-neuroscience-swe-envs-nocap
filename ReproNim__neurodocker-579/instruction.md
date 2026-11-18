# Issue

**Title:** [ENH] implement more recent mrtrix version

## Description

-  
- try to fix failure to install mrtrix from source


![image](https://github.com/ReproNim/neurodocker/assets/6961185/c219561b-076f-429f-a898-2d545357893c)


https://github.com/ReproNim/neurodocker/actions/runs/6192140394/job/16811702090#step:6:639
```
 > [2/3] RUN apt-get update -qq     && apt-get install -y -q --no-install-recommends            ca-certificates            g++            gcc            git            libeigen3-dev            make            python3            python3-numpy            zlib1g-dev     && rm -rf /var/lib/apt/lists/*     && mkdir -p /opt/mrtrix3-3.0.2     && git clone https://github.com/MRtrix3/mrtrix3.git /opt/mrtrix3-3.0.2     && cd /opt/mrtrix3-3.0.2     && git checkout 3.0.2     && python3 configure -nogui     && echo "Compiling MRtrix3 ..."     && NUMBER_OF_PROCESSORS="" python3 build:
30.85 Checking for PNG library: not found - PNG support disabled
30.90 Checking for FFTW library: not found - FFTW support disabled
30.94 
30.94 writing configuration to file 'config': ok
30.94 
30.94 Compiling MRtrix3 ...
32.07 Traceback (most recent call last):
32.07   File "/opt/mrtrix3-3.0.2/build", line 1454, in <module>
32.08     num_processors = int(os.environ['NUMBER_OF_PROCESSORS'])
32.08 ValueError: invalid literal for int() with base 10: ''
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8571e0b749c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.