# Issue

**Title:** Fix/docstring warnings 2

## Description

This PR fixes mostly indentation errors in several doc-strings. The content of the documentation is not affected.

**Before:**
when building the documentation with:
```
cd doc && make html
```
miscellaneous warnings appeared, most of them indentation errors. 

**With this PR:**
- fixed indentations


Only **4 Warnings**  remain: 
```
elephant/doc/reference/spade.rst:13: WARNING: duplicate label "Stella, 2019" for keys "citations-Stella2019_104022" and "spade-Stella2019_104022"
elephant/doc/reference/spike_train_generation.rst:43: WARNING: duplicate label "Staude, 2010" for keys "cubic-Staude2010_327" and "generation-Staude2010_327"
elephant/doc/reference/spike_train_surrogates.rst:12: WARNING: duplicate label "Louis, 2010" for keys "surrogates-Louis2010_127" and "surrogates-Louis2010_359"
elephant/doc/reference/unitary_event_analysis.rst:20: WARNING: duplicate label "Gr{\"u}n, 2002" for keys "unitary_event_analysis-Gruen02_43" and "unitary_event_analysis-Gruen02_81"

```

See log: [Warnings_log_8_make html_after_fix.txt](https://github.com/NeuralEnsemble/elephant/files/8512066/Warnings_log_8_make.html_after_fix.txt)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8aab43c8e5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.