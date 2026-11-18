# Issue

**Title:** feat: auto-populate BEP shortcut redirects from data/beps/beps.yml

## Description

Preamble: Duplication is evil and manual labor sucks ;)

- .

## Summary

Every time a new BEP lands, someone had to remember to add a
`bep{NNN}.md` entry to `mkdocs.yml` `redirect_maps` so that
`https://bids.neuroimaging.io/bepXXX` shortcuts keep working (#873 was
the symptom, bda3f8f7 the manual fix for BEP 45-47).

This PR removes that step for draft/proposed BEPs. A small MkDocs
`on_config` hook reads `data/beps/beps.yml` — the same source
`tools/build/generate_bep_pages.py` uses to render the target pages —
and injects the corresponding `bep{NNN}.md → …/bep_{NNN}.html`
redirect entries at build time. Any manual entry in `mkdocs.yml`
takes precedence, so the hand-curated redirects (BEPs merged into the
spec / external sites, and completed/other BEPs not tracked in
`beps.yml`) stay declarative.

<details><summary>How it works</summary>

- `tools/build/bep_redirects_hook.py` implements `on_config(config)`.
  It fetches the `redirects` plugin from `config["plugins"]`, then adds
  one entry per BEP number found in `data/beps/beps.yml`, targeting
  the internal doc path `extensions/beps/bep_{NNN}.md`. The
  mkdocs-redirects plugin turns that into a **relative** link in the
  generated redirect HTML, so the same built site works on any host
  it is served from — production, Netlify PR previews, `mkdocs serve`
  on localhost, or a `file://` preview of the built `site/` directory.
  No hostname is hard-coded.
- Keys already present in `redirect_maps` are **never overwritten**,
  so the manual block in `mkdocs.yml` stays authoritative for BEPs
  whose redirect target is external (e.g. BEP 001 → readthedocs qMRI
  appendix, BEP 002 → stats-models, BEP 027 → execution-spec).
- `mkdocs.yml` drops the 25 self-hosted entries that the hook now
  produces (BEP 004, 011, 012, 014, 016, 017, 021, 023, 024, 026, 028,
  032-037, 039-041, 043-047) and keeps the 22 manual ones (external
  targets + completed/other BEPs not in `beps.yml`).

The `hooks:` directive is native to MkDocs since 1.4; the pin in
`uv.lock` is 1.6.1. Both the GitHub Pages build
(`.github/workflows/deploy.yml`) and Read the Docs
(`.readthedocs.yaml`) run `mkdocs build` against `mkdocs.yml`, so no
change to either build entry point was required.

**Extension-less URLs on strict servers.** For every `bepNNN.md`
entry in `redirect_maps` (auto-generated and manually curated
alike), the hook also inserts a mirrored `bepNNN/index.md` entry
with the same target. mkdocs-redirects then produces both
`site/bepNNN.html` and `site/bepNNN/index.html`, so all three of
`/bepNNN`, `/bepNNN/`, and `/bepNNN.html` resolve on
`mkdocs serve` (whose dev server does no `.html` fallback) and on
other strict static hosts. On GitHub Pages both forms already
worked via `.html` fallback, so this only *adds* a case, never
regresses one.

</details>

<details><summary>End-to-end verification</summary>

After running `mkdocs build`:

```text
$ ls site/bep*.html | wc -l
47
```

All 47 shortcut redirects render — 25 from the hook, 22 from the
preserved manual block. Sample output:

```text
bep004 -> extensions/beps/bep_004.html    # hook, relative
bep011 -> extensions/beps/bep_011.html    # hook, relative
bep045 -> extensions/beps/bep_045.html    # hook, relative (was in bda3f8f7)
bep047 -> extensions/beps/bep_047.html    # hook, relative (was in bda3f8f7)
bep001 -> https://bids-specification.readthedocs.io/en/stable/appendices/qmri.html  # manual, external
bep027 -> https://bids-standard.github.io/execution-spec/               # manual, external
bep020 -> https://bids.neuroimaging.io/extensions/beps/bep_020.html     # manual, completed
```

Verified live via `mkdocs serve` at `http://127.0.0.1:8765/`, all
three URL forms resolve for auto-generated and manually curated
BEPs alike:

```text
=== auto (BEP 011) ===
  /bep011              302 -> /bep011/
  /bep011.html         200
  /bep011/             200
=== manual, external (BEP 001) ===
  /bep001              302 -> /bep001/
  /bep001.html         200
  /bep001/             200
=== manual, self-hosted (BEP 020) ===
  /bep020              302 -> /bep020/
  /bep020.html         200
  /bep020/             200
```

Adding a synthetic `number: '048'` entry to `data/beps/beps.yml` and
rebuilding produced `/bep048.html → …/bep_048.html` with no other
edit — which is exactly the automation #874 asked for.

</details>

## Test plan

- [x] `pytest tools/tests/test_bep_redirects_hook.py` — 4 tests pass
  (real-data injection, manual-wins precedence, no-op without redirects
  plugin, isolated fixture).
- [x] `uv run mkdocs build` succeeds locally and emits all 47
  `bep{NNN}.html` redirect pages with correct meta-refresh targets.
- [x] Preserved manual redirects for BEPs 001-010, 013, 015, 018-020,
  022, 025, 027, 029-031, 038, 042 point to the same URLs as before
  this PR.
- [x] Reviewer sanity-checks the Netlify PR preview (if configured for
  this repo) and confirms `/bep045`, `/bep046`, `/bep047` still work
  and no new BEP would need a `mkdocs.yml` edit.


<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--876.org.readthedocs.build/en/876/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a1eef19fff4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.