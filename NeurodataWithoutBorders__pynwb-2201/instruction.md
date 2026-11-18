# Issue

**Title:** Prepare for release of PyNWB 4.0.0

## Description

Release PR for **PyNWB 4.0.0**.

### Minor changes:

**ROS3 CI fix:** The `*-ros3` jobs failed with `OSError: ... AWS region wasn't specified`. Root cause is environment drift: HDF5 2.1.0 / h5py 3.16.0 (released between the last green `dev` run and this run) now require an explicit AWS region for the ROS3 driver. Fixed by passing `aws_region="us-east-2"` (DANDI Archive bucket region) at each ROS3 open site and adding an `aws_region` argument to `validate()`.

**Overlap with #2187 (Zarr validation):** The `aws_region` addition here touches `validate()` / `_validate_single_file` / `get_cached_namespaces_to_validate` — the same code that #2187 refactors. However, I would like to pursue a different approach with regard to `validate / get_cached_namespaces_to_validate` that needs to propagate through major versions of HDMF and PyNWB. For now, this change forwards `aws_region` alongside the existing `driver` kwarg. `validate()` on a Zarr store remains broken on this branch (pre-existing).


### Before merging:
- [x] Make sure all PRs to be included in this release have been merged to `dev`.
- [x] Major and minor releases: Update package versions in `requirements.txt`, `requirements-dev.txt`,
  `requirements-doc.txt`, `requirements-opt.txt`, and `environment-ros3.yml` to the latest versions,
  and update dependency ranges in `pyproject.toml` and minimums in `requirements-min.txt` as needed.
  Run `pip install pur && pur -r requirements-dev.txt -r requirements.txt -r requirements-opt.txt`
  and manually update `environment-ros3.yml`. <sub>Done via `pur`; `requirements.txt`/`requirements-dev.txt` were already current. `numpy`/`pandas` kept within `hdmf` and `pandas<3` ceilings. `requirements-min.txt` and `pyproject.toml` ranges left unchanged (no change needed). Not yet validated by the test/CI steps below.</sub>
- [x] Check legal file dates and information in `Legal.txt`, `license.txt`, `README.rst`, `docs/source/conf.py`,
  and any other locations as needed <sub>Copyright year updated 2017-2025 → 2017-2026.</sub>
- [x] Update `pyproject.toml` as needed <sub>No change needed; version is derived dynamically from the git tag.</sub>
- [x] Update `README.rst` as needed <sub>Copyright year updated.</sub>
- [x] Update `src/pynwb/nwb-schema` submodule as needed. Check the version number and commit SHA
  manually. Make sure we are using the latest release and not the latest commit on the `main` branch. <sub>Already at the `2.10.0` release tag.</sub>
- [x] Update changelog (set release date) in `CHANGELOG.md` and any other docs as needed <sub>Left as `(Upcoming)` until the release date is known.</sub>
- [x] Run tests locally including gallery, validation, and streaming tests, and inspect all warnings and outputs
  (`python test.py -v -p -i -b -w -r > out.txt 2>&1`). Try to remove all warnings.
- [x] Test docs locally and inspect all warnings and outputs `cd docs; make clean && make html`
- [x] After pushing this branch to GitHub, manually trigger the "Run all tests" GitHub Actions workflow on this
  branch by going to https://github.com/NeurodataWithoutBorders/pynwb/actions/workflows/run_all_tests.yml, selecting
  "Run workflow" on the right, selecting this branch, and clicking "Run workflow". Make sure all tests pass.
    - https://github.com/NeurodataWithoutBorders/pynwb/actions/runs/28409545413
- [x] Check that the readthedocs build for this PR succeeds (see the PR check)

### After merging:
1. Create release by following steps in `docs/source/make_a_release.rst` or use alias `git pypi-release [tag]` if set up
2. After the CI bot creates the new release (wait ~10 min), update the release notes on the
   [GitHub releases page](https://github.com/NeurodataWithoutBorders/pynwb/releases) with the changelog
3. Check that the readthedocs "stable" build runs and succeeds
4. Either monitor [conda-forge/pynwb-feedstock](https://github.com/conda-forge/pynwb-feedstock) for the
   regro-cf-autotick-bot bot to create a PR updating the version of HDMF to the latest PyPI release, usually within
   24 hours of release, or manually create a PR updating `recipe/meta.yaml` with the latest version number
   and SHA256 retrieved from PyPI > PyNWB > Download Files > View hashes for the `.tar.gz` file. Re-render and update
   dependencies as needed.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed4388f55eeb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.