# Issue

**Title:** BUG: Do not contact the server automatically in testing mode

## Description

In testing mode (`--testing`) Slicer no longer contacts the server automatically at startup: the application update check, the extensions metadata update and the extensions update check are skipped.

## Why

`--testing` starts with empty settings, so the automatic update checks were due at every start. This made test results depend on network access.

On Windows it also made tests fail at random. `py_nomainwindow_MRMLCreateNodeByClassWithoutSetReferenceCount` failed in about 20% of runs under parallel load. That test passes only if vtkDebugLeaks prints its leak report at exit. In the failing runs, the process exited with code 0 but printed no report.

Root cause, confirmed with a debugger trace of a failing run:

1. The update check makes Qt look up the system proxy using WinHTTP background threads.
2. If the application exits while that lookup is still running, Windows terminates those threads, possibly while one of them holds a WinHTTP lock.
3. When Qt5Network unloads, it releases its WinHTTP session and tries to take that lock. Windows then ends the process on the spot (`QWindowsSystemProxy::~QWindowsSystemProxy` → `WinHttpCloseHandle` → `RtlEnterCriticalSection` → `ZwTerminateProcess`).
4. The rest of the shutdown is skipped, including the vtkDebugLeaks report, and the exit code stays 0.

## Testing

Tested with a Windows Release build:

- 156 of 156 runs of the test script, 12 running in parallel, printed the leak report. Before the fix, 17–28% of runs were missing it.
- In the runs traced with a debugger, WinHTTP is no longer opened.
- `ctest -R MRMLCreateNodeByClassWithoutSetReferenceCount --repeat until-fail:20` passes.
- The related tests pass: extensions manager, application update and command-line option tests.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b43f5f8d3da5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.