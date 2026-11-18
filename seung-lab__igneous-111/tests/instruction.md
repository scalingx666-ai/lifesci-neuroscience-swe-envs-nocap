# Issue

**Title:** feat: bare-bones unsharded single-res multi-resolution meshes

## Description

- Adds support for generating unsharded *single res* multi-res meshes
- Adds spatial index generation for meshes (after the fact)
- Changes lots of CLI flags to show_default=True
- Adds option `igneous execute -x` which exits immediately after the last task is complete. This is only reliable for `fq://`. For `sqs://` this could result in early termination as `tq.enqueued` is only approximate.
- Changes MIME type `application/x-mapbuffer` to `application/x.mapbuffer` as the `-` is deprecated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6efc90a8425`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.