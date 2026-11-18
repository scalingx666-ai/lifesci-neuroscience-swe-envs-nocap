# Issue

**Title:** added new profiler script

## Description

Added a profiler script that does a run_s2p() call on some of the test data.  Uses [py-spy](https://github.com/benfred/py-spy) to create a top-like view of the running process.

example:
```
>> scripts/profile_pipeline.bat
Collecting samples from '"python" run_pipeline.py' (python v3.7.7)                                                                                                                         
Total Samples 3700                                                                                                                                                                         
GIL: 0.00%, Active: 100.00%, Threads: 1                                                                                                                                                    
                                                                                                                                                                                           
  %Own   %Total  OwnTime  TotalTime  Function (filename:line)                                                                                                                              
 69.00%  69.00%    9.50s     9.50s   medfilt2d (scipy\signal\signaltools.py:1726)                                                                                                          
  0.00%   0.00%    4.19s     4.19s   phasecorr_cpu (suite2p\registration\rigid.py:124)                                                                                                     
  0.00%   0.00%    4.00s     4.00s   phasecorr_cpu (suite2p\registration\rigid.py:121)                                                                                                     
  0.00%   0.00%    1.22s     1.22s   _path_stat (<frozen importlib._bootstrap_external>:81)                                                                                                
  0.00%   0.00%    1.03s     1.03s   phasecorr (suite2p\registration\nonrigid.py:274)    
```

This may be because the data is pretty small, but the medfilt2d() call in the extraction pipeline and the registration.rigid.phasecorr_cpu() seem to be the biggest culprits.  

With the addition of more representative data, this is a useful script for quickly getting a sense of things.

Best wishes,

Nick

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a940d5372f41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.