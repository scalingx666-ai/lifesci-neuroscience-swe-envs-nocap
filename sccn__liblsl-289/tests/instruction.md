# Issue

**Title:** inlet: fix bad_weak_ptr abort during inlet destruction

## Description

Fixes the intermittent `std::bad_weak_ptr` → `std::terminate/SIGABRT` on inlet destruction reported in #220: `resolve_attempt_udp::cancel()` calls `shared_from_this()` on an attempt that has no live shared owner, and the exception skips the watchdog `join()`, leaving `~inlet_connection` to destroy a joinable `std::thread`. #220 was closed by #246, but #246 only fixes the outlet-side garbage-sample bug (`consumer_queue.h` / `tcp_server.cpp`) and never touches the inlet resolver-cancellation path, so the crash still reproduces on current main.

Those changes have been suggested by Claude (Fable) following digging in a CI failure on  This changes are outside my expertise and comfort zone, thus up to you to merge or iterate on those changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e651023ca679`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.