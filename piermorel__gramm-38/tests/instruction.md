# Issue

**Title:** Merges color and marker/size/linestyle legend if they are the same

## Description

Hi again!

Still a happy user. I have minor tweak. The purpose of the changes is too automatically merge legends when the color legend and the legend for marker/size/linestyle are the same. I find colours visually better distinguishable, but to be sure BW-prints are also clear I usually include a different marker for example as well. This produces 2 legends which are now merged to one. 

before: 
<img width="110" alt="before" src="https://cloud.githubusercontent.com/assets/1227879/25429922/ea2927e6-2a7a-11e7-92a9-9c17b2c447f8.png">

after:
<img width="94" alt="after" src="https://cloud.githubusercontent.com/assets/1227879/25429921/ea261128-2a7a-11e7-928a-f6a7e8a688a6.png">

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7d2189e0249`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.