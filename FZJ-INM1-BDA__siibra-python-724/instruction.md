# Issue

**Title:** Maint decoders

## Description

This PR refactors retrieval decoders to support both file- and byte-based decoding.

Key changes:

* Introduces a `Decoder` abstraction with `FILE` and `BYTES` input modes.
* Allows decoders to define kwargs passed to the underlying reader.
* Preserves meaningful file suffixes in cache filenames.
* Moves path-capable formats such as NIfTI, GIFTI, FreeSurfer annotations, HDF5/NWB, NumPy, and tabular data to file-based decoding where appropriate. Gzip-compressed variants (e.g. `.nii.gz`, `.csv.gz`) are handled natively by their underlying readers when given a file path.
* Removes unnecessary file → bytes → file roundtrips and enables file-backed/lazy access where supported.
* Keeps `find_suitable_decoder()` as a backwards-compatible wrapper around `Decoder.from_filename()`.
* Fixes `ZipfileConnector` to use `ZipfileRequest` directly instead of the bespoke `ZipFileLoader`, which was passing raw bytes to `FILE`-type decoders. `ZipfileRequest` correctly handles both decoder modes: `BYTES` decoders receive in-memory bytes, while `FILE` decoders have the zip member extracted to the siibra cache first and receive the path.
* Fixes `RepositoryConnector.get_loader` to pass the resolved `Decoder` directly to `HttpRequest` rather than wrapping it in a lambda, which also caused raw bytes to be passed to `FILE`-type decoders.
* Changes `ZipfileRequest` member matching from suffix-based to exact name matching, consistent with how `ZipfileConnector.search_files` returns full member paths.

Custom `func=` callbacks retain the existing byte-based behaviour.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9e3269664c72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.