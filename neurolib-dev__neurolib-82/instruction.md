# Issue

**Title:** Stimulus construction and RNG seed fix

## Description

* New function `func.construct_stimulus()` 
* New example of stimulus usage: `examples/example-0.5-aln-external-stimulus.ipynb`  
* Fixed RNG seed bug, where the seed value None was converted to 0 (because of pypet) and lead to a predictable random number generator,  

![image](https://user-images.githubusercontent.com/7763212/83771735-e4095e80-a682-11ea-8c76-0b1bc7df62b0.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd961a1cc347`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.