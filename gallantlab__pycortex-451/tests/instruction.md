# Issue

**Title:** FIX copy filestore in wheel

## Description

Probably 
Related to #433

**Before:** The sdist archive (`.tar.gz`) available on Github or PyPI correctly contains the filestore. However, when `pip` compiles the archive, it creates a wheel (`.whl`) without the filestore, and caches it for future re-install. Installing from the wheel would then fail to initialize the filestore (subject database and colormaps).

**After:** The wheel now contains the filestore, which is copied in the right location during the install.

Tested on my machine, installing either from `.tar.gz`, from cached `.whl`, or from manually created `.whl`.
- filestore copied to: `.../tomdlt/miniconda3/envs/py37/share/pycortex`
- with `pip install --user`, filestore copied to: `.../tomdlt/.local/share/pycortex`
___
I also removed the `MANIFEST` file, which seems unused or redundant with `MANIFEST.in`.
(Also not sure why fae450ec821b0bfc2ebbf6b69a52104a28209139 is a different commit than 5a9d07f9a8c319bcc8f77ccf0bdc258ce4e954c1.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fae450ec821b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.