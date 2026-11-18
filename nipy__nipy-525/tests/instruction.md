# Issue

**Title:** Replace doc-files with doc_files in setup.cfg

## Description

Fixes:

```
        ********************************************************************************
        Usage of dash-separated doc-files will not be supported in future
        versions. Please use the underscore name doc_files instead.

        By 2023-Sep-26, you need to update your project and remove deprecated calls
        or your builds will no longer be supported.

        See https://setuptools.pypa.io/en/latest/userguide/declarative_config.html for details.
        ********************************************************************************
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2e068bec399`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.