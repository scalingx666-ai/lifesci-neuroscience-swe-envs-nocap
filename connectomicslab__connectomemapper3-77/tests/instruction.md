# Issue

**Title:** ENH: Update data provenance tracking functionality with Datalad

## Description

This PR is dedicated to the update data provenance tracking functionality with Datalad in the GUI.

It includes:
* Update in `environment.yml`: 
  * `datalad[full]==0.13.0` to `datalad[full]==0.14.0`
  * `datalad-container==0.3.1` to `datalad-container==1.1.2`
  * `datalad_neuroimaging==0.2.0` to `datalad-neuroimaging==0.3.1`
  * `git-annex=8.20200617` to `git-annex=8.20210127`

* Update and review datalad commands in `cmp/bidsappmanager/gui.py ` with colored print of executed datalad commands
* Update tutorial on using CMP3 and Datalad for collaboration
* Fix the dialogs that select files in the BIDS App GUI to be in "open" mode instead of "save as" mode

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `130f2171f198`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.