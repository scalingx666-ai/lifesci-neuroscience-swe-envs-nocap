# Issue

**Title:** Fix experiment.end() not closing log files

## Description

`experiment.end()` never calls `self._log.close()`, because the other two lines in the try-block always throw an exception:
`self._log` references an instance of one of the log backends here, e.g. `csv`. The `csv` class does not have `flush()` defined and is not a file descriptor that could be used as an argument to `os.fsync()`. The file descriptor that is meant to be accessed in both cases is actually at `self._log._log` in this case. However `flush()` and `os.fsync()` don't need to be called at all, because the csv logger already calls those for each call to `csv.write()`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8bf71080c0f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.