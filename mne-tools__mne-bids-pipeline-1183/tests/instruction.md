# Issue

**Title:** [dependabot]: Bump pillow from 12.1.0 to 12.1.1

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 12.1.0 to 12.1.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>12.1.1</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/12.1.1.html">https://pillow.readthedocs.io/en/stable/releasenotes/12.1.1.html</a></p>
<h2>Dependencies</h2>
<ul>
<li>Patch libavif for svt-av1 4.0 compatibility <a href="">#9413</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
</ul>
<h2>Other changes</h2>
<ul>
<li>Fix OOB Write with invalid tile extents <a href="">#9427</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5158d98</code></a> 12.1.1 version bump</li>
<li><a href=""><code>9000313</code></a> Fix OOB Write with invalid tile extents (<a href="">#9427</a>)</li>
<li><a href=""><code>cd01118</code></a> Patch libavif for svt-av1 4.0 compatibility</li>
<li>See full diff in <a href="https://github.com/python-pillow/Pillow/compare/12.1.0...12.1.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pillow&package-manager=uv&previous-version=12.1.0&new-version=12.1.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/mne-tools/mne-bids-pipeline/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f848f072bd3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.