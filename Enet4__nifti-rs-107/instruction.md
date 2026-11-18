# Issue

**Title:** Update libs, run clippy

## Description

Hi @Enet4,

There wasn't much to release, but I think 2 years is enough for a new release :)

May I have your opinion on this warning?

    /// A trait that is both Read and Seek.
    pub trait ReadSeek: Read + Seek {}
              ^^^^^^^^
              trait `ReadSeek` is never used

I hesitate to remove it because it's a public trait. Anyone could use it... but Clippy should know better than to warn about an unused public trait? Do we simply tell clippy to ignore it?

Also, should we use a newer edition?

We're working on a release of our medical software and `nifti-rs` is the only crate left to update. When we merge this MR, could you please create a release?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `990add442201`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.