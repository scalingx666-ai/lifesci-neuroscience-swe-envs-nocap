# Issue

**Title:** feat: parallel implementation (Cursed Seal Mode)

## Description

Single volume parallel is hugely powerful. On an n1-standard-16, you can for example do sixteen 512^3  tasks using multiprocessing. However, each task has limited context (which is why we have the fix_borders flag). This is problematic for large structures like somata. What if instead of doing 16 tasks apart, we fuse their memory together into a 16x bigger volume? This results in cube_root(16) = 2.5x more context along each axial dimension. In our case, that means moving from 16.3 microns to 40.9 microns which is the difference between barely fitting a soma to comfortably fitting a soma.  

The main downside is the Preamble is still single threaded, so doing this increases task latency. However, the actual skeletonization will proceed in parallel. 

Hence, because Kimimaro will fight one to two orders of magnitude bigger and faster, this might be considered its cursed seal mode.

Addresses #3

![image](https://user-images.githubusercontent.com/2517065/56769266-b57e3c00-677e-11e9-9b91-adbafd298100.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c62cc9e7281b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.