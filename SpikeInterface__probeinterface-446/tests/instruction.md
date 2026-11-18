# Issue

**Title:** Enhance `ProbeGroup` API and add  `ProbeGroup._global_contact_order` for interleaved contacts

## Description

#416 added a get_slices() at ProbeGroup level but this PR has enhanced after long debates and discussions the fact that the ProbeGroup has a strong problem  : the order of contact with to_numpy()/from_numpy() or to_dict()/form_dict() can be lost!

This can append when contact of sevral Probe are interleaved. This was not possible before but given the `Probegrorup.get_slice()` contacts of several can be interleaved!

This PR add the hidden concept  of `ProbeGroup._global_contact_order`.
  * this is backward compatible because None by default (aka natural contact order)
  * make possible `pg2 = ProbeGroup.from_numpy(pg1.to_numpy(complete=True))` to maintain any abritory order
  * make possible `pg2 = ProbeGroup.from_dict(pg1.to_dict())` to maintain any abritory order

The get_slice is now on top of to_numpy() after the ordering.

This PR is validated:
  * should close #420 (this was a bad idea)
  * should also close #425 because the ProbeGroup.to_numpy() and ProbeGroup.get_slice() should do the same job
     and garanty fancy ordering.

Important note: the `_global_contact_order` is NOT the `global_device_channel_indices`. It can be any order.
(Even if the main use case is to order by global_device_channel_indices on spikeinterface side).

In short, this PR garanty the order after the json write/read.

@alejoe91 @chrishalcrow @h-mayorquin 

Test need to be done after validation.


## Update

See changes from 

- Extend `probe_id` usage
- Add `select_probes`/`select_contacts` function

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7aa8ace55e4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.