# Issue

**Title:** More info logged for robustICA

## Description

When `--ica_method robustica` is used the number of time fastICA fails to converge is send to stdout within the `robustica` code, but isn't even saved into the tedana log. This is critical information to miss since, if the ICA repeatedly fails to converge that's a sign that something is wrong with the PCA input into ICA

Changes proposed in this pull request:

- The stdout warning from `robustica` is caught by tedana and the number of times ICA fails to converge is counted and added to both the `tedana[date].tsv` log and `desc-ICACrossComponent_metrics.json`
  - If ICA fails to converge for <10% of iterations, then the count is a neutral statement in `LGR.info`
  - If ICA fails to converge 10%-25% of the time, then the count is an `LGR.warning` with a suggestion to try rerunning with fewer PCA components
  - If ICA fails to converge >25% of the iterations, then the count is an `LGR.warning` that notes something is wrong. (This was originally an error but that both interacted poorly with the `try/exception` statement and it would be unpredictably triggered as part of the robustICA test with only 4 iterations.)


- The `robustICA` `index_qualty` (`iq`) was written in the log and is now also added to `desc-ICACrossComponent_metrics.json`
- The total number of components after robustica is now logged using `LGR.info`

FWIW, I was also hoping to add total variance explained for the ICA components after robustICA, but our total variance explained calculations are a bit of a mess & fixing it would make this a less simple PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d15abdbbdbb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.