# Issue

**Title:** BF: nested datalad run - fix crash when command commits in a subdataset below a plain dir

## Description

When using the new `datalad run` functionality in 1.6+ and both conditions met: 
 - condition 1: subdatasets are separated by a plaindir (non-dataset), ie `root/plaindir//subrepo`,
 - condition 2: the command commits (ie datalad run)
 
The inner datalad run works, and is committed to the leaf, and the root.
The outer datalad run crashes, so its commit is missing from the root. 
`[ERROR  ] 'NoneType' object has no attribute 'get_hexsha' `

```
datalad run "datalad run \"echo 'broke' > plaindir/subrepo/t2\""
[INFO   ] == Command start (output follows) ===== 
[INFO   ] == Command start (output follows) ===== 
[INFO   ] == Command exit (modification check follows) ===== 
run(ok): /tmp/datalad-run-byREmV (dataset) [echo 'broke' > plaindir/subrepo/t2]
add(ok): t2 (file)                                                                                            
save(ok): plaindir/subrepo (dataset)                                                                          
add(ok): plaindir/subrepo (dataset)                                                                           
add(ok): .gitmodules (file)                                                                                   
save(ok): . (dataset)                                                                                         
[INFO   ] == Command exit (modification check follows) =====                                                  
run(ok): /tmp/datalad-run-byREmV (dataset) [datalad run "echo 'broke' > plaindir/sub...]
[ERROR  ] 'NoneType' object has no attribute 'get_hexsha' 
```

It can also leave the root repo dirty, if the command commits but doesnt propagate the commit.

## Detailed Reproducer 

<details>
<summary>script</summary>

```console
# datalad run: crash when the command commits in a subdataset below a plain directory
#   root / plaindir // subrepo     //  dataset boundary, /  ordinary directory
# Run with a datalad that still has the bug (1.6.0 - 1.6.2, or master before the fix).
# No `set -e`: both `datalad run` calls are EXPECTED to fail.
export PS4='> '
set -xu
cd "$(mktemp -d ${TMPDIR:-/tmp}/dl-nested-XXXXXXX)"

datalad create -c text2git root
datalad create -c text2git -d root root/plaindir/subrepo
cd root

# 1. nested run: inner run saves the whole chain, so only the OUTER record is lost
datalad run "datalad run \"echo 'broke' > plaindir/subrepo/t2\""
git log --oneline -1
datalad status -r

# 2. bare commit: nothing saves upward, so no run record at either level
datalad run -m outer -- git -C plaindir/subrepo commit --allow-empty -m inner
git log --all --grep=RUNCMD --oneline
datalad status -r
```
</details>

## Proposed change

`_inject_sub_info` now climbs to the nearest **dataset** ancestor instead of the immediate parent directory, via a new `_parent_ds_path` helper.  Plain directories in between are skipped rather than treated as datasets. 

<details>
<summary>Claude Details</summary>

The merge-commit machinery walks up by directory and assumes every ancestor is a dataset; a plain directory in the chain has no repo, so asking it for its HEAD raises.

```
[ERROR] 'NoneType' object has no attribute 'get_hexsha'
  File "datalad/core/local/save.py", line 120, in _inject_sub_info
    Dataset(parent_path).repo.get_hexsha())
```

The walk exists to record, at every level between the changed subdataset and the run's dataset, that a child moved. It stepped by filesystem parent and asked each stop for its HEAD, which only holds if every subdataset is a direct child of its superdataset.

Two further points on the change itself: the `child_repo ... else cur_sha` fallback is dropped, since with plain directories skipped every step of the walk is a dataset, and that fallback was only ever reached for the plain-directory case where it substituted the changed subdataset's own SHA for the directory. `_parent_ds_path` returning `None` absorbs the old defensive "not a descendant" loop termination.

### Which layouts are affected

Writing `//` for a dataset boundary and `/` for an ordinary directory:

| layout | affected |
| --- | --- |
| `root//leaf` | no |
| `root//mid//leaf` | no |
| `root/plaindir//leaf` | **yes** |
| `root//mid/plaindir//leaf` | **yes** |

Extra dataset levels are not the problem; a single ordinary directory anywhere in the chain is enough. This is why existing coverage missed it: the tests exercise a direct child and an all-datasets three-level chain, but never a plain directory in between.

### What it leaves behind

The run always exits 1, but how much is lost depends on what the command did.

In the nested-run case, the inner run saves the whole chain on its way out, so the working tree ends **clean** and the only casualty is the outer run's record: every run record present describes the *inner* command. Because the outer command was a pure wrapper, that record still happens to describe the net effect, which makes the failure easy to dismiss as noise. It is not: the point of the run-merge is that the first-parent chain reads as one commit per `run`, and here the mainline ends up describing something the user never typed.

With the fix, that nested run exits 0, the root's mainline records the outer command, and the inner run's own record is preserved on the merge's second parent:

```console
$ git log --first-parent --oneline -2
e4fcd2c [DATALAD RUNCMD] datalad run "echo 'broke' > plaindir/sub...
a77eda0 [DATALAD] Created subdataset

$ git log --oneline HEAD^2 -2
0453193 Remaining changes after command execution
7c555fa [DATALAD RUNCMD] echo 'broke' > plaindir/subrepo/t2
```

### Affected versions

Present in 1.6.0, 1.6.1, 1.6.2 and current `maint` / `master`.
Introduced by #7821: `6dfa285bd` added the walk with a guard on the HEAD lookup, and `69f1530ea` two days later removed that guard, turning a latent wrong-data path into a hard crash.
Restoring the guard alone would not be correct, since the walk would still enter plain directories into the save plan as datasets.

### Verification

- New test fails without the fix and passes with it.
- `datalad/core/local/tests/test_run.py` + `test_save.py`: 78 passed, 3 skipped, 1 xfailed.
- `datalad/local/tests/test_rerun.py`: 21 passed, 1 xfailed.
- Green against both git-annex 10.20250630 and 10.20260717.
- Checked end to end that the run now produces merge commits at both levels, a run record on the superdataset, and a clean recursive status, including with three plain directories in the chain.

</details>

## Known limitation on adjusted branches

Testing this led to finding another bug #7905, so I was not able to fully test crippled filesystem. (On adjusted branches, I've marked that test as xfail)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78b76f8b3716`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.