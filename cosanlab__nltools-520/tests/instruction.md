# Issue

**Title:** docs: consolidate the DesignMatrix tutorials and list the tutorials flat

## Description

Part of #505. Second of the eight consolidated tutorials, plus two site-wide changes from the review of the first.

## What changes

- `docs/tutorials/data-operations/02_design_matrix.py` (498 lines) replaces `data-operations/05_design_matrix.py` and `basics/02_design_matrix.py`. Seven sections: build one by hand, convolution, drift and baseline regressors, read a design from files, combining runs, diagnostics, estimating the model. Twenty claims inherited from the two sources were corrected against the code, among them the events-file dispatch on `onset`/`duration`, the closed set of six HRF kernels, the run-separated naming (`.nl_poly_0` becomes `.nl_r0_poly_0`), `run_length='infer'` raising on an events file, and `clean` being a pairwise walk rather than an exhaustive sweep.
- **Tutorials are listed flat.** The Tutorials heading now holds "Working with BrainData" and "Working with DesignMatrix" directly; the index page and the "Data operations" group are gone. The community links moved to the home page.
- **One output per cell.** Both notebooks now put each unrelated output or plot in its own cell with a short lead-in, so a rendered page reads one result at a time. This is the standard for the remaining six. No computation or prose claim changed in the BrainData notebook; it grew from 510 to 702 lines of source, all scaffolding.

## Noted, not changed

`DesignMatrix.clean` marks a source column as kept after its first drop, so a third column correlated with that same source survives the pass. The tutorial no longer overstates the method; the behaviour itself is tracked separately.

## Checks

`uv run poe tutorials-check`, `uv run poe docs-build` (35 s, both pages executed), `uv run poe ok` (989 passed). Built nav: Home, Migrating from v0.5, Tutorials (two entries), Reference, Development.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb82abce0cf8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.