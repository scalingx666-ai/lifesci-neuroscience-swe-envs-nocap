# Issue

**Title:** Prevent double parsing error on locales with comma decimal seperator

## Description

My system locale is a bit weird, it's set like this:

```bash
LANG=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC=en_DK.UTF-8
LC_TIME=en_DK.UTF-8
LC_COLLATE="en_US.UTF-8"
LC_MONETARY=en_DK.UTF-8
LC_MESSAGES="en_US.UTF-8"
LC_PAPER=en_DK.UTF-8
LC_NAME=en_DK.UTF-8
LC_ADDRESS=en_DK.UTF-8
LC_TELEPHONE=en_DK.UTF-8
LC_MEASUREMENT=en_DK.UTF-8
LC_IDENTIFICATION=da_DK.UTF-8
LC_ALL=
```

But this means I run into all kinds of fun bugs to do with locale, including an issue with double parsing that led to the following output from lsl:

```
2026-10-12 15:13:04.580 ( 103,894s) [R_tt_20261012-  ]      data_receiver.cpp:375    ERR| Stream transmission broke off (requested integer size exceeds type size: 2); re-connecting...
2026-10-12 15:13:04.743 ( 104,056s) [R_tt_20261012-  ]      data_receiver.cpp:375    ERR| Stream transmission broke off (requested integer size exceeds type size: 2); re-connecting...
```

This error is something I just came across as well in another C lib for interacting with an EEG amplifier over serial, that also used `std::stod` causing the same issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42118f80ff92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.