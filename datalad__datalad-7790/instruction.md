# Issue

**Title:** Fix remaining issues with testing on appveyor

## Description

Trying to identify/workaround bug we observe only on OSX single run on appveyor like https://ci.appveyor.com/project/mih/datalad/builds/53386984/job/04ca0afcbm9cto35

```
Error processing line 1 of /Users/appveyor/venv3.10.13/lib/python3.10/site-packages/a1_coverage.pth:
  Traceback (most recent call last):
    File "/Users/appveyor/.pyenv/versions/3.10.13/lib/python3.10/site.py", line 186, in addpackage
      exec(line)
    File "<string>", line 1, in <module>
    File "<string>", line 9, in <module>
    File "/Users/appveyor/venv3.10.13/lib/python3.10/site-packages/coverage/control.py", line 1492, in process_startup
      cov = Coverage(config_file=config_file)
    File "/Users/appveyor/venv3.10.13/lib/python3.10/site-packages/coverage/control.py", line 326, in __init__
      self.config = read_coverage_config(
    File "/Users/appveyor/venv3.10.13/lib/python3.10/site-packages/coverage/config.py", line 702, in read_coverage_config
      raise ConfigError(f"Couldn't read {fname!r} as a config file")
  coverage.exceptions.ConfigError: Couldn't read '/Users/appveyor/DLTMP/datalad_temp_kiy_jwqy/ds/../.coveragerc' as a config file
Remainder of file ignored
/bin/sh: bβ2.dat: command not found
[gw1] PASSED ../datalad/core/local/tests/test_run.py::test_py2_unicode_command 
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be057b30d192`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.