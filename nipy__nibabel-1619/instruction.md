# Issue

**Title:** DOC: name the Pointset coordinates parameter as the dataclass defines it

## Description

`Pointset` is a dataclass whose field is `coordinates`, so the generated `__init__` takes `coordinates` and the body reads `self.coordinates`. The Parameters section documented it as `coords`, which means `Pointset(coords=...)` raises TypeError for anyone following the docstring.

One line, no behaviour change. I left the changelog alone deliberately: the developer guide scopes it to "macroscopic and/or important changes" with implications for performance or validity, which this is not.

How it was tested:

- `pytest nibabel/tests/test_pointset.py`: 32 passed.
- `pre-commit run --files nibabel/pointset.py`: ruff check, ruff format and codespell all pass. The mypy hook reports one pre-existing error in `nibabel/_compression.py` about missing library stubs, which appears identically with my change stashed and is an artifact of my local environment rather than anything in this diff.

One more thing I noticed but did not touch, since the right fix is your call: `Pointset.get_coords` documents a `name` parameter ("Select a particular coordinate system if more than one may exist"), and the signature is `get_coords(self, *, as_homogeneous=False)`. There is no other definition of `get_coords` in the repository, so nothing accepts `name` today. It reads like an intended API rather than a typo, so removing the entry and adding the parameter are both defensible.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `084aa54db1db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.