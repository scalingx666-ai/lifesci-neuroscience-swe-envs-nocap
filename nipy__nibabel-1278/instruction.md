# Issue

**Title:** REL: 5.2.0

## Description

Preparation for new feature release 5.2.0, targeting Monday, December 11.

Open PRs that could probably be finished off:

* [ ] #932 (@mgxd)
* [ ] #1205 (@ZviBaratz)
* [x] #1255 (@effigies)
* [x] #1275 (@DimitriPapadopoulos)
* [x] #1276 (@DimitriPapadopoulos)
* [x] #1279 (@effigies)
* [x] #1280 (@effigies)

Please comment to flag any other issues that should be addressed.

Pre-release checklist
--------
* [x] Review the open list of [nibabel issues](https://github.com/nipy/nibabel/issues). Check whether there are outstanding issues that can be closed, and whether there are any issues that should delay the release. Label them!
* [x] Review and update the release notes. Review and update the [Changelog file](https://github.com/nipy/nibabel/blob/master/Changelog).
* [x] Look at [`doc/source/index.rst`](https://github.com/nipy/nibabel/blob/master/doc/source/index.rst) and add any authors not yet acknowledged.
* [x] Use the opportunity to update the [`.mailmap file`](https://github.com/nipy/nibabel/blob/master/.mailmap) if there are any duplicate authors listed from `git shortlog -nse`.
* [x] Check the copyright year in [doc/source/conf.py](https://github.com/nipy/nibabel/blob/master/doc/source/conf.py)
* [x] Refresh the [README.rst](https://github.com/nipy/nibabel/blob/master/README.rst) text from the `LONG_DESCRIPTION` in [`info.py`](https://github.com/nipy/nibabel/blob/master/nibabel/info.py) by running `make refresh-readme`.
* [x] Check the dependencies listed in [`pyproject.toml`](https://github.com/nipy/nibabel/blob/master/pyproject.toml) (e.g., `dependencies`, `project.optional-dependencies`) and in [`doc/source/installation.rst`](https://github.com/nipy/nibabel/blob/master/doc/source/installation.rst) and in [`requirements.txt`](https://github.com/nipy/nibabel/blob/master/requirements.txt). They should at least match. Do they still hold? Make sure nibabel on GitHub Actions is testing the minimum dependencies specifically.
* [x] Make sure all tests pass (from the nibabel root directory): `tox`

Adapted from http://nipy.org/nibabel/devel/make_release.html#release-checklist

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `298788070a36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.