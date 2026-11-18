# Issue

**Title:** added submodule w/ test ecat, and dicom ge, siemens, and phillips data

## Description

I needed to add a test ECAT image for adding in a plugin, but I noticed in the comments that there were TODO's concerning testing GE vs Siemens etc. So I put together a testdata repository and added to bidscoin as a submodule in this pr. A link to the added repo can be seen [here](https://github.com/openneuropet/testdata). 

I'll most likely still use environment variables for testing to stay flexible w/ my files and paths, however I don't see a reason not to include this into the main branch or further include testdata that is already in use for development on the bidscoin maintainers end.

If you tree `tests/` you'll see that the submodule adds several folders and imaging files under `tests/testdata/` ala:

```bash
machine:bidscoin user$ tree tests/ -d
tests/
└── testdata
    ├── dicom
    │   ├── GE
    │   │   ├── 2_3db0maps
    │   │   ├── 3_3db0maps
    │   │   └── 6_CV_Neuro
    │   ├── Philips
    │   │   └── fmap
    │   └── Siemens
    │       ├── 2_gre_field_magph
    │       ├── 3_gre_field_magph
    │       ├── 4_gre_field_ph
    │       └── 5_gre_field_mag
    └── ecat
        └── Siemens

15 directories
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c5316552d171`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.