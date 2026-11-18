# Issue

**Title:** ENH: Speed up lock context

## Description

Working on  I saw a potential speedup in avoiding an expensive `inspect.stack()` call. Unfortunately, this was causing errors in CI of the form:
```
mne_bids/tests/test_write.py:4467: in test_parallel_write_many_subjects
    assert set(participants["participant_id"]) == set(expected_ids)
E   AssertionError: assert {'sub-001', '...sub-007', ...} == {'sub-001', '...sub-006', ...}
E     
E     Extra items in the right set:
E     'sub-261'
E     'sub-092'
E     'sub-144'
E     'sub-004'
E     Use -v to get more diff
```
which I can now reproduce *sometimes* on my machine.

I think this is due to the reentrant logic. @bruAristimunha I don't think it's working as intended... IIUC the reentrant stuff is meant to make it so that nested calls can reenter, like:
```
def _participants_tsv():
    with open_lock(a_file):
        func_b(a_file)

def func_b(b_file):
    with open_lock(b_file):
        fid...
```
However, the logic for how/when to do this is just to check to see if a lock has been opened for that file already. But for `write_raw_bids` doing `participants.tsv`, if any other thread has already acquired that lock with its own `func_a` call ... the current thread will proceed in reentrant mode, thus potentially "missing" some data if it calls `fid.read()` before the other thread has managed to append its data.

... at least I think that's what's happening. First commit is to show the problem. I don't think the test should be flaky, so I removed that decorator. And reducing the time spent in `stack.inspect` also helps show the issue I think.

Then I'll try to get rid of the reentrant stuff to see if it can fix the problem, but @bruAristimunha feel free to take over or open another separate PR if it's clear to you what the problem is already. I could be totally wrong on this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48ceabfc3fa5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.