# Issue

**Title:** [FIX] Correct typos and formatting in specification documents

## Description

Produced with the help of
- #2252 

Fixed several language and formatting errors discovered during comprehensive proofing of specification files using the proof-spec skill:

In src/common-principles.md:
- Line 18: Fixed duplicated "be" in "cannot be be interpreted"
- Line 96: Changed "unapplicable" to correct form "inapplicable"
- Line 634: Removed duplicated "files" in "files files MUST NOT"
- Line 1070: Fixed duplicated "is" to "it is RECOMMENDED"

In src/CHANGES.md:
- Line 80: Wrapped literal URL in angle brackets per markdown style guide (remark-lint: no-literal-urls rule)

In src/appendices/meg-systems.md:
- Line 17: Fixed broken table separator with space in middle
- Auto-formatted table and list styling for consistency

In src/schema/objects/entities.yaml:
- Line 153: Fixed missing closing quote in "InversionTime" metadata field reference

In src/schema/rules/checks/deprecations.yml:
- Line 1: Added missing YAML document start marker (---) to resolve yamllint warning

All fixes improve readability and correctness of the specification without changing any technical requirements or meaning.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `373da35afb81`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.