# Issue

**Title:** Use the gh CLI and PyPI trusted publishing for releases

## Description

## Motivation

The `Deploy pre-release from dev` job [failed](https://github.com/NeurodataWithoutBorders/pynwb/actions/runs/29794565105/job/88525067854) with `404 Client Error` from the GitHub API.

`scikit-ci-addons` (last released 2019) drives `githubrelease` (last released 2022), which resolves a tag to the **first** release with a matching `tag_name` and moves the rolling `latest` tag through a non-atomic rename dance. That had left two draft releases tagged `latest`: the run uploaded assets to one, then tried to edit the other and 404'd. Since the failing call was the first half of a `draft=True` → `draft=False` bounce, the public `latest` pre-release page was left empty and `refs/tags/latest` deleted, plus a stray `refs/tags/latest-tmp-tmp`. The duplicate release and stray tag have been deleted manually; this PR keeps them from coming back.

## What changed

Release paths only. Mirrors hdmf-dev/hdmf#1517 and the release parts of hdmf-dev/hdmf#1518.

**`run_tests.yml` (`deploy-dev`)** — `ci_addons publish_github_release` → `gh release`. The `latest` release and tag are deleted and recreated on each dev push, so the tag, target commit, and artifacts always agree; duplicates cannot accumulate. Authenticates with `GITHUB_TOKEN` (`contents: write`) instead of `BOT_GITHUB_TOKEN`. Dropped the checkout and `setup-python` steps (nothing reads the tree or runs Python) and the obsolete `latest-tmp` from `tags-ignore`.

**`deploy_release.yml`** — `twine` with a long-lived password on the command line → `pypa/gh-action-pypi-publish` with OIDC trusted publishing. `githubrelease` → `gh release`, idempotent on re-run, with notes taken from the version's `CHANGELOG.md` section (falling back to `--generate-notes`). Added a source-distribution install test, which was missing. `persist-credentials: false` on checkout.

Not included from hdmf-dev/hdmf#1518: SHA pinning, composite action, zizmor, dependabot, repo-wide `permissions`.

**Docs** — `make_a_release.rst` and the release PR template drop the now-automatic "copy the release notes" step and the "nwb-bot account" note. `software_process.rst` credited **CircleCI** with building and uploading the distributions; there is no CircleCI config in this repo (pre-existing staleness, fixed while auditing the release docs).

## ⚠️ Required before the next tagged release

Trusted publishing needs one-time setup that cannot be done from the repo:

- PyPI → `pynwb` → Settings → Publishing → add a GitHub publisher: owner `NeurodataWithoutBorders`, repo `pynwb`, workflow `deploy_release.yml`, environment `pypi`.
- Create a `pypi` repository environment (Settings → Environments).

Afterwards `BOT_PYPI_USER` / `BOT_PYPI_PASSWORD` can be removed. `BOT_GITHUB_TOKEN` is no longer used by either release path.

## Notes

- Releases will be authored by `github-actions[bot]` rather than the bot PAT account. Nothing triggers on `release:` events, and `GITHUB_TOKEN`-created tags do not start workflow runs.
- The first `dev` push after merge deletes the leftover draft release and publishes a clean `latest` with a real tag, restoring the public pre-release page.

## How to test the behavior?

```
Cannot be fully exercised without a dev push / tag push plus the PyPI trusted publisher.

Verified locally:
- all workflows parse as YAML; both release shell blocks pass `bash -n`
- both tox install steps run against real artifacts: `tox -e build` then wheelinstall
  from the wheel and from the .tar.gz (the sdist run rebuilds via hatchling, confirming
  --recreate makes it a real install rather than a no-op)
- the awk notes extraction against the real CHANGELOG.md: 4.0.0 -> 46 lines, 3.1.3 -> 15
  (prefix matching handles the date suffix in the heading), 9.9.9 -> --generate-notes
- every gh flag used confirmed present in the gh CLI
- sphinx `-W` linkcheck and the Read the Docs build pass on the docs changes
```

## Checklist

- [x] Did you update `CHANGELOG.md` with your changes?
- [x] Does the PR clearly describe the problem and the solution?
- [x] Have you reviewed our Contributing Guide?
- [ ] Does the PR use "Fix #XXX" notation? (no associated issue)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `893d5759f74a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.