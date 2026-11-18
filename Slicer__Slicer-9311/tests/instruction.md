# Issue

**Title:** ENH: Pre-warm the macOS first-launch library scan behind a progress splash

## Description

## What this is

The first time each newly built or freshly downloaded shared library is loaded, the operating system inspects it and caches the verdict per file — on macOS a `syspolicyd` / **XProtect** security scan (~0.13 s per Mach-O, measured), on Windows an antivirus scan, cold filesystem caches everywhere. Slicer ships **~900 libraries**, so the first launch of a new build or a freshly downloaded copy can spend **a minute or two** on this at near-zero CPU, showing a blank Dock icon and no window, before startup even really begins. Later launches take seconds.

This adds a **pre-warm** that performs that inspection up front, behind an optional native progress splash, so the wait is visible and explained instead of a frozen/absent window.

### Honest scope: this is a first-launch **experience** fix, not a speedup

The security scan is **serialized by the system daemon** (single-threaded system-wide — verified: an 8-worker parallel version gave *no* speedup and was removed). So the pre-warm **does not make the total launch faster** — the cost is unavoidable. What it buys:

- the unavoidable wait becomes a **native progress window with an accurate ETA** ("Preloading 3D Slicer libraries… about a minute left") instead of a blank screen, and
- a **stamp file limits the work to when it's actually needed**: after a new build or download, and once per session after a reboot (which clears the OS caches). The splash is only shown when the run is predicted to exceed **2 seconds**, so ordinary launches stay silent.

## How it works

- **macOS primitive:** each library is mapped with `PROT_EXEC`, which makes the kernel run the *identical* scan and cache it — without `dlopen`, dependency resolution, or spawning a process. (Other platforms load in a disposable worker.)
- **`SlicerPrewarm.py`** — the sequential warm-up, a boot-session-aware stamp, and native progress splashes for macOS (AppKit), Windows (user32), and X11, all drawn through `ctypes` with **no GUI-toolkit dependency**.
- Three entry points: an automatic **`prewarm` build target** (freshly built libs at end of build), the **macOS bundle bootstrap** (a small compiled `CFBundleExecutable` shim that pre-warms before `exec`-ing the real app, preserving the process identity), and an **in-app hook** for extension / additional-module paths known only at runtime.
- Disable with `SLICER_DISABLE_STARTUP_PREWARM=1`.

## Relationship to prior discussion

Addresses the first-launch experience described in **#9203** (Improve startup speed) and **#8638** (Improve Slicer startup experience). Concrete points from that discussion this acts on:

- **macOS has no launcher** (and therefore no launcher splash) — so the launcher-splash handoff fix (#8808, Win/Linux) doesn't cover the macOS cold first launch. The bundle bootstrap here is the macOS analog: it puts *something* on screen during the wait.
- The reported failure mode — *"nothing appears for ~10 s, the user thinks it failed and relaunches, producing a 2nd instance"* — is directly what the progress splash is meant to prevent on first launch. (This PR does **not** add single-instance locking; that's a separate mitigation.)
- Per the discussion, this intentionally **does not** add an XML launcher↔app progress protocol — it uses a self-contained native splash instead.

Complementary to **#9306** (lazy VTK Python modules), which reduces the *actual* Python-import work at every startup. That PR is a genuine `PERF` speedup; this one is first-launch transparency for a cost that can't be reduced — the two are independent (no shared files) and address different parts of the same "startup feels slow" problem, which is why they're separate PRs.

## Status / notes

- Draft. Primarily exercised on macOS arm64; the Windows/X11 splashes are implemented but need testing on those platforms.
- The pre-warm is a no-op on a normal warm launch (stamp check only) and never blocks or aborts startup — any failure (unwritable stamp, splash init failure, etc.) is swallowed.
- Not addressed here (possible follow-ups from the same discussion): skipping instantiation of testing modules when developer mode is off, and preventing a second instance during a slow first launch.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cecaf6792162`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.