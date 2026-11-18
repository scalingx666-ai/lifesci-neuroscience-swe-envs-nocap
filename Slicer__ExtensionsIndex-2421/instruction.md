# Issue

**Title:** Flag extensions that change Slicer's shared Python environment

## Description

Following @lassoan's suggestion in #2392, this makes reviewers (human and AI) flag extensions that change Slicer's shared Python environment in ways that can break Slicer or other extensions, even for users who never open the module.

**`AGENTS.md`**: adds an item to the "Pay particular attention to" list in the security review section. Reviewers should request changes for:
- PyTorch installed other than through the Slicer PyTorch extension (`PyTorchUtils`, declared in `build_dependencies` / `EXTENSION_DEPENDS`). This includes `pip_install("torch")`, using light-the-torch directly, PyTorch index URLs, exact torch pins, and packages such as `nnunetv2` that pull torch from PyPI (use the NNUNet extension's install logic instead).
- Package installation at import or startup, or large downloads without user confirmation.
- Downgrading or exactly pinning packages Slicer bundles (numpy, scipy, SimpleITK, pydicom, requests, vtk), including through installed packages' requirements.
- Packages that bundle their own Qt or VTK (`opencv-python` instead of `-headless`, PyQt/PySide, pip `vtk`), and Python files that CMake doesn't install, so the packaged module fails to load.

**`scripts/extension_ai_analysis.py`**: widens the PyTorch question, which previously asked only about a direct `pip_install`, and adds a question about pinned or downgraded bundled packages and Qt-bundling packages.

These patterns came up repeatedly in the recent review of open extension PRs: SPINEPS, AutomatedDentalToolsRemote, Oncometer, ThighUSSegmentation, GliomaAI, SeqSeg, TavrWorkbench and SegmentComparison.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0848e9df94ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.