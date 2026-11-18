# Issue

**Title:** Allow only one thread in S3 downloader's progress report callback

## Description

This PR should fix an issue with faulty `PROGRESS` commands that were sent from the "datalad" git annex special remote. This error was reported in INM7's "data" matrix channel. Here is an excerpt from the related error messages:

```
external special remote protocol error, unexpectedly received "PROGRESS PROGRESS 69730304" (unable to parse command)
unable to use special remote due to protocol error
external special remote protocol error, unexpectedly received " 61865984" (unable to parse command)
unable to use special remote due to protocol error]
```

The PR ensures that only one thread is "in" the progress bar callback that is used in S3 downloads. IMHO the issue was `boto3.download_fileobj()` (which is used to download S3 objects) can create multiple threads. Therefore the callback might be called by multiple threads without synchronisation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48e74ea66d39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.