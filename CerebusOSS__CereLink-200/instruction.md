# Issue

**Title:** Add the hardware soak harness

## Description

Adds `pycbsdk/src/pycbsdk/cli/soak.py` and its test plan, by @chittti. Now that #190 has merged, this reduces to the harness itself: 4 files, no source changes.

## What it is

A one-command hardware soak for one Central-version/device combination. It prints a PASS/FAIL/WARN table plus a checklist of the values it read, for eyeballing against Central's GUI.

```bash
python -m pycbsdk.cli.soak --device LEGACY_NSP --central 7.0 --intense
python -m pycbsdk.cli.soak --device HUB1 --central 7.8 --intense
python -m pycbsdk.cli.soak --device HUB1 --native --intense     # Central closed
```

It targets what CI cannot reach: a real Central's bytes against the adapter layouts, receive-ring wrap crossings against a real writer, and ticks-to-nanoseconds conversion on non-Gemini hardware. Soak length is computed from the measured packet rate and the ring size for the selected version.

## Why it is worth landing

It found real defects. Running it against two Gemini hubs and a Gemini NSP surfaced the channel-space truncation, the instrument routing failure and the clock-estimator gaps now fixed in #195 — none of which unit tests could have caught, because they need a real Central with more than one instrument attached.

## Fixes included beyond the original

Four changes on top of @chittti's work, from running it on Gemini hardware (`a992ab4`):

- `phase_label_edges` restored the original label **outside** its `try`, so a failing restore aborted the whole run — every later phase was skipped. `phase_write_matrix` already guards its equivalent restore; this matches it.
- `sweep/matching-ids` required a non-zero FRONTEND count. A Gemini NSP is I/O-only and correctly has none, so it failed on healthy hardware while `sweep/bulk-labels` passed on the same emptiness. Now compares the two views.
- The overrun stall was capped at 120 s, which assumes ≥2.2 MB/s for a 256 MiB ring. An NSP streaming 16 analog channels at 1.45 MB/s needs ~277 s, so the cap reported "no error" against hardware behaving perfectly. Derived from the measured rate now, skipping with a WARN when even that is not enough.
- Added `sweep/group-membership-agrees`, cross-checking `get_group_channels()` against a per-channel `get_channel_smpgroup()` scan. A HUB2 CENTRAL CLIENT session passed every other check in that phase while serving HUB1's configuration — the three paths compared by `sweep/cross-path` agreed with each other and were all wrong. These two genuinely disagreed, and nothing compared them.

## Results on Gemini hardware

STANDALONE `--native --intense`: **80/80** (HUB1), **81/81** (HUB2). The NSP reports 75/1/2, both failures being the harness assumptions fixed above.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8eb598cc65cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.