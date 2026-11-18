# Issue

**Title:** Fix `ValueError` when using `ResourceMonitor`

## Description

<!--

Pull-request guidelines
-----------------------

1. If you would like to list yourself as a Nipype contributor and your name is not mentioned please modify .zenodo.json file.
2. By submitting this request you acknowledge that your contributions are available under the Apache 2 license.
3. Use a descriptive prefix for your PR: ENH (enhancement), FIX, TST, DOC, STY, REF (refactor), WIP (Work in progress)
4. Run `make check-before-commit` before submitting the PR.

-->
## Summary
<!-- Please reference any related issue and use fixes/close to automatically
close them, if pertinent -->

When running Nipype 1.7.0 with `enable_resource_monitor`, I get the following error:

```
Traceback (most recent call last):
  File "/usr/local/miniconda/lib/python3.8/site-packages/halfpipe/plugins/linear.py", line 45, in run
    node.run(updatehash=updatehash)
  File "/usr/local/miniconda/lib/python3.8/site-packages/nipype/pipeline/engine/nodes.py", line 521, in run
    result = self._run_interface(execute=True)
  File "/usr/local/miniconda/lib/python3.8/site-packages/nipype/pipeline/engine/nodes.py", line 639, in _run_interface
    return self._run_command(execute)
  File "/usr/local/miniconda/lib/python3.8/site-packages/nipype/pipeline/engine/nodes.py", line 715, in _run_command
    result = self._interface.run(cwd=outdir, ignore_exception=True)
  File "/usr/local/miniconda/lib/python3.8/site-packages/nipype/interfaces/base/core.py", line 398, in run
    runtime = self._run_interface(runtime)
  File "/usr/local/miniconda/lib/python3.8/site-packages/nipype/interfaces/base/support.py", line 90, in __exit__
    for k, v in self._resmon.stop():
ValueError: too many values to unpack (expected 2)
```

## List of changes proposed in this PR (pull-request)
<!-- We suggest using bullets (indicated by * or -) and filled checkboxes [x] here -->

* Unpack the dictionary returned by `self._resmon.stop()` into `items` for the for loop

## Acknowledgment

- [x] \(Mandatory\) I acknowledge that this contribution will be available under the Apache 2 license.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f756b7111749`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.