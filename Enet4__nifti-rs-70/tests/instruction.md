# Issue

**Title:** Add ReaderOptions and ReaderStreamedOptions

## Description

- Make InMemNiftiObject's methods privates
- Make StreamedNiftiObject's methods privates
- Remove the deprecated new_from_stream method
- Apply one fix on header when requested
- Fix all tests

Sorry, there was some automatic formatting when I saved (like in lib.rs). The other concerns I have at the moment are:
- One can still read the complete image by creating a File, reading the header, then reading the volume. Should I block that? By making some methods `pub crate` in `header.rs` and `volume/inmen.rs`?
- I don't want to block it too much because we want a way to read only the header without reading the complete image. We're already using this in our codebase. It's practical and much faster.
- I separated the features in `ReaderOptions` and `ReaderStreamedOptions` to avoid repetitive names `read_file_streamed/_rank/_pair/_pair_rank` (I can at least remove the 'streamed' in all names. But it does create some code copy. If we ever add some general methods, like `read_header`, the code will be exactly the same. So, I'm not sure it was the right decision.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ecea0414c1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.