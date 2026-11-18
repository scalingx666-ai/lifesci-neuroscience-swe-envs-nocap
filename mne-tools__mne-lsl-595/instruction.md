# Issue

**Title:** Recover dig, locations and projectors from an XDF description

## Description

The channel locations, integer FIFF codes, filters, SSP projectors and digitization were read only from a live `StreamInfo`, not from the dict returned when loading an XDF file, so they were lost on a round-trip through an XDF recording (e.g. the head digitization streamed by `neuromag2lsl`).

A `StreamInfo` description (XMLElement tree) and an XDF description (nested dict) carry the same structure. A small read-only adapter exposes the dict with the XMLElement read API, and the readers are now shared functions fed by both paths, so locations, codes, filters, projectors and digitization are recovered identically from either source. `get_channel_info()` and the dict path in `create_info()` both go through this one parser.

Also fixes a latent crash: channel types with no unit in the FIFF constants (e.g. `chpi`, `gof`) raised a `KeyError` during unit normalization, which silently defaulted channel names and types to integer IDs.

Adds a parity test that drives both paths from one description and asserts identical dig, locations, kinds and filters.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `105843e0b2fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.