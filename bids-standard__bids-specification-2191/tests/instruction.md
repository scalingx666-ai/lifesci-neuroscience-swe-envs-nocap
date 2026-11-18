# Issue

**Title:** [ENH] Add phenotype and rawbids directories to "study" datasets

## Description

This is a continuation of discussion on BIDS `DatasetType` started in #1972 and #2185.  The proposed `DatasetType`s include: bids-`study`, `raw`, and `derivative`. 

I think this is a fantastic idea with the capacity to curate modular and nested standardized datasets. 

However, the directory layout for `bids-study` proposed in #2185 is suboptimal from the data visibility perspective. Currently, the `bids-study` does not have a root-level subdirectory for `bids-raw` dataset. Based on previous conversations it was suggested that `bids-raw` dataset can be stowed inside `sourcedata` dir. This _hidden_ location for a valid and probably the most common `DatasetType` is probably not ideal and will confuse new users. 

So, I would like to make a case for treating `sourcedata`, `bids-raw`, and `bids-derivative` with equal importance by putting them on the same root-level inside the `bids-study` directory tree. In my experience this is more intuitive and helpful for data management of neuroimaging studies, where potentially different people will handle these three `DatasetType`s. 

The suggested `bids-` prefix for these directories is mostly to avoid possible confusion between `source` vs `raw` data connotations from past discussions and to indicate each of them can be stand-alone BIDS datasets. 

Happy to hear your thoughts @michellewang, @jbpoline, @yarikoptic, @effigies, @mathdugre, @julia-pfarr, @nburgos, @AliceJoubert, @Adam-Ismaili-92, @surchs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6764039d06a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.