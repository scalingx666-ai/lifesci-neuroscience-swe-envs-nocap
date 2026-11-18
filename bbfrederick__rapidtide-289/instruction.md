# Issue

**Title:** Bump codacy/git-version from 2.8.7 to 2.8.8

## Description

Bumps [codacy/git-version](https://github.com/codacy/git-version) from 2.8.7 to 2.8.8.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>376c75f</code></a> Merge pull request <a href="">#117</a> from codacy/fix/shorten-branch-name-cap</li>
<li><a href=""><code>5599ce2</code></a> test: update expected branch-name truncation length to 15 chars</li>
<li><a href=""><code>78c21ee</code></a> fix: shorten sanitized branch-name cap from 30 to 15 chars</li>
<li>See full diff in <a href="https://github.com/codacy/git-version/compare/2.8.7...2.8.8">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=codacy/git-version&package-manager=github_actions&previous-version=2.8.7&new-version=2.8.8)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2dacb24c16a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.