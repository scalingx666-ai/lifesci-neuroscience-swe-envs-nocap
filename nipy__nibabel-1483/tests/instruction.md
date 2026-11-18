# Issue

**Title:** chore(deps): bump pydicom from 3.0.1 to 3.0.2

## Description

Bumps [pydicom](https://github.com/pydicom/pydicom) from 3.0.1 to 3.0.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pydicom/pydicom/releases">pydicom's releases</a>.</em></p>
<blockquote>
<h2>Pydicom v3.0.2</h2>
<p>Patch release for security advisory CVE-2026-32711.  A crafted DICOMDIR could create a path traversal by setting <code>ReferencedFileID</code> to a path outside the File-set root.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>20aa4b7</code></a> Prep3.0.2 (<a href="">#2312</a>)</li>
<li><a href=""><code>6414f01</code></a> Merge from fork - security fix in <code>FileSet</code>s</li>
<li>See full diff in <a href="https://github.com/pydicom/pydicom/compare/v3.0.1...v3.0.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pydicom&package-manager=uv&previous-version=3.0.1&new-version=3.0.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/nipy/nibabel/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3663c6353293`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.