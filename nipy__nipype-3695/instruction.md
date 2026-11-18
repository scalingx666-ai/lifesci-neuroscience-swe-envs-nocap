# Issue

**Title:** ENH: Remove unused and recently unsupported antsRegistration flag

## Description

## Summary

```txt


The flag --use-estimate-learning-rate-once was not used inside of antsRegistration, and was removed on 2022-08-09 in ants commit e1e47994b

e1e47994b Examples/antsRegistration.cxx
(Nick Tustison     2022-08-09 16:45:01 -0700 453)
//   option->SetLongName("use-estimate-learning-rate-once");
```

## List of changes proposed in this PR (pull-request)

Removes unnecessary antsRegistration flag that never had an effect in the code, and has been removed since 2022-08-09.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06209a440bc7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.