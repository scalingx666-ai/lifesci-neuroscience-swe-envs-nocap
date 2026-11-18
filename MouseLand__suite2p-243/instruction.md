# Issue

**Title:** making plugins feature functional

## Description

I find the plugins to be a very useful feature for writing custom functionalities without modifying upstream. However, I haven't been able to find any information on how to use it, or examples that other people have written. Looking at the source code, I wasn't able to figure out exactly how to get it to work as it is provided. So I slightly modified that segment of code to make that feature functional. Keep in mind that I am pretty new to python so I might have completely missed the point. In any case, if this request gets merged, I would be happy to write a wiki entry on how to implement plugins so others like me can benefit. You can find an example plugin that I've been tinkering with here: https://github.com/LelouchLamperougeVI/s2p-plugins

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6014edcb32ea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.