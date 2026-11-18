# Issue

**Title:** [FIX] Publish downloads only after a successful copy

## Description

`_download_file` currently opens the final output before copying the response. An interrupted read can overwrite a previously valid file or leave a partial file that subsequent calls accept as cached.

Stage the download in a private temporary directory beside the destination, close the completed stream, then replace the final path. A failed copy leaves an existing destination intact and cleans staging; a successful copy publishes the replacement on the same filesystem. Existing retry handling is preserved.

Validation: retained focused before/after evidence executed the source-defined helper with a real temporary filesystem and mocked streams, checking interrupted overwrite preservation, staging cleanup and successful replacement. This evidence was reused without rerunning unchanged checks; package tests and real dataset downloads were not run.

This does not add checksum validation, detect cleanly truncated responses, repair existing corrupt cache entries or serialize concurrent writers. Replacing a path changes inode and symlink behavior compared with truncating it in place.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `310079f1df07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.