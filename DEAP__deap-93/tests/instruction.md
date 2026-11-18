# Issue

**Title:** Fixed reading of UTF-8 files in setup.py

## Description

I've just tried to perform `pip install deap` on an ArchLinux system using Anaconda 3, and it crashed saying:

```
warning: pypandoc module not found, could not convert Markdown to RST
Traceback (most recent call last):
  File "<string>", line 20, in <module>
  File "/tmp/pip-build-5xgtngz9/deap/setup.py", line 22, in <module>
    long_description=read_md('README.md'),
  File "/tmp/pip-build-5xgtngz9/deap/setup.py", line 13, in <lambda>
    read_md = lambda f: open(f, 'r').read()
  File "/root/anaconda3/lib/python3.4/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 4945: ordinal not in range(128)
```

The same occured when trying the `master` version of the git repository.

Here's a fix provided. Should work on Python 2.7 and Python 3.2+.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b46dde2b74a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.