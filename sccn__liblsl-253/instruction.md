# Issue

**Title:** Leverage std::string_view overloads in pugixml 1.15

## Description

Remove unnecessary c_str() calls and rely on the new std::string overloads introduced in pugixml 1.15.

Close #247

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63741a91f646`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.