# Issue

**Title:** Use a single dataset cache for all the runner OSes

## Description

I am still trying to figure out what exactly is failing on the caching cron job. It looks like multiple fetch requests are being denied on gin. While I think about a better solution that makes less fetch requests, one big thing we can do is reduce our cache footprint by using the same cache for all the OSes which will in turn reduce or requests. To do this we can use the new CI feature called `enableCrossOsArchive` which was released in `actions/cache` v3.2.3 in January 2023:
https://github.com/actions/cache/releases/tag/v3.2.3

I have been using it on neuroconv successfully for over a year now:

So this PR builds the cache once on Linux and shares it with macOS and Windows. I also made the hash step exit when `git ls-remote` comes back empty. Right now it silently produces the key `datasets-`, guarantees a miss and forces the full download that gin just refused.

I will be watching the first run to check for annex symlink behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80beb9351a7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.