# Issue

**Title:** [ENH] Comment on PRs/issues with their release tag

## Description

.

## Summary

After each GitHub release publication, post a comment on every PR included
in the release ("PR released in `vX.Y.Z`") and on every issue those PRs
closed via `Fixes #N` / `Closes #N` ("Issue fixed in `vX.Y.Z`"). Modeled on
the corresponding logic in [`datalad/release-action`](https://github.com/datalad/release-action/blob/main/datalad_release_action/client.py)'s
`make_release_comments` — see e.g. 
for the effect.

The component pieces:

- **`tools/announce_release.py`** — standalone `uv run` script that walks
  `git log <prev>..<tag> --first-parent` to discover PRs in a release
  (handles both squash `… (#NNN)` subjects and `Merge pull request #NNN`
  merges), queries closing issues via GraphQL, and posts comments via
  REST. Dry-run by default; `--post` actually comments. `--retroactive
  [--since TAG]` backfills past releases.
- **`.github/workflows/publish_schema.yml`** — rather than a new workflow,
  the existing release-adjacent workflow gets a `release: published`
  trigger and a new `announce_release` job. The existing `publish` job is
  gated to push events only so it doesn't fire on release events.
- **`Release_Protocol.md`** — short note in step 8 + pointer to the script
  for back-filling pre-existing releases.
- **`tools/tests/test_announce_release.py`** — 28 pytest cases covering
  tag-filter regex, comment/link formatting, `prs_in_range` parsing of
  both commit-subject styles, `release_tags` filtering, `select_tags`
  selection logic, and CLI behaviour (argparse rejections, `--help`
  without token, missing-token error, unknown-tag reported before token).
  Runs standalone via its own `# /// script` uv-run header.

## Idempotency, live-tested

Before posting, the script checks for an existing comment with the exact
target body via GraphQL pagination, so re-runs (workflow or hand-run) do
not duplicate. I exercised this on `v1.11.1` — the first run was
interrupted partway through, the second one cleanly skipped the
already-annotated PRs/issues and processed the rest:

<details><summary>Live-test output (after interrupted initial run)</summary>

```
tools/announce_release.py v1.11.1 --post

=== Release v1.11.1 (prev: v1.11.0) ===
  10 PR(s) in this release
  - PR #2346  — comment already exists, skip — '[FIX] Add emg to timeseries rule for physio/stim files'
  - PR #2345  — comment already exists, skip — 'fix: Allow mkdocs to render links in glossary'
      issue #2242  — comment already exists, skip
  - PR #2344  — [POST] comment on PR — '[FIX] Use http://www.dicomlookup.com for DICOM tags'
  - PR #2331  — [POST] comment on PR — '[FIX] Minor syntax updates on microscopy page'
  - PR #2347  — [POST] comment on PR — '[pre-commit.ci] pre-commit autoupdate'
  - PR #2337  — [POST] comment on PR — 'chore(deps): bump aiohttp from 3.12.15 to 3.13.3'
  - PR #2336  — [POST] comment on PR — 'chore(deps): bump urllib3 from 2.5.0 to 2.6.3'
  - PR #2335  — [POST] comment on PR — 'chore(deps): bump the build-dependencies group with 8 updates'
  - PR #2323  — [POST] comment on PR — '[pre-commit.ci] pre-commit autoupdate'
  - PR #2318  — [POST] comment on PR — 'chore(deps): bump lodash from 4.17.21 to 4.17.23'
```

</details>

so can see the effect on e.g.
- 
- 

## How to dry-run / backfill manually

```bash
# Dry-run one release
GITHUB_TOKEN=$(gh auth token) tools/announce_release.py v1.11.1

# Dry-run all historical releases since a starting point
GITHUB_TOKEN=$(gh auth token) tools/announce_release.py --retroactive --since v1.10.0

# Actually post (write-scoped token required)
GITHUB_TOKEN=$(gh auth token) tools/announce_release.py --post v1.11.1
```

URLs are inlined next to each `#NNN` so terminals autolink them.


<details>
<summary>Here is what I get if I run it for prior release</summary> 

```shell
> tools/announce_release.py v1.11.0

=== Release v1.11.0 (prev: v1.10.1) ===
  58 PR(s) in this release
  - PR #2325  — [DRY] comment on PR — 'REL: 1.11.0'
  - PR #2334  — [DRY] comment on PR — 'chore(deps): bump prettier from 3.7.4 to 3.8.0 in the node-utilities group'
  - PR #2322  — [DRY] comment on PR — 'fix(schema): Check SpatialReference for space, template entities'
  - PR #2019  — [DRY] comment on PR — '[ENH] Add another example to inheritance principle for .json without entities'
  - PR #2210  — [DRY] comment on PR — '[ENH] Clarify that "raw dataset" source data in example layout is a raw BIDS dataset'
  - PR #2315  — [DRY] comment on PR — '[FIX] Update and render schema definition of dataset_description.json'
  - PR #2306  — [DRY] comment on PR — 'Add pre-commit invoked checker to spot bad JSON in .md and also fix detected bad JSONs'
  - PR #2321  — [DRY] comment on PR — '[FIX] Update `Diffusion data in FSL` link'
  - PR #2319  — [DRY] comment on PR — 'Fix a single use of ManufacturerModelName in qmri.md (should be ManufacturersModelName)'
  - PR #2281  — [DRY] comment on PR — '[FIX] Add desc- entity name into descriptions.tsv example'
  - PR #2297  — [DRY] comment on PR — '[FIX] Update navigation with respect to the `bids-starter-kit`'
  - PR #1915  — [DRY] comment on PR — '[ENH] Add human statement to emphasize that _desc is the last entity'
  - PR #2304  — [DRY] comment on PR — '[FIX] Correct `bval` and clarify `bvec` descriptions'
  - PR #2310  — [DRY] comment on PR — '[Schema][Fix] add checks for multiple frame consistency issues '
  - PR #2316  — [DRY] comment on PR — 'fix: correct schema file path in eye tracking documentation comment'
  - PR #2314  — [DRY] comment on PR — '[pre-commit.ci] pre-commit autoupdate'
  - PR #2308  — [DRY] comment on PR — '[FIX] Add DWI recommended metadata table'
  - PR #1128  — [DRY] comment on PR — '[ENH] BEP020 - Eye Tracking'
  - PR #2280  — [DRY] comment on PR — '[pre-commit.ci] pre-commit autoupdate'
  - PR #2294  — [DRY] comment on PR — '[ENH] Make Pharmaceutical metadata terms less PET-specific'
  - PR #1714  — [DRY] comment on PR — '[ENH] BEP038 - Atlases'
  - PR #2291  — [DRY] comment on PR — 'chore(deps): bump the actions-infrastructure group with 3 updates'
  - PR #2292  — [DRY] comment on PR — 'chore(deps): bump the node-utilities group with 2 updates'
  - PR #2288  — [DRY] comment on PR — 'chore: Ignore redirect warnings in link checks'
  - PR #2271  — [DRY] comment on PR — 'chore: Add "serve" rule to Makefile and provide description to what actions available'
  - PR #2237  — [DRY] comment on PR — '[ENH] Updated HED Version to 8.4.0 in examples'
  - PR #2244  — [DRY] comment on PR — 'chore(deps): bump the actions-infrastructure group with 3 updates'
  - PR #1998  — [DRY] comment on PR — '[ENH] BEP042 - extension for electromyography (EMG)'
      issue #1371  — [DRY] comment on issue
  - PR #2270  — [DRY] comment on PR — '[pre-commit.ci] pre-commit autoupdate'
  - PR #2253  — [DRY] comment on PR — '[FIX] Correct typos and formatting in specification documents'
  - PR #2268  — [DRY] comment on PR — '[FIX] Fixed typo in events.md'
  - PR #2259  — [DRY] comment on PR — 'Adding bclenet as BIDS maintainer'
  - PR #2266  — [DRY] comment on PR — 'chore(deps): bump glob from 10.4.5 to 10.5.0'
  - PR #2265  — [DRY] comment on PR — '[FIX] Allowing to render JSON null type'
      issue #2260  — [DRY] comment on issue
  - PR #2245  — [DRY] comment on PR — 'chore(deps): bump astral-sh/setup-uv from 6 to 7'
  - PR #2140  — [DRY] comment on PR — 'feat(schema): Add meta.templates and allow for composing multiple references'
  - PR #2233  — [DRY] comment on PR — 'DOCS: Add ignore rule for rrid.site in link checker'
  - PR #2232  — [DRY] comment on PR — 'DOCS: Fix HED resources link in hierarchical event descriptors documentation'
  - PR #2229  — [DRY] comment on PR — '[pre-commit.ci] pre-commit autoupdate'
  - PR #2216  — [DRY] comment on PR — '[INFRA] Use full page width'
  - PR #2178  — [DRY] comment on PR — '[SCHEMA][MISC][WIP] Update schema docs with BEP Google doc to schema examples.'
  - PR #2225  — [DRY] comment on PR — '[MISC]: Fix placement of picture for Benjamin Dichter'
  - PR #2226  — [DRY] comment on PR — '[INFRA] Replace npm-requirements hack with package.json'
  - PR #2223  — [DRY] comment on PR — 'chore(deps): bump the actions-infrastructure group with 2 updates'
  - PR #2203  — [DRY] comment on PR — '[ENH] Clarify that "source datasets" do not have to be BIDS, and provide definitions for DOI and URL'
  - PR #2217  — [DRY] comment on PR — '[pre-commit.ci] pre-commit autoupdate'
  - PR #1927  — [DRY] comment on PR — '[ENH] Clearly define dual templates (fsaverage, fsaverageSym, and fsLR) in coordinate systems appendix'
      issue #1901  — [DRY] comment on issue
  - PR #2196  — [DRY] comment on PR — '[INFRA] Remove changelog generator CI workflow'
  - PR #2214  — [DRY] comment on PR — 'feat: Add unique() function to schema expression language'
  - PR #2212  — [DRY] comment on PR — '[pre-commit.ci] pre-commit autoupdate'
  - PR #2209  — [DRY] comment on PR — '[ENH] Add entity tables for motion, NIRS and MRS'
  - PR #2207  — [DRY] comment on PR — 'Update current BIDS maintainers list'
  - PR #2205  — [DRY] comment on PR — '[FIX] Update links in common-principles.md'
      issue #2204  — [DRY] comment on issue
  - PR #2201  — [DRY] comment on PR — '[FIX] Update BIDS Starter Kit links'
  - PR #2200  — [DRY] comment on PR — '[SCHEMA] Reorder fields in MRSInstitutionInformation schema'
  - PR #2199  — [DRY] comment on PR — 'fix: Remove Marie Curie from contributors'
  - PR #2190  — [DRY] comment on PR — 'chore(deps): bump the actions-infrastructure group with 2 updates'
  - PR #2177  — [DRY] comment on PR — 'DOC: make mentioning of pipeline_name consistent'

```
</details>

## Test plan

- [x] Dry-run on `v1.11.1` lists the expected 10 PRs + 1 closing issue.
- [x] `--post` on `v1.11.1` actually comments; re-run skips them all (idempotency verified live, see above).
- [x] `pytest tools/tests/test_announce_release.py` — 28 passed.
- [x] `--help` works without `GITHUB_TOKEN`; the `uv run … -- --help` invocation pattern reports "not a known release tag" rather than a misleading token error.
- [ ] On the first `release: published` after merge, confirm the `announce_release` job fires and posts comments. Maintainers can also run the retroactive sweep (`tools/announce_release.py --retroactive --post`) to backfill prior releases.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91f4bfd1c801`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.