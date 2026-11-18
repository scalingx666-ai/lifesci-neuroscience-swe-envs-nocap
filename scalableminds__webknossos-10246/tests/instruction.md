# Issue

**Title:** Patch vulnerable backend dependencies

## Description

### Summary
Fixes the backend findings of the latest Trivy scan:
- Align all `com.fasterxml.jackson` 2.x modules on 2.18.12. Previously `jackson-databind` was pinned to 2.14.3 while `jackson-core` and others were already resolved to 2.18.3. `jackson-module-scala` is pinned along since it rejects a mismatching databind minor version at runtime.
- `com.sun.mail:jakarta.mail` 1.6.7 → 1.6.8 (via commons-email)
- `org.jdom:jdom2` 2.0.6 → 2.0.6.1 (via cdm-core)

### Steps to test:
- `sbt compile`, backend unit tests pass
- Start WEBKNOSSOS, check that it boots and JSON APIs / emails work as usual

------
- [ ] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48f0b9dbce3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.