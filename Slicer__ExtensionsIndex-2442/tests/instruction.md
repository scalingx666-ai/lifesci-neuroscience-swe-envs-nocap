# Issue

**Title:** Add MONAIPhysio extension (Slicer 5.12)

## Description

# New extension

**MONAIPhysio** brings [MONAI-Physio](https://github.com/Project-MONAI/monai-physio) to 3D Slicer for simulating physiological motion and connecting Slicer to NVIDIA Omniverse:

- **MONAI Physio USD Export** writes Slicer models, or tetrahedral or hexahedral volume meshes made from them, to OpenUSD, keeping geometry, placement and appearance. It can rewrite the file as the scene changes.
- **MONAI-Physio Respiratory Simulation** predicts one breathing cycle of lung motion from a chest CT. It loads the moving lung surfaces and the warped 4D-CT as sequences and writes an animated USD.

Source: https://github.com/Project-MONAI/monai-physio-slicer. This PR's entry builds `scm_revision` `5.12` (a branch of that repository).

**Downloads, all opt-in.** Nothing is installed at startup. After the user confirms, **Set up MONAI-Physio in Slicer...** installs PyTorch (download.pytorch.org), torch-scatter (data.pyg.org, or the repository's own GitHub `Data` release for Windows builds PyG does not provide) and MONAI-Physio (PyPI). The first respiratory simulation asks before downloading about 0.5 GB of network weights, and it also downloads NV-Segment-CTMR (about 870 MB, Hugging Face; non-commercial research license, shown in the log). Sample data comes only from explicit buttons. Nothing is uploaded. The first use is therefore slow; this is documented in the README and in each module's help text.

**Hardware.** Surface and hexahedra export run on the CPU. Tetrahedra export and respiratory simulation need a CUDA GPU (about 15 GB used in testing).

**Validation.** Setup, self-tests, export and simulation were run end to end on fresh Slicer 5.10.0, 5.12.4 and 5.13.0 Preview installations (Windows 11, RTX PRO 6000 Blackwell). All checks passed; see [VALIDATION.md](https://github.com/Project-MONAI/monai-physio-slicer/blob/main/docs/VALIDATION.md). Each module has a self-test, registered through `slicer_add_python_unittest`.

**Repository name.** The repository is `monai-physio-slicer`, not `Slicer...`. It lives in the Project-MONAI GitHub organization, which holds many repositories, and every MONAI-Physio repository there starts with `monai-physio` so related repositories are found together. This PR therefore also adds `monai-physio-slicer` to `REPOSITORY_NAME_CHECK_EXCEPTIONS`, as was done for MONAILabel; the exception is in its own commit.

## Tier 1

- [x] Extension has a reasonable name (not too general, not too narrow, suggests what the extension is for).
- [ ] Repository name is Slicer+ExtensionName (except if the repository that hosts the extension can be also used without Slicer) — exception requested, see above.
- [x] Repository is associated with `3d-slicer-extension` GitHub topic
- [x] Extension description summarizes in 1-2 sentences what the extension is usable (should be understandable for non-experts)
- [x] Any known related patents must be mentioned in the extension description. (none known)
- [x] LICENSE.txt is present in the repository root and the name of the license is mentioned in extension homepage. (Apache 2.0)
- [x] Extension URL and revision (scmurl, scmrevision) is correct
- [x] Extension icon URL is correct
- [x] Screenshot URLs (screenshoturls) are correct, contains at least one
- [x] Content of submitted json file is consistent with the top-level CMakeLists.txt file in the repository (dependencies, etc. are the same)
- Homepage URL points to valid webpage containing the following:
  - [x] Extension name
  - [x] Short description: 1-2 sentences, which summarizes what the extension is usable for
  - [x] At least one nice, informative image, that illustrates what the extension can do. It may be a screenshot.
  - [x] Description of contained modules: at one sentence for each module
  - [ ] Publication: link to publication and/or to PubMed reference (if available) — none yet.
- Hide unused github features (such as Wiki, Projects, and Discussions, Releases, Packages) in the repository to reduce noise/irrelevant information:
  - [x] Click `Settings` and in repository settings uncheck `Wiki`, `Projects`, and `Discussions` (if they are currently not used).
  - [ ] Click the settings icon next to `About` in the top-right corner of the repository main page and uncheck `Releases` and `Packages` (if they are currently not used) — Releases are used (the `Data` release hosts sample data and torch-scatter wheels).
- The extension is safe:
  - [x] Does not include or download binaries from unreliable sources (download.pytorch.org, data.pyg.org, PyPI, Hugging Face, and the extension's own GitHub release)
  - [x] Does not send any information anywhere without user consent (explicit opt-in is required)

The release is merged into Project-MONAI/monai-physio-slicer `main` and tagged `2026.11.1`; branches `5.10` and `5.12` point at the same commit.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2df598158e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.