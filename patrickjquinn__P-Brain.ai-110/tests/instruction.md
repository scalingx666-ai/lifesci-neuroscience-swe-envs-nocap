# Issue

**Title:** Bump tar from 4.4.13 to 4.4.19

## Description

Bumps [tar](https://github.com/npm/node-tar) from 4.4.13 to 4.4.19.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9a6faa0</code></a> 4.4.19</li>
<li><a href=""><code>70ef812</code></a> drop dirCache for symlink on all platforms</li>
<li><a href=""><code>3e35515</code></a> 4.4.18</li>
<li><a href=""><code>52b09e3</code></a> fix: prevent path escape using drive-relative paths</li>
<li><a href=""><code>bb93ba2</code></a> fix: reserve paths properly for unicode, windows</li>
<li><a href=""><code>2f1bca0</code></a> fix: prune dirCache properly for unicode, windows</li>
<li><a href=""><code>9bf70a8</code></a> 4.4.17</li>
<li><a href=""><code>6aafff0</code></a> fix: skip extract if linkpath is stripped entirely</li>
<li><a href=""><code>5c5059a</code></a> fix: reserve paths case-insensitively</li>
<li><a href=""><code>fd6accb</code></a> 4.4.16</li>
<li>Additional commits viewable in <a href="https://github.com/npm/node-tar/compare/v4.4.13...v4.4.19">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tar&package-manager=npm_and_yarn&previous-version=4.4.13&new-version=4.4.19)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

Dependabot will resolve any conflicts with this PR as long as you don't alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.

[//]: # (dependabot-automerge-start)
[//]: # (dependabot-automerge-end)

---

<details>
<summary>Dependabot commands and options</summary>
<br />

You can trigger Dependabot actions by commenting on this PR:
- `@dependabot rebase` will rebase this PR
- `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/patrickjquinn/P-Brain.ai/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c508dc5f3b19`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.