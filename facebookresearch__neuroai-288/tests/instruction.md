# Issue

**Title:** neuralfetch: parse hashed git-annex pointers in Gin, keep `_https_base` out of `model_dump`

## Description

- **Hashed annex pointers got the wrong key.** `Gin._read_pointer_key` took everything after `/annex/objects/` as the key, so pointer files using the hashed object path (`/annex/objects/aB/Cd/<key>/<key>`) returned `aB/Cd/<key>/<key>`. The GIN web URL was then registered against a key that doesn't exist, and those files were never fetched. The key is now the last path component, which is correct for both layouts.
- **`_https_base` leaked into `model_dump()`.** As a `@pydantic.computed_field`, the private helper was serialized with the config, so `Gin(**gin.model_dump())` failed with `extra_forbidden`. It is now a plain property.

Adds tests for hashed-pointer parsing and for `_https_base` staying out of `model_dump()`.

Fix by @hubertjb (co-author on the commit).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d21108b4a0c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.