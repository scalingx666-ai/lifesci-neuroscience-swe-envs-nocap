# Issue

**Title:** ENH: make RcppANTsR code accessible via LinkingTo

## Description

Here are some potential changes that would help make the Rcpp wrapper code (wrap() and as()) accessible via "LinkingTo: ANTsR" The primary change is that the wrapper code is now all implemented in header files to avoid library linking problems, and the header files are moved into the inst/include directory so that they are available to any user who has ANTsR installed. As far as I can tell, there should be no internal consequences to these changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9613824a8b01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.