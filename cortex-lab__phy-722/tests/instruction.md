# Issue

**Title:** Factor out and fix plotting of FeatureView labels

## Description

I've noticed two issues with the FeatureView labels, which make things very confusing for a new user:

1. Most of the labels are missing along the left edge of the subplots.
2. The label value in the bottom right corner is wrong.

This separates setting the FeatureView labels from the (iterated) plotting commands, gets rid of a hack, and fixes the two issues above. This is a rather quick and naive stab at the code, but it seems to work.

Here is what it looks like before the fix:

![before](https://cloud.githubusercontent.com/assets/799467/19864383/4b887ece-9f98-11e6-9518-32f64672a69b.png)

And here is what it looks like after:

![after](https://cloud.githubusercontent.com/assets/799467/19864388/502149fc-9f98-11e6-8f0b-d30f8f725134.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1729d66dec0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.