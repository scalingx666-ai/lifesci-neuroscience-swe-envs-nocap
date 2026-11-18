# Issue

**Title:** BF(TST): tolerate chardet 7.5.0/7.5.1 ISO-8859-1 misdetection in test_assure_unicode

## Description

chardet 7.5.0 and 7.5.1 misdetect b'mam\xe1' (ISO-8859-1) as UTF-8, causing the mamá assertion in test_assure_unicode to raise UnicodeDecodeError.  Wrap just that check to accept failure on those two versions; other assertions in the test are unaffected and continue to run.  Monitor

-  
 
for the upstream fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8f31aeae1b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.