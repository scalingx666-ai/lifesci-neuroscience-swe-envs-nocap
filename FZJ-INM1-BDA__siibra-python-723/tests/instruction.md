# Issue

**Title:** Maint configuration loading

## Description

## Summary

Improve configuration and volume-provider initialization performance by reducing unnecessary HTTP overhead and eager remote metadata access.

### Changes

* Enable `archive_mode` for configuration repositories to avoid fetching configuration files individually.
* Make archive-backed `GithubConnector.search_files()` use the local archive.
* Reuse a shared `requests.Session` in `HttpRequest` to benefit from connection pooling.
* Remove redundant `HttpRequest.data` usage in favor of `get()`.
* Avoid eager Neuroglancer mesh metadata requests during provider construction; fetch fragment metadata lazily when needed.

### Impact

This significantly reduces registry build time, especially for map configurations containing many Neuroglancer providers, by avoiding hundreds of remote requests during object initialization.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92fcb1c38be5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.