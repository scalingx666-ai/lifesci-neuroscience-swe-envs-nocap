# Issue

**Title:** chore: deduplicate code across interface docs, create-sibling, s3, and benchmarks

## Description

- Extract _strip_rst_roles() in interface/base.py, used by both alter_interface_docs_for_api() and alter_interface_docs_for_cmdline() to remove RST role markup and enhance handbook links.

- Add _is_repo_already_exists() hook to _GitHubLike base class so GitHub and Gitea override only the "already exists" detection (3 lines each) instead of the entire repo_create_response method (~40 lines each). GOGS/GIN inherit the base behavior unchanged.

- Extract _gen_versioned_bucket() in support/s3.py to consolidate repeated versioned S3 bucket setup (versioning, website config, public policy) across three gen_bucket_test*() functions.

- Extract StartupBenchmarks class in benchmarks/common.py with shared PATH setup, used by both benchmarks/cli.py and core.py.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c3895af46ac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.