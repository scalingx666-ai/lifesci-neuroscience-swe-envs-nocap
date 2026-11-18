# Issue

**Title:** BF: close the reader pipe at EOF so an abandoned result generator does not leak FDs

## Description

-

A consumer that stops reading a runner result generator early (`any()`, `next()`, `break`) never reaches the stdout/stderr EOF events, which are where `ThreadedRunner.remove_file_number()` closes the pipes. So the pipe FDs leak until the generator happens to be garbage collected. `GitRepo.is_with_annex()` is one example.

`ReadThread.read()` now closes its pipe as soon as it sees EOF, the same way it already does when a read fails. Closing twice is harmless: `remove_file_number()` and `_ensure_closed()` close again later, and `FileIO.close()` is idempotent. Closing at EOF can't cause the SIGPIPE that `_handle_process_timeout()` warns about, because EOF means every writer has already closed its end. A child that keeps running after being abandoned keeps its pipes until it exits, and its output is still buffered, as before.

Tests: `test_abandoned_generator_releases_pipes` (from the review) takes one result, abandons the generator, and checks that both pipes are closed once the child has exited. It fails on `maint` and passes with this change. `datalad/runner/tests` and `datalad/tests/test_cmd.py` pass apart from `test_asyncio_loop_noninterference1`, which fails the same way without the change on my machine. `datalad/support/tests/test_gitrepo.py -k "not annex"` passes.

AI-assisted (Claude). I reviewed the code and ran the tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e10c97bca16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.