# Issue

**Title:** Zhang2017: raise on files with an unexpected channel layout instead of guessing names

## Description

## Problem

`Zhang2017` reads BCI2000 `.dat` files. Before this change, `_bci2000_channel_names` picked the channel names in one of three ways:
- the header's `ChannelNames` when it was filled in, with a `standard_1005` montage;
- the EGI order `E1`..`E16`, `E28` when the file has 17 channels, with EGI HydroCel-32 positions;
- generic `EEG001`.. names otherwise.

Any file that hit the first or third branch would have given its subject a channel set different from every other subject's. MOABB paradigms then either stack mismatched channels or fail in `concatenate_epochs`.

## What the released data contain

I checked this on Voyager against the released `KI.rar` (figshare 9700792):
- All 180 `.dat` files (12 subjects) have `Source list ChannelNames= 0` (empty) and `SamplingRate= 1000Hz`.
- A per-subject inventory with `get_data` (cache off) on develop loads 12/12 subjects and 180 runs. Every run has the same 17 EEG channels (`E1`..`E16`, `E28`) at 1000 Hz.

So develop returns consistent data today, and only the EGI branch is ever used. The other two branches only ran on files this loader was never checked against, and they silently produced a different channel set.

## Fix

- A file with a channel count other than 17, or with its own `ChannelNames`, now raises a `ValueError` naming the file and the expected layout, instead of getting guessed names.
- The `standard_1005` montage branch that went with header names is removed.
- The data returned for the released files are unchanged, so existing caches stay valid.
- `whats_new` (Bugs) has an entry.

## Verification

**Real data** (Voyager, all 12 subjects, cache off, this branch): 12/12 subjects and 180 runs load, with 1 channel set (17 EEG, EGI order) and 1 rate (1000 Hz). This matches develop exactly.

**Offline tests.** New `moabb/tests/test_zhang2017_channels.py` uses a synthetic BCI2000 reader. It covers:
- the released layout getting the EGI names, finite positions and µV→V gain scaling;
- 16, 18 and 32 channels raising;
- header channel names raising;
- an all-empty `ChannelNames` list counting as no names.

The new test file passes locally, and pre-commit is clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b09bb951ab58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.