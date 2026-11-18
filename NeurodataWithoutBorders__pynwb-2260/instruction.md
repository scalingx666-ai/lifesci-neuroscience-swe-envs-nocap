# Issue

**Title:** Fix PyPI upload rejecting metadata 2.5 and gate it in CI

## Description

The 4.2.0 tag build never published. hatchling 1.32.0 emits `Metadata-Version: 2.5` by default, and `pypa/gh-action-pypi-publish@v1.14.1` pins twine 6.1.0 / packaging 25.0, which only recognize metadata up to 2.4. The upload failed with `InvalidDistribution` ([log](https://github.com/NeurodataWithoutBorders/pynwb/actions/runs/33671348841/job/100385448887)). v1.14.2 pins twine 7.0.0 / packaging 26.2. Upstream context: pypa/twine#1327.

`deploy_release.yml` only runs on a tag, so nothing in PR CI built a distribution and checked its metadata. This adds a `Check distribution metadata` step next to each build step, pinned to the twine the publish action bundles so the gate matches the upload.

Also pins `numcodecs==0.15.1` in `environment-ros3.yml`, unrelated to the above. numcodecs publishes no cp314 wheel within the bound the `zarr` extra sets, so pip compiled the sdist inside the conda environment, where the conda-forge python's CFLAGS reach gcc as an unrecognized `-partition=none`. conda-forge has a prebuilt 0.15.1 for python 3.14 on linux-64.

The `4.2.0` tag has been deleted from origin so the release can be re-cut once this merges.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00faa03aa812`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.