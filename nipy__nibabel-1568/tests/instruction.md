# Issue

**Title:** BF: Reject undersized NIfTI extensions before reading payloads

## Description

NIfTI extension sizes include the eight-byte extension header. The reader currently passes `esize - 8` directly to `fileobj.read()`. For invalid sizes such as zero or -16, this becomes a negative read length and ordinary binary streams consume the entire remaining input before the existing content-length check raises `HeaderDataError`.

Reject `esize < 8` before reading the payload. These inputs already fail; this makes the rejection early and avoids the unnecessary read. Existing tolerant handling of positive sizes that are not multiples of 16 remains unchanged. This is a malformed-input robustness fix, not a demonstrated exploitability claim.

The synthetic `BytesIO` regression now checks zero and negative lengths in both little- and big-endian headers. It derives the reader's byte-swap flag from `native_code` and requires the stream to remain positioned at byte eight after rejection. The original native-endian before/after failure evidence is retained; the pre-fix check was not rerun.

Validation: `PYTHONPATH=. /opt/homebrew/opt/python@3.15/bin/python3.15 -m pytest -q nibabel/tests/test_nifti1.py::test_undersized_extension_does_not_read_payload` — 4 passed, 19 warnings (18 existing unknown-`thread_unsafe`-marker warnings and one pydicom `ByteString` deprecation warning). Both encoded byte orders were exercised on the local host; this is not a run on big-endian hardware. No imaging files were read, and no broader suite was run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f7c14298ab8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.