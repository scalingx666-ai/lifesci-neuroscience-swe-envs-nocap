# Issue

**Title:** Analyze only the files a pull request changes in AI analysis

## Description

> *This change was prepared by Claude (Anthropic's AI assistant) under the direction of @pieper, in consultation with the Slicer developer team.*

The AI analysis job on #2396 failed even though that PR changes only `ThighUSSegmentation.json` ([run](https://github.com/Slicer/ExtensionsIndex/actions/runs/39457350151/job/118747956564?pr=2396)). The job analyzed 8 extensions and stopped when cloning the archived Ultrasound extension failed.

**Cause.** The workflow found "changed" files with `git diff origin/main FETCH_HEAD`, which compares the current tip of `main` with the fork's head commit. Only that one commit is fetched, so the branch point isn't available either. #2396's branch is 45 commits behind `main`, so the diff also listed every extension file changed on `main` since then:
- files `main` deleted or renamed came back as additions: `Ultrasound.json` (archived in #2408), `LayerDisplayableManager.json` (#2412) and `Voxelization.json` (renamed in #2405);
- files `main` modified came back as modifications: DRAISegmentation, DelineateLiverRT, OpenLIFU and SlicerMorph.

A failed clone then aborted the script without showing git's error. This probably explains other unexplained `ai-analysis` failures as well, such as the earlier SlicerUltrasound clone error on #2404.

The validation and packaging workflows aren't affected. They check out full history and diff with `origin/$BASE_REF...HEAD`, which compares against the branch point.

**Changes**
- `.github/workflows/extension-ai-analysis.yml`: take the file list from the pull request itself (`gh api repos/{repo}/pulls/{n}/files`, skipping removed files; renames are reported under their new path). This adds `pull-requests: read` to the job's permissions. The fork's head commit is still fetched only to check out those JSON files as data; no fork code runs. The filename filter is also tightened to `^[A-Za-z0-9._-]+\.json$`.
- `scripts/extension_ai_analysis.py`: when cloning an extension fails or times out, print the command and git's error output, continue with the remaining extensions, and exit with status 1 at the end.

**Testing (local)**
- The new file-list command returns only `ThighUSSegmentation.json` for #2396, the 4 added files for #2420, and `HexaMesher.json` for the rename in #2405.
- Running the script on two entries pointing to nonexistent repos (one with `scm_revision`, one without) reports each clone failure with git's "Repository not found" message, processes both, and exits with status 1.
- The successful-analysis path is unchanged, but I didn't exercise it locally because that needs the inference API key. This PR's own CI run should cover it.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8d34eceff01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.