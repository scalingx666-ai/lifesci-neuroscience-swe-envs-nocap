# Issue

**Title:** Revamp Binder configuration to work with multi-version docs

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

.

Our previous Binder setup is no longer fit for purpose since we switched to multi-version docs (#668, #700).
 and #710 for details on the problems.

After looking around for a solution, I originally found some hope in `scikit-learn`. Quoting from #710:

> Looking now at the [conf.py file for scikit-learn](https://github.com/scikit-learn/scikit-learn/blob/main/doc/conf.py?rgh-link-date=2025-11-28T10%3A27%3A43.000Z).
This is a good reference, because scikit-learn has many similarities to us: uses the pydata-sphinx-theme, has multi-verison docs, and heavily uses sphinx-gallery.

While working on this PR, I realised that `scikit-image` is also a close match for our setup, and so is 
[nilearn](https://github.com/nilearn/nilearn/tree/main). I found two of the `nilearn` PRs particularly helpful:  and 

The solution presented in this PR is based on those 3 projectes: `scikit-learn`, `scikit-image`, and `nilearn`.

**What does this PR do?**

I've updated our Binder config to:
- deploy examples from the main branch for `dev` releases (any non-tagged merges to `main`).
- deploy examples from the appropriate tag (e.g. `v0.12.0`) for releases. Something I hadn't quite realised is that tags and branches are the same thing as far as git is concerned. This is nice because we are getting the examples exactly as they were at the time of the corresponding release, se we won't run the danger of `dev` and `latest` examples being out of sync.

However this in itself is not enough. The problem is that the folder with the converted .ipynb notebooks is typically only created with the docs build, so these notebooks are not present in the `main` branch for Binder to find!

The new `.binder/postBuild` script (adapted from [scikit-learn](https://github.com/scikit-learn/scikit-learn/blob/1.8.0rc1/.binder/postBuild)) should take care of that.
It installs `movement` from the checked out `movement` repo, renders the example scripts into notebooks and puts them exactly where binder expects to find them.

The `.binder` folder now also contains a `requirement.txt` file to hold any non-`movement` requirements that are needed for the examples and a `runtime.txt` file specifying the Python version.

As far as I understand things, this setup should work for both `dev` and `latest` and also for other recent releases (as long as they are compatible with the specified Python version).

## References

Related to #709.

## How has this PR been tested?

The individual commands of `postBuild` have been tested in a locally checked out `movement` repo.

I'm not aware of any other possible way to test this. Given that Binder is anyway broken for us, I recommend merging this and then inspecting the rendered `dev` version of the website. 

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

The corresponding section of the contributing guide has been updated.

## Checklist:

- ~[ ] The code has been tested locally~
- ~[ ] Tests have been added to cover all new functionality~
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9811fa995c2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.