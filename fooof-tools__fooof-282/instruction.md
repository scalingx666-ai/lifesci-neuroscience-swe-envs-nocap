# Issue

**Title:** [MNT] - Update build procedure

## Description

Continuing the updates for things that are changing in the Python ecosystem - this updates away from calling `setup.py` directly in the build process, as this is now suggested against. 

New versions of `setuptools` print this out when running our current build command (`python setup.py sdist bdist_wheel`):
<img width="589" alt="Screen Shot 2023-07-08 at 10 26 46 AM" src="https://github.com/fooof-tools/fooof/assets/7727566/dbdf4c59-fc84-42a4-879a-e75a9a1f0a48">

Link: https://blog.ganssle.io/articles/2021/10/setup-py-deprecated.html
I didn't do the deep dive - but there is a useful table that indicates the new approach, using 
https://github.com/pypa/build

Related to which, this PR:
- updates the Makefile to use `build` to create the distribution
- adds the `requirements.txt` to the MANIFEST.in
    - it should probably have been in there (`build` needs it, as it builds the distribution in a venv)

Comparing the output distribution files, as far as I can tell they are the same from build as calling `setup.py`. 

Notably, as far as I understand, since we are using `setup.py` (and not `pyproject.toml`), I think `build` in this case uses `setuptools` and the `setup.py` file in the same way, so nothing really changes under the hood. This PR therefore just moves into the current best practice, and perhaps makes us a bit more ready if we do decide to update to `pyproject.toml` at some point (which I think is becoming the new standard). 

In terms of review - @ryanhammonds, when you get a chance could you double check that you can run the new `build` command and that it seems to work on your system?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `172101ae1458`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.