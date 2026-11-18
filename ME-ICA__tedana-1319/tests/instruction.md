# Issue

**Title:** Deprecate support for z-concatenated inputs

## Description

As discussed at in our dev call #1312, we do not think anyone is using the zcat option for input anymore. Since creates a non-trivial amount of special cases and may cause problems with some future changes, we plan to deprecate this option.

Changes proposed in this pull request:

- If a user provides zcat data as input, it puts up a warning that this option will be deprecated at the end of 2026 and asks the user to contact the tedana developers (so that we know if anyone is still using this option)
- Removes the descriptive text for the zcat option from the command line help (though it will still be functional). It is still mentioned in function docstrings.
- The command line doc strings implied that the echoes and data files could be in any order, but the function docstrings said they need to be in ascending order. I'm not sure if any order actually works in all our code, so I tweaked the command line docstring to also specify ascending order.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88959f38b919`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.