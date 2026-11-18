# Issue

**Title:** Fix docstrings that name parameters the functions do not have

## Description

Six Parameters entries name an argument the function doesn't accept, so following the docs and passing that keyword raises `TypeError`.

| file | function | documented | actual |
|---|---|---|---|
| `fileutils.py` | `read_zt_byte_strings` | `f` | `fobj` |
| `nifti1.py` | `Nifti1Extensions.count` | `code` | `ecode` |
| `processing.py` | `adapt_affine` | `n_dims` | `n_dim` |
| `volumeutils.py` | `int_scinter_ftype` | `default_out` | `default` |
| `wrapstruct.py` | `guessed_endian` | `wstr` | `mapping` |
| `cifti2/cifti2.py` | `Cifti2NamedMap.metadata` (setter) | `meta` | `metadata` |

Two of them carry their own evidence:

- **`read_zt_byte_strings`** — the summary line already says *"Read zero-terminated byte strings from a file object `fobj`"*, so only the Parameters entry is out of step.
- **`guessed_endian`** — the Returns text also referred to ``wstr`` (*"Guessed endianness of binary data in ``wstr``"*), so I updated that reference as well; that's why `wrapstruct.py` shows two changed lines.

One I deliberately left alone: `Cifti2Header.metadata` has the same `meta : Cifti2MetaData` entry, but that setter genuinely takes `meta`, so it's correct as written. Only the `Cifti2NamedMap` setter, whose parameter is `metadata`, is changed.

Also checked and not touched: `make_datasource` and `datasource_or_bomber` document `data_path`, which isn't in the signature but is a documented `**kwargs` key ("`data_path` is the only allowed keyword argument"), so those are fine.

Docs only, no behaviour change. `ruff check` and `ruff format --check` are clean on all six files, and `test_volumeutils.py`, `test_wrapstruct.py` and `test_processing.py` pass (83 tests).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `699b9923e846`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.