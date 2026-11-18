# Issue

**Title:** [PR] Merge several fixes and improvements into dev for final testing

## Description

- Implement orientation flags for different orientations between subjects in ACE group comparison workflow ->  
- Fix and improve `lbls_stats` methods and implement as a module to `miracl stats`
- New docs section for `lbls_stats`
- Automatic version number incrementing for Sphinx `conf.py` based on `version.txt`
- Minor fix in `install.sh`
- Removed AI generated unittests and added unittest for new ACE orientation method

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1e910364589`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.