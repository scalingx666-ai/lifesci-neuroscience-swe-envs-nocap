# Issue

**Title:** Add --session-id option

## Description

Adds '--session-id' option, analogous to the 'session-id' option already implemented in nhp-abcd-bids-pipeline and infant-abcd-bids-pipeline. Users may now filter input to be processed with a list of BIDS session IDs. 

```
    parser.add_argument(
        '--session-id', dest='session_list', nargs='*',
        metavar='LABEL',
        help='filter input dataset by session id. Default is all ids '
             'found under the subject input directory(s).  A session id '
             'does not include "ses-"'
    )
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0f576748037`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.