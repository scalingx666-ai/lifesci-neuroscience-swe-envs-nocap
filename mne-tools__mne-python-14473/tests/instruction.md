# Issue

**Title:** Serve lite-data from mne-data

## Description

Okay so `main` has actually been broken at the *deploy* step because the `lite` data serving tries to upload a file that's over 100 MB 🤦

Let's fix this by 1) serving data from `mne-data`'s `gh-pages` branch rather than `mne-tools.github.io` repo (cleaner split anyway), and 2) splitting files over 100 MB and stitching them back together when they're loaded. I also added a `[circle lite]` we could use to build JupyterLite on CircleCI if needed in PRs, and made `[circle front]` do it automatically. I also made it so that manually triggered pipelines on CircleCI are checked for `linkcheck` correctness, otherwise the issue-opener has to wait up to a month for things to be seen as fixed, even if we've fixed them.

I'm going to check the JupyterLite works with these changes and merge to get things green again 🤞

Changes drafted with Claude Opus 5.5 and reviewed by me. And the proof will really be in the interactive testing in a bit... and then I'll manually trigger CircleCI with `linkcheck` mode on and hopefully that comes back green. And triggering the `CircleCI scheduled` GHA should take care of #14472

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bcd6f222bb4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.