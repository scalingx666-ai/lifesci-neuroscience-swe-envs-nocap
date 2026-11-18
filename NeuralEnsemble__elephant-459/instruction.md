# Issue

**Title:** Enh/add zenodo json

## Description

# adds .zenodo.json
With this PR a `.json` file containing metadata is added.

In previous releases, Zenodos automatic metadata collection tool was used, which gave mixed results. 
(see: elephant 0.9.0 https://doi.org/10.5281/zenodo.4271489)

Adding `.zenodo.json` will overwrite the metadata for the specified fields. This aims to get a list of authors including their [ORCiDs](https://orcid.org/). A good example is given by NEST. 
(see: https://doi.org/10.5281/zenodo.5886894)


**background**
Zenodo automatically extracts metadata about a release from GitHub APIs. For example, the authors are determined from the repository’s contributor statistics. To overwrite some of the default metadata that would come from a regular GitHub release this PR includes a `.zenodo.json` file at the root of your GitHub repository, to manually control the list of contributors and other data fields.

- [x]  `.zenodo.json` is not included into the source package (no changes in `MANIFEST.in` required)

**list of contributors**
The current list of contributors was extracted from the commit history of NeuralEnsemble/elephant (master) since *Release 0.10.0 #407* and all open PRs labeled Milestone v.0.11.0. (see below)

**If an author has been forgotten or an error in name or orcid has crept in, please let us know. Once v0.11.0 is released no changes can be made to the DOI and its corresponding metadata** 

# Contributors to release 0.11.0
 [Enhancement] Change test framework from Nose to pytest #413
 - @kohlerca

Changed __repr__ in BinnedSpikeTrain to support quantities<0.12.4 #418
- kohlerca

[Enhancement] Set complexity dtypes for memory efficiency #412
- @morales-gregorio
- Kleinjohann

Optimized SPADE analysis #419
- @pbouss
- @stellalessandra
- @mdenker
- @Kleinjohann
- Pilz, Sarah
- Porrmann, Florian


Fixing doc builds #429
- mdenker

Fixed random seed selection to use numpy #430
- mdenker

Fix proposed by #420. #421
- mdenker

Update of copyright year #433
- @rjurkus

Various Features Spike Train Generation #416
- pbouss
- stellalessandra

BUG-Fix #424: t_start information was lost while transposing lfp #432
- @ojoenlanuca
- @rgutzen

Fixed test suite building for multiple modules #426
- rjurkus

Fix for figures in the Granger causality tutorial #434
- rjurkus

Updated zscore for in-place operations #440
- kohlerca

 Issue with units in BinnedSpikeTrain #425
- @PaulinaDabrowska

updated spade tutorial to work with viziphant 0.2.0 (#88) #444
- @Moritz-Alexander-Kern

Add zenodo badge to README.md #445
- Moritz-Alexander-Kern
- mdenker

Fix pytest #449
- Moritz-Alexander-Kern
- mdenker

Feature/multitaper psd estimate #458
- rjurkus
- @ackurth

Add a function to discretise spiketimes #454
- Kleinjohann

*will be merged for 0.11.0* \
Fix/instantaneous rate #453
- Moritz-Alexander-Kern

Enh/add dois to documentation #456
- Moritz-Alexander-Kern

Support SpikeTrainList object in Elephant #447
- mdenker

Fixes neo_tools unit tests to work with Neo 0.10.0+ #446
- mdenker

Fix/update tutorials asset and unitary_event_analysis to use nixio 1.5.0 #441
- Moritz-Alexander-Kern

Boundary correction rate for firing rate estimator with Gaussian KDE #414
- pbouss
- stellalessandra

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0074a14bf638`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.