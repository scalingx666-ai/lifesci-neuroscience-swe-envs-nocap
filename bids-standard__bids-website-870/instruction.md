# Issue

**Title:** [ENH] add "Developer guidelines" page for BIDS-aware software

## Description

## Summary

Relating in preparation for BIDS 2.0 work, we need to raise awareness about best development practices to facilitate later smoother transition.
This adds a new "Developer guidelines" page under **Ecosystem → Tools**, echoing the placement of BEP guidelines under Extensions.

The page targets authors of software that **consumes or produces BIDS datasets** — converters, validators, curation tools, viewers, libraries, BIDS Apps — with normative (RFC 2119) recommendations. Flagship rule is **"Do not resolve symbolic links"**, motivated by two independent, real-world failure modes:

1. The [Inheritance Principle](https://bids-specification.readthedocs.io/en/stable/common-principles.html#the-inheritance-principle) requires walking *up the dataset tree* from a data file to collect applicable metadata; symlink resolution (`realpath`, `pathlib.Path.resolve()`, `find -L`, …) can redirect that walk out of the BIDS hierarchy entirely, so sidecars that should apply are silently missed.
2. git-annex / DataLad-managed datasets expose content via symlinks into `.git/annex/objects/…`; resolving those symlinks moves the process into the annex object store, where none of BIDS' entity/sidecar/inheritance relationships hold. This is the most common way a "reasonable-looking" canonicalization silently breaks correctness on published, DataLad-managed datasets.

The BIDS specification is intentionally silent on filesystem-specific implementations, so this guidance lives on the website (not in the specification repo) as pragmatic recommendations for tool authors.


<details><summary>Full list of guidelines in the new page</summary>

- Do not resolve symbolic links
- Implement the Inheritance Principle correctly
- Treat input datasets as read-only
- Drive parsing from the BIDS schema, don't hardcode
- Respect case-sensitivity of labels (reconciled with spec's silence on host filesystem case behavior)
- Handle lazily-materialized content
- Honor spec-defined exclusions and `.bidsignore`
- Check `dataset_description.json` compatibility
- Emit outputs as valid BIDS derivatives
- Follow the BIDS Apps 2.0 execution specification
- Record provenance in outputs (BEP028: BIDS-Prov)
- Validate inputs before doing real work (with explicit opt-out)
- Cross-platform path handling (POSIX paths in metadata)
- Prefer existing language bindings (PyBIDS, ancp-bids, bidsschematools, bids-matlab, bidser, bids-validator)
- Test against realistic datasets (including a DataLad-managed variant)

</details>

<details><summary>Structural / editorial choices</summary>

- Placed at `docs/software_development/index.md` — a **new top-level `docs/` subdirectory**, not under `docs/standards/`, because these are guidelines rather than a standard.
- Added to `mkdocs.yml` nav as a leaf entry inside **Ecosystem → Tools**, echoing how BEP guidelines sits inside Extensions.
- Every section uses a unified template: imperative title, one or two normative sentences with RFC 2119 keywords, an optional single rationale paragraph, and an optional bullet list. No bold **Why:** / **How to apply:** callouts.
- One-sentence-per-line source formatting (matches existing pages such as `docs/extensions/guidelines.md`).

</details>

## Test plan

- [x] `mkdocs build` locally renders the new page — verified via Playwright against the static build: H1 is "Developer guidelines"; nav ancestry is **Ecosystem → Tools → Developer guidelines**; no JS/console errors on the page. (Pre-existing `mkdocs build --strict` warnings about missing `collaboration/bids_github/*.md` and unbuilt `extensions/beps/bep_*.md` are unrelated — they require `make update`; the new page introduced no new warnings.)
- [x] All in-page anchor links resolve — every H2 id was collected from the rendered DOM and the three author-written prose links (`#do-not-resolve-symbolic-links`, `#prefer-existing-language-bindings`, `#emit-outputs-as-valid-bids-derivatives`) each appear at their expected targets.
- [x] All expected external links are present in the rendered HTML with correct spelling, including the BEP028 redirect at `https://bids.neuroimaging.io/bep028.html`, the execution spec at `https://bids-standard.github.io/execution-spec/`, spec anchors for the Inheritance Principle and case-collision intolerance, and every library-binding URL. (Playwright verified presence but did not fetch them over the network.)
- [x] Reviewer sanity-checks the RFC 2119 keyword usage per section and the framing of "case-sensitivity of labels vs. host filesystem".
- [ ] Discuss a potential follow-up: cross-links from `docs/tools/index.md`, `docs/getting_started/bids_apps/index.md`, `docs/standards/bids_app_specification/index.md`, and `docs/extensions/guidelines.md` back to the new page (not included here to keep the PR focused).


<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--870.org.readthedocs.build/en/870/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d4256aeb35d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.