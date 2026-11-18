# Issue

**Title:** COMP: Find Threads before TBB so TBBConfig imported targets resolve

## Description

Find `Threads` before `find_package(TBB)` so TBB's imported target resolves during a CMake reconfigure of the inner build.

<details>
<summary>Root cause</summary>

The SuperBuild-installed `TBBConfig.cmake` declares `TBB::tbb` with
`INTERFACE_LINK_LIBRARIES "$<LINK_ONLY:Threads::Threads>;..."` but never calls
`find_package(Threads)`. When a consumer reconfigures, CMake fails generation with:

```
The link interface of target "TBB::tbb" contains:
    Threads::Threads
  but the target was not found.
```

Calling `find_package(Threads REQUIRED)` before the TBB lookup defines the
`Threads::Threads` imported target so the interface resolves. One-line, no
behavior change.

</details>

<!--
provenance: claude-code session 2026-06-20 (BRAINSTools updates)
symptom: inner-build CMake regenerate-during-build failed at TBBTargets.cmake set_target_properties (Threads::Threads not found)
file: BRAINSTools.cmake (USE_BRAINSABC TBB block)
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de4d1ec16394`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.