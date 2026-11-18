# Issue

**Title:** Project.toml: drop the superseded [extras] block, complete the compat…

## Description

… entries

A test/Project.toml has existed since eeb893c, and Pkg uses it in preference to [targets] whenever it is present. The [extras] and [targets] blocks have therefore been inert since then, and the GZip listed in them was never installed for a test run. Nothing in the repository references GZip outside those two lines; the gzip handling in src goes through CodecZlib and TranscodingStreams. Leaving that in place is worse than not having it, because it reads as the live declaration of the test dependencies while the real list sits in test/Project.toml.

Base64 and Mmap gain compat entries. They are the only dependencies without one, and tooling does not exempt standard libraries: Aqua's deps_compat check reports both as missing, since it exempts nothing that is not in an explicit ignore list. "1" is the value the rest of the ecosystem uses for these two. This constrains nothing that was not already constrained, because the julia entry decides which standard library ships.

The julia entry is collapsed to its meaning. Caret semantics make "1.10" cover everything below 2.0 on its own, so listing 1.11 and 1.12 alongside it added nothing; the registry already normalises the entry to "1.10.0 - 1". Written this way nobody has to append a version here for each Julia release.

No change to the supported version range, and the test dependencies resolve exactly as before.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d1eed4ed0aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.