# Issue

**Title:** chore(examples/iap-demo): pin SDK to 0.3.0, use real getCatalog

## Description

Follow-up to the `0.3.0` publish. Now that `@elata-biosciences/app-payments@0.3.0` (with `getCatalog`) is on npm, the demo no longer needs the feature-detect workaround.

- Pin `index.html` import `@0.2.0` → `@0.3.0`.
- Replace the namespace-import + `getCatalog` feature-detect with a clean named import of all four functions — the straightforward pattern adopters should copy.
- Update the demo README note (the `getCatalog` publish gap is closed; only the `#472` ownership-handler dependency remains).

Verified: `node --check` clean; no remaining `0.2.0` reference.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92a5e7c5e375`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.