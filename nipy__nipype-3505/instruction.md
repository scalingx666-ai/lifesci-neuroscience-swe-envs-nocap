# Issue

**Title:** FIX: Provide more runtime information when node execution fails

## Description

Partially addresses #3492 

This adds runtime information to the error message when node execution fails.

1.8.x series:
```
220914-11:28:50,439 nipype.workflow WARNING:
	 [Node] Error on "test-fail" (/private/tmp/nipype/test-fail)
Traceback (most recent call last):
  File "/private/tmp/nipype/test-fail.py", line 21, in <module>
    eg = x.run()
  File "/Users/mathiasg/.pyenv/versions/nipreps/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 524, in run
    result = self._run_interface(execute=True)
  File "/Users/mathiasg/.pyenv/versions/nipreps/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 642, in _run_interface
    return self._run_command(execute)
  File "/Users/mathiasg/.pyenv/versions/nipreps/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 750, in _run_command
    raise NodeExecutionError(
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node test-fail.
```

1.5.x series:
```
220914-11:27:16,631 nipype.workflow WARNING:
	 [Node] Error on "test-fail" (/private/tmp/nipype/test-fail)
Traceback (most recent call last):
  File "/private/tmp/nipype/test-fail.py", line 21, in <module>
    eg = x.run()
  File "/Users/mathiasg/.pyenv/versions/nipreps/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 516, in run
    result = self._run_interface(execute=True)
  File "/Users/mathiasg/.pyenv/versions/nipreps/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 635, in _run_interface
    return self._run_command(execute)
  File "/Users/mathiasg/.pyenv/versions/nipreps/lib/python3.10/site-packages/nipype/pipeline/engine/nodes.py", line 741, in _run_command
    result = self._interface.run(cwd=outdir)
  File "/Users/mathiasg/.pyenv/versions/nipreps/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 419, in run
    runtime = self._run_interface(runtime)
  File "/Users/mathiasg/.pyenv/versions/nipreps/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 814, in _run_interface
    self.raise_exception(runtime)
  File "/Users/mathiasg/.pyenv/versions/nipreps/lib/python3.10/site-packages/nipype/interfaces/base/core.py", line 741, in raise_exception
    raise RuntimeError(
RuntimeError: Command:
failing-bin 123
Standard output:
Starting the binary
Using input 123...
Standard error:
Failing!
Return code: 1
```

With this PR:
```
220914-11:45:14,669 nipype.workflow WARNING:
	 [Node] Error on "test-fail" (/private/tmp/nipype/test-fail)
Traceback (most recent call last):
  File "/private/tmp/nipype/test-fail.py", line 21, in <module>
    eg = x.run()
  File "/Users/mathiasg/code/nipype/nipype/pipeline/engine/nodes.py", line 527, in run
    result = self._run_interface(execute=True)
  File "/Users/mathiasg/code/nipype/nipype/pipeline/engine/nodes.py", line 645, in _run_interface
    return self._run_command(execute)
  File "/Users/mathiasg/code/nipype/nipype/pipeline/engine/nodes.py", line 758, in _run_command
    raise NodeExecutionError(
nipype.pipeline.engine.nodes.NodeExecutionError: Exception raised while executing Node test-fail.

Cmdline:
	failing-bin 123
Stdout:
	Starting the binary
	Using input 123...
Stderr:
	Failing!
Traceback:
	RuntimeError: subprocess exited with code 1.
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af3f8df00ff6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.