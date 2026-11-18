# Issue

**Title:** Fix a few participants.tsv files

## Description

A handy tool I discovered, to e.g. find all values which are not numeric

```
$ for f in */participants.tsv; do echo $f; mlr --itsv --otsv cut -f age $f; done
```

to just dump all the file names and their values for age if any

```
❯ mlr --itsv --otsv filter 'string($age) =~ "[^0-9]"' cut -f age ds000117/participants.tsv
participant_id	age	sex	first_ses
sub-emptyroom	n/a	n/a	n/a

```
to dump those which are not numeric in a particular file

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6470461ce3c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.