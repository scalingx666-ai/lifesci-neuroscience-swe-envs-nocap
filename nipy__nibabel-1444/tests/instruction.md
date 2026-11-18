# Issue

**Title:** Use `compression.zstd` or `backports.zstd` in preference to `pyzstd`

## Description

Hi @effigies, I hope you're well! Also pinging @vanandrew, as this builds on the work you did in #1005.

This PR adjusts `nibabel` so that it will use one of  `compression.zstd`, `backports.zstd`, or `pyzstd`, in that order of preference, for handling zstandard-compressed files.

I've been playing around with adding zstandard support to the core FSL tools, and noticed that `nibabel` currently relies on `pyzstd`. Support for this format is now built into Python as of 3.14 via `compression.zstd`, and the recommendation for older Python versions is to use the `backports.zstd` package, as outlined in this handy migration guide:

https://pyzstd.readthedocs.io/en/stable/


1. To handle conditional import of one of several optional modules, I've adjusted the `nibabel.optpkg.optional_package` function to accept either a single module name, or a sequence of names - it will try to import each in order, returning the first one that succeeds.

2. I moved `_zstd_open`, `_gzip_open`, and `DeterministicGzipFile`  from `nibabel.openers` into `nibabel._compression`, as they seem like a better fit there.

3. The `compression.zstd.ZstdFile` API differs very slightly from the `pyzstd.ZstdFile` API - the latter expects an overloaded `level_or_option` parameter, whereas the former expects separate `level` / `option` parameters. I've adjusted nibabel so that it will accept all three, and will pass the appropriate parameter to the underlying library.

4. I've tried to update the metadata files (`uv.lock`, `tox.ini` etc), but am not particularly familiar with how the project is managed these days, so let me know if there's anything I ned to fix, or anything else that is needed.

Thanks!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d537d3361b25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.