# Issue

**Title:** Update ft_crossfrequencyanalysis.m

## Description

The result of ft_crossfrequencyanalysis (method 'pac') gave me matrix with only zeros
This seemed to be caused by NaNs being present in my data.
Changing line 305 from:
`rsspctrm = reshape(mean(cfcdata,1),[nchan nlf nhf nbin 1]);`
to
`crsspctrm = reshape(mean(cfcdata,1,'omitnan'),[nchan nlf nhf nbin 1]);`
seems to solve the issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7018a770047b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.