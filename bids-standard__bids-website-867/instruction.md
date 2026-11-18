# Issue

**Title:** [ENH] beps.yml: record active bids-specification PRs

## Description

It was triggered by seeing some outdated BEP pages and doing the game of "follow the breadcrumbs"

Cross-checked open PRs on bids-standard/bids-specification against data/beps/beps.yml and filled in missing pull_request / html_preview / pull_request_created fields for BEPs that already have PRs -- corresponding BEP participants please verify

- BEP016 (attn @bids-standard/bep016): replace closed PR 2211 with active PR 2258
- BEP017 (attn @bids-standard/bep017): add PR 1902
- BEP021 (attn @bids-standard/bep021): add PR 1680
- BEP023 (attn @bids-standard/bep023): add draft PR 2339
- BEP036 (attn @bids-standard/bep036): add PR 2123 (was only mentioned in status text)
- BEP046 (attn @bids-standard/bep046): add PR 2333

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--867.org.readthedocs.build/en/867/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ebbeae564a72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.