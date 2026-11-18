# Issue

**Title:** Fix: correct notation for longitudinal arg value

## Description

fix a trivial issue when setting the longitudinal argument:

```bash
smriprep --longitudinal /in /out participant

The "--longitudinal" flag is deprecated. Use "--subject-anatomical-reference unbiased" instead.
Traceback (most recent call last):
  File "/home/mk/.local/bin/smriprep", line 7, in <module>
    sys.exit(main())
             ~~~~^^
  File "/home/mk/work/src/smriprep/src/smriprep/cli/run.py", line 37, in main
    opts['longitudinal'] = True
    ~~~~^^^^^^^^^^^^^^^^
TypeError: 'Namespace' object does not support item assignment
```

We have to use the dot notation to change argparse arg's namespace attributes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bcb3a7331312`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.