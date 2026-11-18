# Issue

**Title:** Prepare for release of PyNWB 4.1.0

## Description

Prepare for release of PyNWB 4.1.0

**Also fixes a `read_nwb` bug found while running CI for this release** (`bfd3f3dd`): the remote-read path leaked the `fsspec` file handle, which on Windows held a lock that failed the `windows-python3.13-opt` job during temp-dir cleanup. `NWBHDF5IO` now closes the `fsspec` handle on close.

Minor release. Sets the `CHANGELOG.md` heading/date to `4.1.0 (July 23, 2026)` and bumps the `environment-ros3.yml` hdmf pin from `6.0.2` (below the `pyproject.toml` minimum) to `6.1.0`. Also carries the deploy-dev CI fix (`e9f4330d`) so it flows to `dev` on merge.

### Before merging:
- [x] Make sure all PRs to be included in this release have been merged to `dev`. (All 6 commits since `4.0.0` are in the changelog.)
- [x] Major and minor releases: Update the dependency version bounds in `pyproject.toml` and the pinned versions in `environment-ros3.yml` to the latest as needed. (Bumped ros3 `hdmf` 6.0.2 → 6.1.0 to match `pyproject.toml` `hdmf>=6.1.0`; other bounds current.)
- [x] Major releases: Remove the deprecated functionality slated for removal in this version. (N/A: minor release.)
- [x] Check legal file dates and information in `Legal.txt`, `license.txt`, `README.rst`, `docs/source/conf.py`, and any other locations as needed. (All read `2017-2026`, current.)
- [x] Update `pyproject.toml` as needed. (Version is dynamic via hatch-vcs; no change needed.)
- [x] Update `README.rst` as needed. (No change needed.)
- [x] Update `src/pynwb/nwb-schema` submodule as needed. Check the version number and commit SHA manually. Make sure we are using the latest release and not the latest commit on the `main` branch. (At the `2.10.0` release tag.)
- [x] Update changelog (set release date) in `CHANGELOG.md` and any other docs as needed. (Set to `4.1.0 (July 23, 2026)`.)
- [x] Run tests locally including gallery, validation, and streaming tests, and inspect all warnings and outputs (`python test.py -v -p -i -b -w -r > out.txt 2>&1`). Try to remove all warnings. (1066 tests OK in a conda env with ROS3-capable h5py. Remaining warnings are from HDMF core, third-party ndx-* extensions, and matplotlib teardown; the one pynwb-origin warning, an auto-derived `OpticalSeries/num_samples` int64→uint64 dtype conversion, is a write-behavior change deferred to a follow-up PR against `dev`.)
- [x] Test docs locally and inspect all warnings and outputs `cd docs; make clean && make html`. (Build succeeded, no warnings.)
- [x] After pushing this branch to GitHub, manually trigger the "Run all tests" GitHub Actions workflow on this branch by going to https://github.com/NeurodataWithoutBorders/pynwb/actions/workflows/run_all_tests.yml, selecting "Run workflow" on the right, selecting this branch, and clicking "Run workflow". Make sure all tests pass.
    - https://github.com/NeurodataWithoutBorders/pynwb/actions/runs/30119248614
- [x] Check that the readthedocs build for this PR succeeds (see the PR check)

### After merging:
1. Create release by following steps in `docs/source/make_a_release.rst` or use alias `git pypi-release [tag]` if set up
2. After the CI bot creates the new release (wait ~10 min), check the release notes on the [GitHub releases page](https://github.com/NeurodataWithoutBorders/pynwb/releases). The workflow fills them from this version's section of `CHANGELOG.md`, and falls back to auto-generated notes if that section is empty or its heading does not match the tag.
3. Check that the readthedocs "stable" build runs and succeeds
4. Either monitor [conda-forge/pynwb-feedstock](https://github.com/conda-forge/pynwb-feedstock) for the regro-cf-autotick-bot bot to create a PR updating the version of HDMF to the latest PyPI release, usually within 24 hours of release, or manually create a PR updating `recipe/meta.yaml` with the latest version number and SHA256 retrieved from PyPI > PyNWB > Download Files > View hashes for the `.tar.gz` file. Re-render and update dependencies as needed.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fef4098da897`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.