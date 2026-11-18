# Issue

**Title:** BF: update patoolib imports for 2.0 API change and coverage-bin/datalad to arbitrary path to execute from

## Description

* import check_new_filename from patoolib.fileutil after 2.0.0, or patoolib.util prior to that
* fixes code that calls archive_utils_patool; prior to this, check_new_filename could not be found

I noticed this issue when running tests after initial setup.  Pip retrieved the latest version of patool (4.0.4), which led to the import error.  You can reproduce with the following script:

```python
#!/usr/bin/env python
from datalad.support.archive_utils_patool import compress_files

if __name__ == "__main__":
    files = ["test.foo"]
    archive = "test.foo.gz"
    overwrite = False

    print("compressing files")

    compress_files(
        files,
        archive,
        overwrite=False,
    )
```

And confirm that it throws with patoolib >= 2.0 and without this change:

```
((venv) ) joshua@joshua-XPS-13-7390:~/projects/datalad$ ./test.py                                                
compressing files                                                                                                
Traceback (most recent call last):                      
  File "/home/joshua/projects/datalad/./test.py", line 11, in <module>                                           
    compress_files(                                     
  File "/home/joshua/projects/datalad/datalad/support/archive_utils_patool.py", line 220, in compress_files      
    check_new_filename(archive)                                                                                  
    ^^^^^^^^^^^^^^^^^^                                                                                           
NameError: name 'check_new_filename' is not defined
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d086f3063164`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.