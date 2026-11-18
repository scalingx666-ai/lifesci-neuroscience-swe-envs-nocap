# Issue

**Title:** FIX: Fix setup.py

## Description

When trying to set up an Anaconda environment using `pip` to simultaneously install `mayavi` and `PySurfer`, I get these errors:
```
Installing collected packages: mne, nibabel, imageio, pysurfer, nitime, nilearn, quantities, neo, termcolor, pytest-sugar, pytest-faulthandler, pydocstyle, sphinx-bootstrap-theme, traits, pyface, traitsui, configobj, apptools, mayavi, sphinx-gallery
  Running setup.py install for pysurfer ... error
    Complete output from command /home/larsoner/anaconda2/envs/mne/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-45nhe837/pysurfer/setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" install --record /tmp/pip-3smloy5u-record/install-record.txt --single-version-externally-managed --compile:
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
      File "/tmp/pip-build-45nhe837/pysurfer/setup.py", line 64, in <module>
        check_dependencies()
      File "/tmp/pip-build-45nhe837/pysurfer/setup.py", line 51, in check_dependencies
        raise ImportError("Missing dependencies: %s" % missing)
    ImportError: Missing dependencies: mayavi
```
This is because we don't tell `pip` about the `mayavi` dependency, so it tries to install `PySurfer` first. We should either remove our custom dependency check, or add `mayavi` to the deps list -- this PR does the latter.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a51901f48a78`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.