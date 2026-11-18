# Issue

**Title:** Add SlimFormerPlusPlus extension

## Description

# New extension

SlimFormerPlusPlus segments 15 abdominal organs in CT with the SlimFormer++ network (6.0 M parameters), trained with nnU-Net v2 on AMOS2022. It runs on an ordinary CPU (an NVIDIA GPU is used if present). Like TotalSegmentator, it installs PyTorch and nnU-Net through the PyTorch and NNUNet extensions, after asking the user, and downloads the network weights (about 22 MB per mode, SHA256-verified) from the GitHub Releases of the extension repository.

## Tier 1

- [x] Extension has a reasonable name (not too general, not too narrow, suggests what the extension is for).
- [x] Repository name is Slicer+ExtensionName
- [x] Repository is associated with `3d-slicer-extension` GitHub topic
- [x] Extension description summarizes in 1-2 sentences what the extension is usable (should be understandable for non-experts)
- [x] Any known related patents must be mentioned in the extension description. (No known related patents.)
- [x] LICENSE.txt is present in the repository root and the name of the license is mentioned in extension homepage. The Slicer module is under the Apache License 2.0. The network definition (`model.py`) and the weights are under the SlimFormer++ Noncommercial Research License 1.0; this is named in the extension description and on the homepage.
- [x] Extension URL and revision (scmurl, scmrevision) is correct (`main`)
- [x] Extension icon URL is correct
- [x] Screenshot URLs (screenshoturls) are correct, contains at least one
- [x] Content of submitted json file is consistent with the top-level CMakeLists.txt file in the repository (dependencies: PyTorch, NNUNet)
- Homepage URL points to valid webpage containing the following:
  - [x] Extension name
  - [x] Short description: 1-2 sentences, which summarizes what the extension is usable for
  - [x] At least one nice, informative image, that illustrates what the extension can do. It may be a screenshot.
  - [x] Description of contained modules: at one sentence for each module (one module, SlimFormer++)
  - [x] Publication: link to publication and/or to PubMed reference (if available) (Citation section)
- Hide unused github features (such as Wiki, Projects, and Discussions, Releases, Packages) in the repository to reduce noise/irrelevant information:
  - [x] Click `Settings` and in repository settings uncheck `Wiki`, `Projects`, and `Discussions` (if they are currently not used).
  - [ ] Click the settings icon next to `About` in the top-right corner of the repository main page and uncheck `Releases` and `Packages` (if they are currently not used). Releases are used: they host the network weights.
- The extension is safe:
  - [x] Does not include or download binaries from unreliable sources (only the network weights, from this repository's GitHub Releases, checked against SHA256 sums in the module)
  - [x] Does not send any information anywhere without user consent (explicit opt-in is required)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb101d148078`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.