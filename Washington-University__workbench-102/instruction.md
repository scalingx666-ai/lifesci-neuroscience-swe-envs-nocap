# Issue

**Title:** src/debian/copyright: fix IBMCPL-1.0 block and https:// URLs

## Description

Two small tune-ups for src/debian/copyright, driven by attempts to keep Debian's own debian/copyright close to this file so it doesn't drift over time:

* Format: and Source: fields switched from http:// to https:// (this matches Debian's copyright-format spec and www.humanconnectome.org redirects anyway).

* License: IBMCPL-1.0 block reformatted so it actually parses as a Debian copyright-format 1.0 stanza:
    - remove the leading space on "License: IBMCPL-1.0" (a stanza header must start in column 0)
    - de-indent each body line from 2 spaces to 1 space (copyright- format uses a single-space indent for continuation lines)
    - replace the blank line between the two paragraphs with the " ." paragraph-separator (a bare blank line terminates the stanza and drops the rest of the block from parsers)

No content changes to any license text; purely a formatting fix so the block is recognised by dpkg-parsechangelog / lintian / cme / Debian's copyright-format tooling.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e131112d579`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.