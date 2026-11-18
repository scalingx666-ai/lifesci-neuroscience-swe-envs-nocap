# Issue

**Title:** neuronlistz - fast access to neuronlists stored as zip files

## Description

* neurons are best stored in the recent [qs format](https://cran.r-project.org/web/packages/qs/index.html)

```r
write.neurons(Cell07PNs[1:5], tf2, format='qs', include.data.frame = T)
```

You can also embed the metadata in the zip so that one file should contain everything.

For 3GB files, I get 20ms per record random access. Faster performance (order 5ms) could be obtained with https://github.com/jefferis/razip. Reading sequential groups of files is much faster.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f665de62ead`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.