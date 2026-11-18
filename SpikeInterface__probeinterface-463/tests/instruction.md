# Issue

**Title:** Document contact_id uniqueness and enforce it on (probe_index, contact_id)

## Description

.

`Probe.__init__` and `set_contact_ids` both promised contact_ids are unique at Probe and ProbeGroup level, but cross-probe enforcement was removed in #229 and the docs were never updated. `_check_global_device_wiring_and_ids` validated only `device_channel_indices` despite its name covering ids.

This follows the design agreed in the thread: contact_ids stay unique within a Probe, and the key unique across a ProbeGroup is the pair `(probe_index, contact_id)`. Downloading the same probe model twice and putting both in a ProbeGroup keeps their contact_ids as they are, which is the expected behaviour.

`_check_global_device_wiring_and_ids` now validates the compound key, so the method matches its name. The `Probe.__init__` comment, the `set_contact_ids` docstring and the `get_global_contact_ids` docstring now describe the real semantics and point at `probe_ids` for disambiguating an id shared by several probes. Both checks now share a single `to_numpy` call rather than one each.

Tests: `test_duplicate_contact_ids_across_probes_are_allowed` and `test_generate_dummy_probe_group_repeats_contact_ids_across_probes` lock in the agreed semantics, and would fail if group-wide uniqueness were restored. `test_check_global_ids_rejects_within_probe_duplicates` covers the newly real check.

Worth noting as the concrete case this has to permit: the dummy probe group has 64 contacts but only 32 unique contact_ids, with all 64 compound keys unique. That is now a test.

Reverting the source from the base ref makes the new check test fail with `DID NOT RAISE ValueError`. The two semantics tests pass in both halves by design, since they are regression guards on existing behaviour. Full suite is green at 191 passed and 1 skipped.

Disclosure: this change was prepared with AI assistance. I have reviewed and tested it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87410e103ca8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.