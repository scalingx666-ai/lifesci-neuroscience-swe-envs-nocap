# Issue

**Title:** Fix DateOffset validation issue

## Description

Patch for bug in Pandas/PyTables when using hdf5 record after a dejitter node.

``n` argument must be an integer, got <class 'pandas._libs.tslibs.offsets.DateOffset'>
Traceback (most recent call last):
  File "pandas/_libs/tslibs/offsets.pyx", line 691, in pandas._libs.tslibs.offsets.BaseOffset._validate_n
TypeError: int() argument must be a string, a bytes-like object or a number, not 'DateOffset'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/timeflux/core/worker.py", line 59, in _run
    scheduler.run()
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/timeflux/core/scheduler.py", line 22, in run
    self.next()
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/timeflux/core/scheduler.py", line 59, in next
    self._nodes[step["node"]].update()
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/timeflux/nodes/hdf5.py", line 209, in update
    self._store.append(key, port.data, min_itemsize=self.min_itemsize)
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/pandas/io/pytables.py", line 1262, in append
    self._write_to_group(
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/pandas/io/pytables.py", line 1772, in _write_to_group
    s.write(
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/pandas/io/pytables.py", line 4322, in write
    table.set_attrs()
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/pandas/io/pytables.py", line 3508, in set_attrs
    self.attrs.info = self.info
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/tables/attributeset.py", line 478, in __setattr__
    self._g__setattr(name, value)
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/site-packages/tables/attributeset.py", line 420, in _g__setattr
    self._g_setattr(self._v_node, name, stvalue)
  File "tables/hdf5extension.pyx", line 707, in tables.hdf5extension.AttributeSet._g_setattr
  File "/home/user/anaconda3/envs/timeflux3/lib/python3.9/copyreg.py", line 71, in _reduce_ex
    state = base(self)
  File "pandas/_libs/tslibs/offsets.pyx", line 1027, in pandas._libs.tslibs.offsets.RelativeDeltaOffset.__init__
  File "pandas/_libs/tslibs/offsets.pyx", line 376, in pandas._libs.tslibs.offsets.BaseOffset.__init__
  File "pandas/_libs/tslibs/offsets.pyx", line 693, in pandas._libs.tslibs.offsets.BaseOffset._validate_n
TypeError: `n` argument must be an integer, got <class 'pandas._libs.tslibs.offsets.DateOffset'>`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c71fd4c5a21b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.