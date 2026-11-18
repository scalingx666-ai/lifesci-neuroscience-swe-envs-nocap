# Issue

**Title:** ivoc: replace GPL FFT with Pocket FFT

## Description

Replace the historical GSL radix-2 implementation in src/ivoc/fourier.cpp                                                                                                                                                                 
    with pocketfft (Martin Reinecke, BSD-3-Clause) to completely eliminate GPL                                                                                                                                                                
    copyleft text and provide faster, vectorized Fourier transforms.                                                                                                                                                                          
                                                                                                                                                                                                                                              
    Key details:                                                                                                                                                                                                                              
    - Vendors pocketfft_hdronly.h under src/pocketfft/ with DisableFormat: true                                                                                                                                                               
      in .clang-format matching existing third-party directory patterns.                                                                                                                                                                      
    - Defines POCKETFFT_NO_MULTITHREADING to ensure pure sequential execution                                                                                                                                                                 
      without background worker threads or synchronization overhead.                                                                                                                                                                          
    - Adapts pocketfft::r2c and pocketfft::c2r to NEURON's canonical half-complex                                                                                                                                                             
      layout [Re(0), Re(1..N/2-1), Re(N/2), Im(N/2-1..1)], ensuring full                                                                                                                                                                      
      compatibility with Vector.fft, Vector.convlv, Vector.correl, Vector.spctrm,                                                                                                                                                             
      Vector.filter, and Vector.smhist.                                                                                                                                                                                                       
    - Retains power-of-two validation throwing hoc_execerror for backwards                                                                                                                                                                    
      compatibility.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `abd2b4efbd9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.