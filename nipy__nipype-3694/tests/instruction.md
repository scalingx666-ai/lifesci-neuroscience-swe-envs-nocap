# Issue

**Title:** REL: 1.9.0

## Description

Preparation for the 1.9.0 release. The 1.8.7 release got bogged down with the tutorial failures, but I'm just going to press ahead because there are a lot of things that need releasing. If tutorials start being maintained again, we can re-add that to our process.

Please note that nipype's support level is *very low*.

The following users have made their first contributions:

* @asmacdo made their first contribution in 
* @yibeichan made their first contribution in 
* @mmbannert made their first contribution in 
* @mauriliogenovese made their first contribution in 
* @l-espana made their first contribution in 
* @jadecci made their first contribution in 
* @manuegrx made their first contribution in 
* @pvelasco made their first contribution in 
* @dependabot made their first contribution in 
* @stebo85 made their first contribution in 
* @zachlindsey made their first contribution in 
* @teanijarv made their first contribution in 
* @lbutry made their first contribution in 
* @penguinpee made their first contribution in 
* @bogpetre made their first contribution in 
* @scott-huberty made their first contribution in 
* @adamnarai made their first contribution in 

Please let me know if you would like to be credited in releases, and if so what name, ORCID and affiliation you would like. See https://github.com/nipy/nipype/blob/master/.zenodo.json for examples. If you have already added yourself, no need to respond.

Quick issues/PRs:

* ... Please let me know if you want to try to merge something in before the release.

## Release checklist

* [x] Merge pending PRs
* [x] Update changelog
* [x] Update .mailmap
* [x] Update .zenodo.json
* [x] Set release number in `nipype/info.py`
* [x] Update `doc/interfaces.rst` with previous releases

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e07301d1a557`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.