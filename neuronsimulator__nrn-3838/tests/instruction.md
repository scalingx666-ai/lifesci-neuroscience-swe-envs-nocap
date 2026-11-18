# Issue

**Title:** CI: ModelDB CI workflow that reuses an existing wheels artifact

## Description

## Summary

When a **NEURON Release** (or other wheel-building run) is green through the
wheel matrix but fails only at **ModelDB CI**, rebuilding every wheel just to
retest ModelDB is wasteful.

This PR adds a manual workflow, **ModelDB CI (reuse wheels)**, that:

- Takes an existing GitHub Actions **`wheels`** artifact (id or URL)
- Calls `nrn-modeldb-ci` with that artifact as `neuron_v2`
- Lets the operator choose **`modeldb_ci_ref`** (branch/tag/SHA of
  `nrn-modeldb-ci` to checkout for `modeldb-run.yaml` / `runmodels`)
- Optionally limits the suite via **`models_to_run`** (space-separated
  accessions; empty = all)

No wheels are built in this workflow.

### Operator flow

1. Open a prior run that uploaded artifact **`wheels`**.
2. Copy the artifact id (e.g. `8935275231`) or a
   `https://github.com/neuronsimulator/nrn/actions/artifacts/<id>` URL.
3. **Actions → ModelDB CI (reuse wheels) → Run workflow** (or `gh workflow run`
   after this file is on the default branch — GitHub only *registers*
   `workflow_dispatch` workflows from `master`).
4. Set `neuron_v1` (e.g. `neuron==9.0.1`), `modeldb_ci_ref` (usually `master`),
   and optional `models_to_run` (e.g. `2018023 2020504` for a smoke test).

### Scope note

ModelDB installs **one** compatible wheel from the multi-wheel zip (first that
pip accepts on the job's Python), not the full OS×Python matrix. That matches
existing `nrn-modeldb-ci` behavior.

### Dependency

Requires the `ref` input on the callable modeldb-ci workflow:

- neuronsimulator/nrn-modeldb-ci#154

Until that is merged, this workflow temporarily uses:

```yaml
uses: neuronsimulator/nrn-modeldb-ci/.github/workflows/nrn-modeldb-ci.yaml@hines-grok/modeldb-ci-ref-input
```

**Before merge to nrn master**, switch that line to `@master` once
neuronsimulator/nrn-modeldb-ci#154 is on modeldb-ci master (or land that PR
first, then flip in this PR).

### Follow-ups (out of scope here)

- Add `modeldb_ci_ref` to the full **NEURON Release** panel (same `ref`
  pass-through).
- Drop the temporary `@hines-grok/modeldb-ci-ref-input` pin after
  neuronsimulator/nrn-modeldb-ci#154 merges.

## Test plan

- [ ] Merge or land `modeldb-ci-reuse-wheels.yml` so the workflow is registered
      on the default branch (GitHub requirement for `workflow_dispatch` UI/`gh`)
- [ ] Ensure neuronsimulator/nrn-modeldb-ci#154 is available (`@master` or keep
      temporary `@hines-grok/modeldb-ci-ref-input`)
- [ ] Run with wheels artifact from a completed Release (e.g. run 30997749624,
      artifact `8935275231` while unexpired), `neuron_v1=neuron==9.0.1`,
      `modeldb_ci_ref=master`, `models_to_run=2018023 2020504`
- [ ] Confirm normalize job builds a github.com artifact URL; ModelDB jobs
      checkout the requested ref; smoke accessions do not reintroduce the old
      "4 failed model builds" gate for those ids
      (neuronsimulator/nrn-modeldb-ci#153 on master)
- [ ] Optional: full suite (`models_to_run` empty) as a longer check
- [ ] Before merge: `uses@master` once neuronsimulator/nrn-modeldb-ci#154 is
      merged

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cee84a614a3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.