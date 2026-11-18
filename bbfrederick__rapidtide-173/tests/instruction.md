# Issue

**Title:** Reformat theory of operations and add BibTeX citations

## Description

Closes none. Apologies for the second unsolicited PR in one day.

Changes proposed in this pull request:

- Add `sphinxcontrib-bibtex` to the list of documentation dependencies and configure it to allow in-text citations in the documentation.
- Reformat theoryofoperation.rst a bit to split up lines on punctuation. 
- Add a tip that increasing the number of passes will improve your results. **I don't actually know if this is true.**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca10b9e0e99a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.