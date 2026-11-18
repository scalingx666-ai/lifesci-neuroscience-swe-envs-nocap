# Issue

**Title:** Windows script install

## Description

We were getting errors testing the scripts on windows, e.g:

http://nipy.bic.berkeley.edu/builders/nipy-bdist32-26/builds/20/steps/shell_5/logs/stdio

of form:

<pre>
======================================================================
ERROR: nipy.tests.test_scripts.test_nipy_3_4d
----------------------------------------------------------------------
Traceback (most recent call last):
  File "C:\Python26\lib\site-packages\nose-1.2.1-py2.6.egg\nose\case.py", line 197, in runTest
    self.test(*self.arg)
  File "C:\buildslaves\xp-mini\nipy-bdist32-26\build\venv\lib\site-packages\nipy-0.3.0.dev-py2.6-win32.egg\nipy\tests\test_scripts.py", line 119, in test_nipy_3_4d
    run_command(cmd)
  File "C:\buildslaves\xp-mini\nipy-bdist32-26\build\venv\lib\site-packages\nipy-0.3.0.dev-py2.6-win32.egg\nipy\tests\test_scripts.py", line 60, in run_command
    proc = Popen(cmd, stdout=PIPE, stderr=PIPE, shell=USE_SHELL)
  File "C:\Python26\Lib\subprocess.py", line 623, in __init__
    errread, errwrite)
  File "C:\Python26\Lib\subprocess.py", line 833, in _execute_child
    startupinfo)
WindowsError: [Error 2] The system cannot find the file specified
</pre>

This turned out to be because I hadn't thought out all the ways the scripts could be installed, in this case, into a virtualenv.  This PR makes a more robust wrapper for the scripts, and changes the script running to pick up e.g virtualenv paths.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6db9301eea9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.