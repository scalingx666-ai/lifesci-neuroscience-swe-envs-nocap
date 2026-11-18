# Issue

**Title:** Bump opencv-python from 4.10.0.84 to 4.11.0.86

## Description

Bumps [opencv-python](https://github.com/opencv/opencv-python) from 4.10.0.84 to 4.11.0.86.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/opencv/opencv-python/releases">opencv-python's releases</a>.</em></p>
<blockquote>
<h2>4.11.0.86</h2>
<p>Complete OpenCV 4.11.0 changelog: <a href="https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4110">https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4110</a></p>
<p>Python:</p>
<ul>
<li>Added Python 3.13 support</li>
<li>Fixed build with Python 3.12</li>
<li>Fixed confg path for the case when Python Limited API is disabled</li>
<li>Fixed build with system wide CMake, if CMake is not available with pip</li>
<li>Enabled all jpeg-turbo optimizations on Windows (assembler)</li>
<li>Split Python type stubs per-module to allow modules list customization</li>
<li>Minimal Mac OS raised to 13.0.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/opencv/opencv-python/commits">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=opencv-python&package-manager=pip&previous-version=4.10.0.84&new-version=4.11.0.86)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3fa9d5f1e56`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.