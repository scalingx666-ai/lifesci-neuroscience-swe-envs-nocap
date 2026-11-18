# Issue

**Title:** Add ability to get full partner properties during annotation /label requests.

## Description

@stuarteberg @olbris If `/label?relationships=verbose` is used for annotation datatype, data returns properties of partner at same JSON level as previous `relationships=true` requests:

```json
[
    {
        "Kind": "PostSyn",
        "Pos": [
            40527,
            22399,
            35000
        ],
        "Prop": {
            "conf": "0.6405360102653503",
            "user": ""
        },
        "Rels": [
            {
                "Kind": "PreSyn",
                "Prop": {
                    "conf": "0.9739999771118164",
                    "user": ""
                },
                "Rel": "PostSynTo",
                "To": [
                    40563,
                    22398,
                    35022
                ]
            }
        ],
        "Tags": []
    }
]
```

Note that the `To` is retained since it was returned in prior `Rels` elements but makes the `Pos` redundant so it's removed,

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `206e7aba5ad1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.