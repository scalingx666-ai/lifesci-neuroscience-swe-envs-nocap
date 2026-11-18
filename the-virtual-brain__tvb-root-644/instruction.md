# Issue

**Title:** HBP-216. Push logs to EBRAINS Elastics API

## Description

We create here  a logging handler to store the logs in elasticsearch Kebana provided by EBRAINS TC.

First we should merge this into master, and thus [task]( https://req.thevirtualbrain.org/browse/HBP-216) is considered done.

When we will do release 2.8.1, then we should take care that in OKD the new elastic keys are added into .tvb.configuration as we describe [here](https://req.thevirtualbrain.org/browse/TVB-3073).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d73bf8dc919a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.