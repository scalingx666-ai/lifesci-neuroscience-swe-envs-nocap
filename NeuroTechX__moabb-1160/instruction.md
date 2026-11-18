# Issue

**Title:** Pre-release 1.6.0

## Description

Prepares the 1.6.0 release: version bump, changelog roll, and a repair pass on the citation metadata.

### Version

`moabb.__version__` was still `1.5.0dev0` while `whats_new.rst` had been accumulating under `Version 1.6` and `v1.5` was already tagged — the post-release dev bump never landed. Bumped to `1.6.0`.

### Changelog

- `Version 1.6  (Source - GitHub)` → `Version 1.6.0  (Stable - PyPi)`, and a fresh `Version 1.7  (Source - GitHub)` section opened.
- The empty released subsection now reads `- None.`, matching the 1.4.x released sections, rather than the `- None yet.` of an open section.
- **Restored missing attribution on seven entries** — `:gh:`1043``, `:gh:`1065``, `:gh:`1066``, `:gh:`1094``, `:gh:`1135``, `:gh:`1136``, `:gh:`1159``. An audit of the whole 1.6 section found these were the only ones without a `by ...` credit or a PR reference.
- **Corrected a misattribution**: `:gh:`814`` was credited to `Griffin Keeler`, but the PR was authored by [@ponpopon](https://github.com/ponpopon) (Kosei Nakada); Griffin Keeler authored the adjacent `:gh:`811``. The giveaway was a `.. _Kosei Nakada:` link target that no entry referenced.
- Dropped the stale *"bump minimum `pyriemann` to `0.11`"* claim — a later entry in the same release raises the minimum to `0.12` for the `pyriemann.geometry.*` move, so the section contradicted itself.

### Citation metadata

- **`cff-version: 1.4` → `1.2.0`.** There is no CFF 1.4. The key had been bumped alongside the MOABB release version since the 1.3.0 pre-release, which left the file rejected by `cffconvert` (`Unrecognized value for key "cff-version"`) and unparseable by GitHub's "Cite this repository" widget. It is the schema version and must not move on release.
- Fixed a malformed ORCID: `000-0002-4466-4525` → `0000-0002-4466-4525` (checksum verified). All ORCIDs were checked for format and ISO 7064 checksum; the rest are clean.
- **Added the 14 contributors** credited in the 1.6 changelog who were not listed as authors, in contribution order, before the founding-author tail. ORCIDs are included only where the identity was established from a primary source (Crossref, the dataset's own Zenodo deposit, or a self-published bidirectional link) and omitted otherwise rather than guessed — as with the pre-existing `Divyesh Narayanan` entry. For three of the omitted, a same-named ORCID record exists but is entirely empty, so the match would rest on the name alone.
- **Normalised all five citation surfaces.** They had drifted to 29 / 26 / 26 / 28 / 28. `CITATION.cff` is now the single source of truth and the README APA block, README BibTeX, `cite.rst` prose and `cite.rst` BibTeX are generated from it — all five list the same **43** authors.

### Verification

- `CITATION.cff` validates with `cffconvert`
- All five citation surfaces verified equal programmatically
- `import moabb` → `1.6.0`
- `pre-commit run` clean on every touched file
- Every `` `Name`_ `` reference in `whats_new.rst` resolves to a link target; heading underlines checked; no entry in the 1.6 section is left unattributed

### Note

Two contributors who work under handles — `stanbot8` ("Stanley C.") and `sli930` — are credited in `whats_new.rst` but not added as citation authors, since neither publishes a real name. Happy to add them under their handles if that is preferred.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1287526295bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.