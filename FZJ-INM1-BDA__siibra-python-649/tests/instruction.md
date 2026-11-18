# Issue

**Title:** Allow generic tabular and image features

## Description

This PR adds the ability to digest more generic type of features so that one is not restricted with predetermined modalities. This means that such features will not necessarily reach their full potential (make use of the flexibility of modality per class design) but it allows for a quick data integration and using own data quickly.

- Should we add generic...
    - cortical profile?
    - regional connectivity?
    - regional time series activity?
- allow repository connectors and csv decoders?

Test json example
```json
{
	"@type": "siibra/feature/tabular/v0.1",
	"region": "Area 7A (SPL)",
	"modality": "any modality",
	"description": "this describes the feature",
	"species": "Homo sapiens",
	"file": "https://object.cscs.ch/v1/AUTH_227176556f3c4bb38df9feea4b91200c/hbp-d000045_receptors-human-7A_pub/v1.0/7A_pr_examples/5-HT1A/7A_pr_5-HT1A.tsv"
}
```
To do:
- [ ] add tests
- [ ] investigate if it must take a name parameter?
- [ ] test plot functions
- [ ] update "work with your own data" section in docs for how to utilise generic features

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b4710594332`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.