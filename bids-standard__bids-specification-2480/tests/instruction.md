# Issue

**Title:** [ENH] BEP032: Require the sample entity for icephys and enforce samples.tsv

## Description

Implements the decisions we reached in the working group meeting on 2026-07-29 about the `sample-<label>` entity, addressing  This targets the `bep032-review` branch, so it merges into #2307 rather than into master.

## Requirement Level

The entity is now REQUIRED for `icephys` and remains OPTIONAL for `ecephys`. We agreed that an intracellular recording is always made from a discrete sample, so the requirement holds even when a subject yields only one sample, and even when the recording is made in vivo, since the patched cell is itself the sample. Requiring it in the single-sample case also avoids having to rename files when a second sample is added later. This mirrors how microscopy treats the entity.

In the schema this meant splitting the `microephys` file rule, since it previously covered both datatypes in one block with `sample: optional`. The `icephys` rule now inherits from the `ecephys` rule and overrides the datatype, suffix, and requirement level, following the pattern already used for `photo__micr`.

## Documentation

The entity was previously introduced only in the Photos section, framed as being for histological photos, even though the intracellular examples use it in every filename. It now has a dedicated section near the top of the page covering the requirement levels, the granularity convention, and the relationship to `samples.tsv`. The mention in the Photos section is now a back-reference to that section.

On granularity, the text states that a sample is the finest unit of biological material from which signals are measured: the individual cell for patch clamp, and typically the slice or cell population for in vitro extracellular recordings. Where several samples share a source, for example several cells patched from one slice, the source may also be described in `samples.tsv` and linked with `derived_from`. Such a parent sample generally does not appear as an entity in recording filenames, since it is not itself what was measured.

## Enforcing `samples.tsv`

The specification already states, in the description of the samples file, that `samples.tsv` is REQUIRED if `sample-<label>` appears in any filename in the dataset. The only check enforcing that was keyed on `"micr" in dataset.modalities`, so it never fired for microephys data. Following Sylvain's review, the check is now keyed on the presence of the entity instead, which covers `micr`, `icephys`, and `ecephys` with a single rule and matches the spec text exactly. The error is now reported per file rather than once at the dataset level.

## Verification

`bidsschematools` tests pass (81 passed, 1 skipped), as do `pre-commit` on the changed files, `npm run remark`, and the Latin-phrase check. I confirmed the rendered filename templates show `_sample-<label>` as required for `icephys` and optional for `ecephys`, and that every `icephys` file in the existing intracellular example already carries the entity, so that example remains valid.

@lzehl, this is the first of the items from the meeting. Happy to adjust the wording of the new section if it does not match what we discussed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f94d13fbb121`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.