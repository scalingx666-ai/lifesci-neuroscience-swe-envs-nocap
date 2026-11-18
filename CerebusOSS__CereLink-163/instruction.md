# Issue

**Title:** Fix getters using Central

## Description

1. getChanInfo() — falls back to getLegacyConfigBuffer()->chaninfo[]
2. getGroupInfo() — falls back to getLegacyConfigBuffer()->groupinfo[inst][]
3. getFilterInfo() — falls back to getLegacyConfigBuffer()->filtinfo[inst][]
4. getSysInfo() — falls back to getLegacyConfigBuffer()->sysinfo
5. getProtocolVersion() — reads from legacy->procinfo[inst].version
6. getProcIdent() — reads from legacy->procinfo[inst].ident
7. Impl::getChanInfoPtr() — falls back to legacy->chaninfo[]
8. Impl::rebuildChannelTypeCache() — refactored to use the now-fixed getChanInfoPtr()

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f63f3a742fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.