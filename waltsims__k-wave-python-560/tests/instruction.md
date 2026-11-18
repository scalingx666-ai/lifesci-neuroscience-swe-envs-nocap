# Issue

**Title:** Bump h5py from 3.12.1 to 3.13.0

## Description

Bumps [h5py](https://github.com/h5py/h5py) from 3.12.1 to 3.13.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c96b93d</code></a> Merge pull request <a href="">#2559</a> from h5py/changelog-3.13</li>
<li><a href=""><code>04daabc</code></a> Add docstring for SpaceId.select_shape_same</li>
<li><a href=""><code>0588148</code></a> Full import path to low-level method</li>
<li><a href=""><code>584b591</code></a> Add release notes for 3.13</li>
<li><a href=""><code>a04f03c</code></a> Version number -&gt; 3.13</li>
<li><a href=""><code>f416f89</code></a> Merge pull request <a href="">#2517</a> from takluyver/in-memory</li>
<li><a href=""><code>7bc2c19</code></a> Use a different make_fapl() parameter to test File.in_memory()</li>
<li><a href=""><code>3a7bd67</code></a> Add news entry for File.in_memory()</li>
<li><a href=""><code>261f609</code></a> Fix passing make_fcpl() keyword arguments from File.in_memory()</li>
<li><a href=""><code>c8a141b</code></a> Fix default block size in docs</li>
<li>Additional commits viewable in <a href="https://github.com/h5py/h5py/compare/3.12.1...3.13.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=h5py&package-manager=pip&previous-version=3.12.1&new-version=3.13.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7f4e2172a7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.