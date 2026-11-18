# Issue

**Title:** ENH: Explicitly specify write_text encoding format

## Description

When writing reports from nipype the write_text
function could default to using 'ascii' coding
for writing the report.  This would fail if any
part of the report tried to generate a unicode
character.

The issue was encountered when the OS environmental variable "PS1" had a non-ascii character in the
environmental variable.

The result was a failure of the nipype pipeline
from running due to an exception being thrown
while trying to write the debugging information.


## Summary

.

## List of changes proposed in this PR (pull-request)
Explicitly request writing files with utf-8 encoding.  This is particularly important for writing reports that capture information from the environment when the environment could contain unicode characters.

```
UnicodeEncodeError: 'ascii' codec can't encode character '\u279c' in position 8882: ordinal not in range(128)
```
NOTE: The 8882'nd character is encountered while trying to print the PS1 environmental variable :  ➜

Forcing 
```python
report_file = Path('blah/blah/blah/report/report.rst')
report_file.write_text("\n".join(lines), encoding='utf-8')
```
resolves the failed problem.     I have no idea why the `io.open()` is defaulting to encoding='ascii'.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f405f6e2213`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.