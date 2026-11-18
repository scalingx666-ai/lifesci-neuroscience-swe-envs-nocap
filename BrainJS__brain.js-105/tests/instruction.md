# Issue

**Title:** change data.constructor !== Array to Array.isArray

## Description

change data.constructor !== Array to Array.isArray
using search and repalce: ([a-z0-9A-Z\.\[\]]+)\.constructor\s*!==\s*Array  to Array.isArray\($1\)

found it did problems in nodejs v8.9.1 when comparing arrays created from a sandbox - a 'vm' ( a different runtime context )

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `366cde6c8514`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.