# Issue

**Title:** [FIX] Clarify that `acq_time` denotes start of acquisition, not just when it was acquired

## Description

Uff, busy beginning of Wed with seemingly a tiny change ;) Claude Code 2.1.280 was there to help to polish:

## Summary

`acq_time` was defined as "when the first data point ... was acquired." That phrasing reads as a single instant of sampling, but acquiring even a "first data point" (a slice, a volume, a block) can itself take a non-trivial amount of time — hundreds of milliseconds for some MRI sequences. It leaves unstated *which* instant of that process `acq_time` denotes.

<details><summary>Some explanation of changes (or lack of them) while going through places where acq_time was used</summary>
This PR rewords `acq_time` (in `scans.tsv` and `sessions.tsv`) to say it is the moment the acquisition **started**, mirroring the DICOM [Acquisition Time](https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_C.7.10.html) attribute ([DICOM Tag (0008,0032)](https://www.dicomlookup.com/dicomtags/(0008,0032))) that most converters (dcm2niix, heudiconv, ...) already source it from. This is a clarification, not a semantic change: it is how the field has been populated in practice; see history below.

The `sessions.tsv` wording keeps "first data point in this session" (rather than "the data in this session") since, unlike a single file, a session can span several files/acquisitions — "first" is doing real work there, picking out the earliest one. It deliberately avoids saying "first run": `run` is a specific entity a session's data need not have (a session can hold a single acquisition, or session-level data with no `run-` label at all).

A few other places that restate (rather than just point to) the `acq_time` definition were reworded to stay consistent:

-   `src/schema/objects/suffixes.yaml` (`scans` suffix description, duplicates the `columns.yaml` text)
-   `src/modality-specific-files/motion.md` and `electromyography.md` (multi-modal synchronization guidance that described `acq_time` as "the acquisition time of the first data point" — the same ambiguity this PR is fixing)

Places that only say `acq_time` entries "MUST be identical" across split/multi-part files (`entities.yaml` `split`, `meg-file-formats.md`, `magnetoencephalography.md`) don't restate the definition and needed no change.

</details>

This is a companion to 

- #2508

with `acq_time` unambiguously anchored at the *start* of acquisition, `[acq_time, acq_time + duration]` becomes a well-defined interval. heudiconv's implementation of that () hit exactly this ambiguity in practice: for interleaved multiband acquisitions the file conventionally treated as "first" is not always the earliest-acquired one, so anchoring `duration` on a different timestamp than `acq_time` produced spurious negative overlaps ():

- 

so, potentially some datasets in the wild might need that value fixed up.

**Open question — not resolved by this PR:** 

-  reports that DICOM `AcquisitionTime` itself can jump by hundreds of milliseconds between consecutive sequences relative to an independent NTP-synchronized clock, for reasons not yet understood. That's a scanner/DICOM-level open question about how faithfully `AcquisitionTime` reflects true wall-clock acquisition start — I hope orthogonal to (but a good reason to be modest about precision claims for) this wording fix.

<details>
<summary>Evolution of the <code>acq_time</code> definition (for reviewers who want the full story)</summary>

-   2020-06-19,  (@tsalo): First clarification, from silence to "SHOULD correspond to when the first data point ... was acquired". Refined during review (per @effigies) to "refers to" — a definition rather than a validatable requirement, which is the framing this PR keeps.
-   2021-07-13,  (@mnoergaard): Deprecated PET's `ScanDate` metadata field (DICOM `Acquisition Date`, tag `(0008,0022)`) in favor of recording that information via `acq_time` in `scans.tsv` — the first explicit tie between `acq_time` and a DICOM acquisition-timing tag.
-   2021-10-26 (`4ba9c2564`, @tsalo, no PR — direct commit): Noted that some formats (EDF) can't encode dates before 1985, which shaped the deidentification guidance ("shift to 1925 or earlier").
-   2021-11-09,  (@tsalo): Migrated the `scans.tsv`/`sessions.tsv` column definitions (previously prose in the modality-agnostic-files page) into the machine-readable schema, `columns.yaml`.
-   2022-02-04,  (@Remi-Gau): Split the single `acq_time` schema object into `acq_time__scans` and `acq_time__sessions`, and gave the sessions variant its own wording ("first data point of the first run" — this PR keeps "first data point" but drops "of the first run", since `run` need not apply to a session's data).
-   2023-04-11 (`b6a16531c`): Cross-referenced `acq_time` from the motion/EMG `LATENCY` channel type definition, for relating samples across multiple tracking systems.
-   2026,  (@yarikoptic, open): Proposes a RECOMMENDED `duration` column for `_scans.tsv` — the natural companion to a well-defined "start" semantics for `acq_time`, and the direct motivation for this PR.

</details>

This could potentially relate to folks working on any synchronose acquisition etc, thus alerting to potentially review/approve/etc and/or reflect in their works:

- @bendichter with #2231 , although the question for a video (ie. first video frame) is kinda "interesting" since aquisition might have been "momentary" (or faster than 1/60sec) at that point in time really and just sampled at e.g. 60Hz?
- @m-miedema with #2441 
- @neuromechanist with #751 since alignment to stimuli might suffer and be critical in some cases

## Test plan

-   [x] `pre-commit run` (yamllint, prettier, codespell) passes on the changed files.
-   [x] `python -c "from bidsschematools import schema; schema.load_schema()"` still loads the schema successfully with the new descriptions.
-   [x] `npx remark` passes on the two changed Markdown files.
-   [ ] Reviewer sanity-check: does "moment ... started" read unambiguously for readers unfamiliar with DICOM?

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ecbe207f0ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.