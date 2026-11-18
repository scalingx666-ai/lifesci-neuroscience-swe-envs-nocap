# Issue

**Title:** Adding more live classifiers

## Description

* Added simple classes for live labelling and classification for:  
 KNN, SVM, Decision Trees, XGBoost and Logistic Regression Classifiers
* Added a deletion function to erase data labelled using a classifier.  

Note these only work with the preprocessed emg mode, however its unlikely a classifier would work well on unpreprocessed data anyway.

PR is a work in progress, as I hope to clean up the pygame plotting and move a classifier into pyomyo and update the version on PyPI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c7d03882537`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.