# Issue

**Title:** [ENH] Add Open Science Assistant (OSA) BIDS chat widget

## Description

# Add Open Science Assistant (OSA) BIDS chat widget

Closes part of bids-standard/bids-specification#2256 (next-phase BIDS assistant)

> [!tip]
> Test the assistant from built PR link, on bottom right:
> https://bids-specification--2442.org.readthedocs.build/en/2442/

## Summary

This adds an embedded BIDS assistant to the specification site, powered by the [Open Science Assistant (OSA)](https://github.com/OpenScience-Collective/osa) and its dedicated BIDS community. It is a single self-contained script (its own floating button, no iframe), configured entirely from a YAML file in the OSA repository.

This is offered as a **complementary alternative** to the iframe widget in bids-standard/bids-specification#2254 (thanks @yarikoptic). Both proposals come out of the discussion in bids-standard/bids-specification#2256; the maintainers can pick whichever fits best, or evaluate them side by side. Nothing here blocks or supersedes #2254.

## What changes

Two minimal changes, mirroring the structure of #2254:

- `mkdocs.yml`: set `theme.custom_dir: src/overrides`
- `src/overrides/main.html`: a theme override that injects the OSA snippet

```html
<script src="https://demo.osc.earth/osa-chat-widget.js"></script>
<script>
  OSAChatWidget.setConfig({ communityId: 'bids' });
</script>
```

No CSS, no iframe, no toggle plumbing: the widget renders and manages its own UI.

## Design notes (and how this differs from #2254)

- **Self-contained, not an iframe.** Because it is a native widget rather than an embedded page, **chat history persists in `localStorage` across page navigation** — directly addressing the UX concern raised in the #2254 review thread (history lost when navigating between spec pages).
- **Page-context aware.** The widget shares the current page URL/title so answers are scoped to what the reader is looking at (opt-in, shown as a checkbox).
- **Unpinned by design.** The script URL is intentionally not pinned to a release so the BIDS community always gets the latest assistant **without merging another PR here**. It is served from OSA's own domain, and push access to the OSA deployment is restricted to the BIDS community maintainer(s) and OSA admins, so the embed surface is controlled. Security-sensitive deployments can instead pin a tagged release with Subresource Integrity — hashes are published with each [OSA release](https://github.com/OpenScience-Collective/osa/releases).

## What the BIDS assistant actually does

The whole assistant is defined in one community config ([`src/assistants/bids/config.yaml`](https://github.com/OpenScience-Collective/osa/blob/develop/src/assistants/bids/config.yaml)), so the BIDS community can change behavior by editing YAML, with no OSA code changes. Current capabilities:

- **YAML-only onboarding & tuning.** Branding (title, greeting, placeholder, suggested questions), model choice, system prompt, and the full doc list are all in one file.
- **Live documentation retrieval.** ~40 curated BIDS docs, each fetched from `raw.githubusercontent.com/.../master` (spec) and `.../main` (website), so answers track the **current** text rather than a frozen snapshot. Coverage spans common principles, the schema, all 13 modalities (MRI, EEG, MEG, iEEG, PET, NIRS, Motion, Microscopy, MRS, EMG, behavioral, genetics, physiological), derivatives, getting-started, FAQs, tools, and governance.
- **Codebase / GitHub indexing.** Daily sync of **issues and PRs** across `bids-specification`, `bids-validator`, `bids-website`, and `bids-examples`, so the assistant can answer "what are the recent PRs / open issues / discussions about X" with real, linked items.
- **BEP awareness.** A `lookup_bep` tool searches synced **BIDS Extension Proposal content from open pull requests** (the rendered BEP drafts), returning the direct PR and HTML-preview links.
- **Papers citing BIDS.** Weekly citation sync over the canonical BIDS paper plus the modality extension papers (EEG, iEEG, MEG, PET, genetics, microscopy, qMRI, ASL, NIRS, Motion, MRS, BIDS Apps); the assistant can surface and cite real references instead of guessing.
- **Validator & converter guidance.** Built-in knowledge of the validator (online + CLI) and the common converters (dcm2bids, HeuDiConv, MNE-BIDS, EEG-BIDS, bidscoin, pet2bids).
- **NeuroStars integration.** Discourse threads tagged `bids`.
- **Guardrails.** Explicit anti-hallucination rules (never fabricate issue/PR numbers, DOIs, or URLs), per-community budget caps, and a CORS allow-list that restricts where the widget may be embedded (this site is already on it).

Sync cadence: GitHub issues/PRs daily, papers weekly, BEPs weekly — so the knowledge base stays current.

## Testing

- Local `mkdocs serve` renders the widget on spec pages; the floating button opens the BIDS assistant and history survives navigation between pages.
- The change is additive and scoped to a theme override; it does not touch spec content or the schema.

## Links

- OSA: https://github.com/OpenScience-Collective/osa
- BIDS assistant demo: https://demo.osc.earth/bids
- Related issue: bids-standard/bids-specification#2256
- Related/alternative PR: bids-standard/bids-specification#2254

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c2e109c8d7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.