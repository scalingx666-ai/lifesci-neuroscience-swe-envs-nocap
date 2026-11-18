# Issue

**Title:** [GIT] Automatic package publication

## Description

This PR will automatically upload our package to TestPyPi on creation of a new release. In the future we should redirect this towards the "real" PyPi, but for the current stage of this project this will allow us to 1) get ample experience to work out any kinks in the publication process, and 2) allow our beta testers to download/update their brainstat with pip.

Current version is available at: https://test.pypi.org/project/brainstat/
Current version can be installed with: `pip install -i https://test.pypi.org/simple/ brainstat`

Note: I cannot test the trigger on release until after merging - some modification to the CI trigger may have to be made once this is pushed into master.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1f3a129b22f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.