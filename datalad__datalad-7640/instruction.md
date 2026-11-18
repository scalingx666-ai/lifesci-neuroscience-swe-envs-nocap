# Issue

**Title:** Account for the fix in git-annex behavior in test_add_delete_after_and_drop_subdir

## Description

On OSX we started to fail with

```
                # There should be a single commit for all additions +1 to
                # initiate datalad-archives gh-1258.  If faking dates,
                # there should be another +1 because annex.alwayscommit
                # isn't set to false.
                # Behavior of git-annex changed around 10.20240531+git214 that now
                # there is now two separate commits in git-annex branch, one for adding
                # 1/1.dat and then 1/file.txt.
>               assert_equal(len(commits_after),
                             len(commits_prior) + 2
                             + self.annex.fake_dates_enabled
                             + (external_versions["cmd:annex"] >= "10.20240531+git214"))

../../../../hostedtoolcache/Python/3.8.18/x64/lib/python3.8/site-packages/datalad/local/tests/test_add_archive_content.py:610:
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

first = 5, second = 6, msg = None

    def assert_equal(first, second, msg=None):
        if msg is None:
>           assert first == second
E           assert 5 == 6
```

eg in https://github.com/datalad/git-annex/actions/runs/10259203010/job/28383625834 and this must be related to recently fixed by Joey

- [change in beh: addurls creates multiple commits](https://git-annex.branchable.com/bugs/change_in_beh__58___addurls_creates_multiple_commits/#comment-9df90f76cd0f6d95b02730cc518dd8e7)

for which we worked around in that test with above condition just recently in

- 

Tested locally that passes now with 10.20240731+git17-g6d1592f857-1~ndall+1 (and fails on `maint`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `364079036a5a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.