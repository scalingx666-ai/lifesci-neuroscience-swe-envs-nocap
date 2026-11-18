# Issue

**Title:** COMP: Update CTK to latest version

## Description

Update CTK from 5056664 to a5c2e4d1 (latest commontk/CTK master).

```
$ git shortlog 5056664..a5c2e4d1cdac28e0b93c3434ec042f19e63d1d55
Andras Lasso (4):
      COMP: Fix build of VTK visualization tests with VTK 9.6
      BUG: Keep popup widgets within screen boundaries
      ENH: Remove unused ctkBinaryFileDescriptor class
      BUG: Keep DICOM table selection consistent when database content changes

Davide Punzo (8):
      ENH: Improve placeholder text color handling in visual browser
      ENH: Update default maximum patients query limit to 0 (unlimited)
      BUG: Fix study and patient removal logic
      ENH: Add direct PACS query by filter level to the DICOM visual browser.
      ENH: Improve warning for DCMTK queries
      BUG: Fix leaks at exit for ctkDICOMPatientView
      STYLE: Change list mode icon
      STYLE: Change position of filtering labels in visual browser

Stefan Dinkelacker (4):
      COMP: Do not forward declare OFList
      COMP: Cover DCMTK with STL containers in CI
      ENH: Set default log level of Event Admin plugin to INFO
      BUG: Log retrieve progress at debug level

Tobias Stein (1):
      BUG: Fix XNAT server version retrieval for XNAT 1.7 and later

certisXavier (1):
      BUG: Fix crash in ctkDICOMPatientView destruction due to QT parenting (#1450)

dependabot[bot] (4):
      COMP: Bump actions/checkout from 6.0.3 to 7.0.0
      COMP: Bump actions/setup-python from 6.2.0 to 6.3.0
      COMP: Bump actions/checkout from 7.0.0 to 7.0.1
      COMP: Bump actions/setup-python from 6.3.0 to 7.0.0
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4eafce4f2e3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.