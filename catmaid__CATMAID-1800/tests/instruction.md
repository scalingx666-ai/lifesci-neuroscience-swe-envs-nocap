# Issue

**Title:** Add some initial type annotations and a mypy.ini

## Description

This is a proof-of-concept and initial set of annotations for mypy for skeletonexport.py

```
scclin009:~/src/catmaid_dev/django$ mypy applications/catmaid/control/skeletonexport.py ; echo $?
0
```

Some of the annotations are doing the minimum to make mypy happy and could have more precise anotations; I left a comment with most of these indicating that there's more to do down the line. The mypy.ini contains defaults that I've found useful in the early stages of type-annotating python code; making the rules more strict later may be a good idea.

Line 1091->1094 is an example of deciding to tell mypy to chill about a particular line.

Finally, I was a little naughty in line 315->318 in changing formatting slightly to make things line up; happy to undo that if you want.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d1711c65482`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.