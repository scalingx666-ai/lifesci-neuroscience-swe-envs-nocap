# Issue

**Title:** Feature bids date - bugfix

## Description

The AcquisitionDateTime on the BIDS JSON sidecar wasn't formatted properly as a string.
That would case some JSON parsers to choke:

> "AcquisitionDateTime": 2016-04-12T17:29:9.218750,

```
$ jq .AcquisitionDateTime $example
parse error: Invalid numeric literal at line 5, column 38
```

> "AcquisitionDateTime": "2016-04-12T17:29:9.218750",

```
$ jq .AcquisitionDateTime $example
"2016-04-12T17:29:9.218750"
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c23f5e13006a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.