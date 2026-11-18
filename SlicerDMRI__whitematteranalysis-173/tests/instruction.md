# Issue

**Title:** BUG: Remove non-existing `version` keyword parameter in script argparser

## Description

Remove non-existing `version` keyword parameter in script argument parser object instantiation.

Fixes:
```
Traceback (most recent call last):
  File ".virtualenvs/wma/lib/python3.8/site-packages/pytest_console_scripts/__init__.py", line 319, in exec_script
    exec(compiled, {'__name__': '__main__'})
  File ".virtualenvs/wma/bin/wm_flatten_length_distribution.py", line 4, in <module>
    __import__('pkg_resources').run_script('whitematteranalysis==0.3.0', 'wm_flatten_length_distribution.py')
  File ".virtualenvs/wma/lib/python3.8/site-packages/pkg_resources/__init__.py", line 666, in run_script
    self.require(requires)[0].run_script(script_name, ns)
  File ".virtualenvs/wma/lib/python3.8/site-packages/pkg_resources/__init__.py", line 1462, in run_script
    exec(code, namespace, namespace)
  File ".virtualenvs/wma/lib/python3.8/site-packages/whitematteranalysis-0.3.0-py3.8.egg/EGG-INFO/scripts/wm_flatten_length_distribution.py", line 26, in <module>
    parser = argparse.ArgumentParser(
TypeError: __init__() got an unexpected keyword argument 'version'
```

and equivalent errors across scripts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42d9c86e52cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.