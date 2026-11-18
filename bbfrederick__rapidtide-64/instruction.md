# Issue

**Title:** [STY] Address style issues in correlate.py

## Description

<!---
This is a suggested pull request template for rapidtide.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
http://rapidtide.readthedocs.io/en/latest/contributing.html#pull-requests
-->

Closes None. This is an _initial_ attempt at _starting_ to address the style issues identified by the linter, and by `flake8-docstring`, which I use in my editor.

If this PR looks okay to you, I can do something similar to other modules over time. If not, that's cool too.

Changes proposed in this pull request:

- Remove unused conditional imports for `memory_profiler` and `nibabel`.
     - On a related note, `nibabel` is a required dependency at this point, so I think you can get rid of any `nibabel`-related conditional imports across the package.
- Add module-level docstring.
- Simplify (hopefully) fftpack import. It was raising the following issue in the linter: `F811 redefinition of unused 'fftpack' from line 26`.
- Add docstrings where I could. There are a few functions where I couldn't infer the actual purpose, so I said something useless like "Apply/Calculate something." I will add inline comments to request clarification.
- Move some comments to the docstrings where it seemed appropriate.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46499734084c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.