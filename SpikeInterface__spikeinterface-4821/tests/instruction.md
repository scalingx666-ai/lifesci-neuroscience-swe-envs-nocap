# Issue

**Title:** Don't mount remote paths when running a sorter in a container

## Description

.

Before running a sorter in Docker or Singularity, `find_recording_folders` collects every path in the recording's dict and mounts its parent folder into the container. Two recordings can be read over the network and store a URL in a path argument:

- `NwbRecordingExtractor` streaming a file (e.g. from DANDI) keeps the URL in `file_path`.
- `ZarrRecordingExtractor` reading from cloud storage keeps the URL (e.g. `s3://...`) in `folder_path`.

The URL was resolved as if it were a local file and the resulting folder was passed to Docker as a volume, which Docker rejects. Remote paths are read over the network from inside the container, so there is nothing to mount for them, and I now skip any path with a URL scheme (`://`) before computing the folders to mount.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d7bd2140b32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.