# Issue

**Title:** Give the Staging app its own baalda-staging:// scheme

## Description

Both the released app and the Staging app registered `baalda://`, so on a machine with both installed the OS handed every link, including production invitation emails, to whichever app registered last.

- Staging Tauri overlay registers `baalda-staging://`; staging-release inlines `VITE_DEEP_LINK_SCHEME` to match.
- Server pages build their deep link from `DEEP_LINK_SCHEME` (default `baalda`); set to `baalda-staging` on the staging server, registered in the Railway IaC.
- Desktop parsers accept both schemes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77b31b79d150`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.