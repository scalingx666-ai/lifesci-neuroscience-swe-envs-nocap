# Issue

**Title:** Only use nonempty main channel indices when making an analyzer from templates

## Description

Found a `main_channel_indices` bug. When you use `create_sorting_analyzer_with_existing_templates` (done inside e.g. SK2 and Lupin) the sorting might have fewer units than there are templates. This is because some templates end up having no spikes clustered to them (especially happens if you use a template library generated from a different recording, for fun ;) ). So we usually throw away these units.

This PR ensures that when we throw away these units, we update the `main_channel_indices` accordingly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d00a6762b7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.