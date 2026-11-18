# Issue

**Title:** Bug fix: restore Apple Silicon MEX files deleted by the FieldTrip sync and protect them

## Description

Restores the Apple Silicon `bemcp` MEX files and stops the FieldTrip sync from deleting them again.

## Problem

- SPM built `external/bemcp/bem_*.mexmaca64` itself in 9309176e5 (2022-11). FieldTrip has never shipped Apple Silicon builds of `bemcp`.
- When the sync was extended to `external/bemcp`, its `rsync --delete` removed all eight files in 2ed76b1e1 (2026-03).
- `bemcp` has no `.m` fallback. On Apple Silicon, FieldTrip's BEM head model fails with "the BEMCP toolbox is not available". This affects M/EEG source reconstruction in MATLAB and in the Apple Silicon standalone.
- In the weekly full test tier, `test_regress_spm_meeg` has failed on every Apple Silicon job since then.

## Changes

- **Restore the eight files from `2ed76b1e1^`.** They are byte-identical to the originals. The only source changes since that build are a removed copyright header and a comment edit, so they still match the source.
- **Add `P bem_*.mexmaca64` to `.github/fieldtrip-mex-excludes`.** Both sync steps merge this file.
  - These eight files now survive `--delete`, and would still be updated if FieldTrip ever ships them.
  - The rule is deliberately narrow. A blanket `P *.mexmaca64` would keep Apple Silicon files that FieldTrip deletes or moves, and MATLAB prefers a MEX file over the updated `.m` next to it. 2ed76b1e1 shows FieldTrip does move such files: for example, `read_16bit` went from `fileio/private` to `forward/private`.
  - All other Apple Silicon MEX files keep following upstream, deletions included.
- The rule can be removed once FieldTrip ships these builds (fieldtrip/fieldtrip#2496).

## Test plan

- [x] rsync 3.4.1 with the workflow's flags and both real filter files, main sync and per-package sync, 16 cases:
  - SPM-only `bem_*.mexmaca64` is kept;
  - `bem_*` files present on both sides are updated;
  - new upstream files are added;
  - other SPM-only mexmaca64, mexmaci64, mexw64 and non-MEX files are deleted;
  - a folder FieldTrip removed that holds only a mexmaca64 file is deleted;
  - mexw32 files and `test/` stay excluded.
- [x] Control run without the rule: exactly the SPM-only protected cases fail.
- [ ] Full test tier (weekly schedule, or a manual Tests run): `test_regress_spm_meeg` should pass on the Apple Silicon jobs. This also confirms that the 2022 builds load on current MATLAB releases. PR CI does not cover it, because the quick tier runs regression tests on Linux only.

## Apple Silicon read_16bit and ft_getopt

The same sync commit also deleted SPM's Apple Silicon copies of `ft_getopt` (four folders) and `fileio/private/read_16bit`.

- FieldTrip ships these `mexmaca64` builds in `src/`, `forward/private` and `private/`, but not in these folders. The `mexa64`, `mexmaci64` and `mexw64` builds are present in all of them.
- `fileio/private/read_16bit` has no `.m` fallback, so EDF and BDF reading failed on Apple Silicon. `ft_getopt` has one, so for it the MEX copies only restore speed.
- The added files are byte-identical copies of FieldTrip's current `src/` builds.
- Anchored `P` rules in `.github/fieldtrip-sync-filters` keep exactly these five paths. Each line can go once FieldTrip ships that file.
- `fileio/private/solid_angle` is left out: FieldTrip removed the other platforms' builds from that folder too, and the `.m` there matches `src/`.

Tested with rsync 3.2.7 (the version on ubuntu-latest) and the real filter files:
- protected files without an upstream copy are kept (four tested);
- a protected file with an upstream copy is updated from it (one tested);
- an unlisted folder, the same file name in a deeper folder, and other platforms' files still follow upstream.
- A control run without the rules deletes exactly the four kept files.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdd127dcbc60`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.