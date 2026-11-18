# Issue

**Title:** [ENH] BEP032: Require anatomical_reference_point when stereotaxic coordinates are given

## Description

Implements the decision we reached in the working group meeting on 2026-07-29 about `anatomical_reference_point`, addressing  and following up on  This targets `bep032-review`, so it merges into #2307 rather than into master.

## The Change

The column previously said that Bregma is assumed for rodents and that the reference point MUST be defined for species other than rodents. It is now required whenever any of the `AP`, `ML`, or `DV` columns are present, for every species, and the Bregma default is dropped.

As @effigies pointed out, the species conditional came with no check and could not be enforced. The validator context exposes only `participant_id` from `participants.tsv`, so a rule evaluating `probes.tsv` cannot read the `species` column at all; `species` is itself only RECOMMENDED and is assumed to be `homo sapiens` when absent; and deciding rodent versus non-rodent would require taxonomic reasoning rather than string comparison. The condition on the coordinates is both the one that actually matters, since stereotaxic coordinates cannot be interpreted without knowing the point they are measured from, and one that can be checked.

Dropping the default follows from the same change: with the coordinates present the column is required, so there is no case left for a default to cover.

## Implementation

`MicroephysRequiredAnatomicalReferencePoint` in `rules/checks/microephys.yaml` selects on the presence of any of the three coordinate columns and checks for the reference point. It follows the form of the existing `RequiredTemplateX` and `RequiredComponent` checks in `rules/checks/nirs.yaml`, which condition one column's requirement on another's contents.

In the columns rule the level stays OPTIONAL with a `level_addendum` of "required if `AP`, `ML`, or `DV` are present", so the rendered table reads "OPTIONAL, but REQUIRED if `AP`, `ML`, or `DV` are present" rather than understating the requirement. The description in `objects/columns.yaml` and the corresponding sentence in the surgical coordinates appendix are updated to match.

I also added the reference point to the intracellular probes example, which gives stereotaxic coordinates and would otherwise stop being valid under the new check.

## Verification

`bidsschematools` tests pass (81 passed, 1 skipped), as do `pre-commit` on the changed files and `npm run remark`. I parsed both new check expressions with `bidsschematools.expressions` to confirm they are well formed, and confirmed the rendered probes table shows the conditional requirement. Both probes examples in the specification now satisfy the check.

## Note on Ordering

This touches the intracellular probes example, which #2481 also edits, so whichever merges second will need a trivial rebase on that one row. Everything else is independent. Happy to rebase whenever it is useful.

@lzehl, this is the third item from the meeting. The first two are #2480 and #2481.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f661db9987e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.