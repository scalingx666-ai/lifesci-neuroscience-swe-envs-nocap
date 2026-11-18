# Issue

**Title:** Do not fail `add-archive-content` when adding files ignored due to .gitignore rules

## Description

## Problem

`git annex addurl --batch` checks `.gitignore` by default. When `add-archive-content` hands it an extracted path that matches an ignore rule, addurl refuses the file and the batch run aborts on the first such path — leaving the rest of the archive's content unadded:

```
AnnexBatchCommandError: 'addurl' [Error: 'not adding logs/run.log
  which is .gitignored (use --no-check-gitignore to override)']
```

## Fix

Catch the per-file `AnnexBatchCommandError`, detect the `.gitignored` refusal, log a warning, and skip that path. The batch subprocess stays alive (the JSON response just had `success: false`), so remaining files continue to be added. The gitignored file is not placed in the dataset.

Behavior summary:

| Path matches `.gitignore` | Before this PR   | After this PR           |
|---------------------------|------------------|-------------------------|
| No                        | added to annex   | added to annex (same)   |
| Yes                       | run aborts       | skipped with a warning  |

Users who want every extracted path in regardless of ignore rules can still force it explicitly with `--annex-options='--no-check-gitignore'`.

<details><summary>Reproducer</summary>

```bash
export PS4='> '
set -x
set -eu
cd "$(mktemp -d ${TMPDIR:-/tmp}/dl-XXXXXXX)"

mkdir -p logs
echo "some log data" > logs/run.log
echo "keep me" > keep.txt
tar czf archive.tar.gz logs/ keep.txt

datalad create -c text2git testds
cd testds
echo "logs" > .gitignore
git add .gitignore
git commit -m "add gitignore"
cp ../archive.tar.gz .
git annex add archive.tar.gz
git commit -m "add archive"

datalad add-archive-content archive.tar.gz
git status --short
ls -la
[ ! -e logs/run.log ] && echo "OK: logs/run.log skipped (gitignored)"
[ -e keep.txt ]      && echo "OK: keep.txt added"
```

</details>

<details><summary>Run on master (aborts)</summary>

```
> datalad add-archive-content archive.tar.gz
[INFO   ] Adding content of the archive archive.tar.gz into annex ...
[INFO   ] Initializing special remote datalad-archives
[ERROR  ] AnnexBatchCommandError: 'addurl' [Error, annex reported
  failure for addurl ... "note": "not adding logs/run.log which is
  .gitignored (use --no-check-gitignore to override)"]
```

</details>

<details><summary>Run with this PR (gitignored skipped, rest added)</summary>

```
> datalad add-archive-content archive.tar.gz
[INFO   ] Adding content of the archive archive.tar.gz into annex ...
[INFO   ] Initializing special remote datalad-archives
[WARNING] logs/run.log matches .gitignore; skipping (file not added to dataset)
[INFO   ] Finished adding archive.tar.gz: Files processed: 2, +git: 1, skipped: 1
add-archive-content(ok): ... (dataset)
```

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0d29ecfaa10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.