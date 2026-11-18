# Issue

**Title:** MRG: ``tpl-SUIT``

## Description

Name: Spatially Unbiased Infratentorial Template (SUIT)
## Template description
```JSON
{
  "Authors": [
    "Diedrichsen J"
  ],
  "BIDSVersion": "1.1.0",
  "Curators": [
    "Diedrichsen J",
    "Esteban O"
  ],
  "Identifier": "SUIT",
  "License": "See LICENSE file",
  "Name": "Spatially Unbiased Infratentorial Template (SUIT)",
  "ReferencesAndLinks": [
    "https://doi.org/10.1016/j.neuroimage.2006.05.056",
    "https://doi.org/10.1371/journal.pone.0133402",
    "http://www.diedrichsenlab.org/imaging/suit.htm"
  ],
  "Species": "Homo sapiens",
  "TemplateFlowVersion": "1.0.0",
  "res": {
    "1": {
      "origin": [
        -70.0,
        -100.0,
        -75.0
      ],
      "shape": [
        141,
        95,
        87
      ],
      "zooms": [
        1.0,
        1.0,
        1.0
      ]
    }
  }
}\`\`\`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b51983ccf89`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.