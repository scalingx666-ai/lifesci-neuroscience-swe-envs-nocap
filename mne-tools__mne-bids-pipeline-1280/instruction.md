# Issue

**Title:** [dependabot]: Bump pymdown-extensions from 10.21.3 to 11.0

## Description

Bumps [pymdown-extensions](https://github.com/facelessuser/pymdown-extensions) from 10.21.3 to 11.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/facelessuser/pymdown-extensions/releases">pymdown-extensions's releases</a>.</em></p>
<blockquote>
<h2>11.0</h2>
<ul>
<li><strong>BREAK</strong>: B64: Restricts relative links to <code>base_path</code> by default. Can be disabled by setting new <code>restrict_path</code>
option to <code>False</code>. The new <code>root_path</code> can be specified if paths are desired to be restricted to a different
location separate  <code>base_path</code> which is also used as a relative base for image paths.</li>
<li><strong>NEW</strong>: Drop Python 3.9 support.</li>
<li><strong>FIX</strong>: Tabbed: Fix issue where an empty title would cause an exception.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6d0097b</code></a> Update changelog</li>
<li><a href=""><code>f4808ea</code></a> Bump version and update changelog</li>
<li><a href=""><code>a290074</code></a> Update JS doc deps</li>
<li><a href=""><code>edce355</code></a> Merge commit from fork</li>
<li><a href=""><code>9fb9643</code></a> Update Python type deps</li>
<li><a href=""><code>299a129</code></a> Docs: Update JS deps</li>
<li><a href=""><code>367d965</code></a> Drop Python 3.9 (<a href="">#2902</a>)</li>
<li><a href=""><code>19ec936</code></a> Fix issue with empty titles and Tabbed (<a href="">#2901</a>)</li>
<li><a href=""><code>4868783</code></a> Fix npm option</li>
<li><a href=""><code>18a21f5</code></a> zensical config should be stored in sdist</li>
<li>Additional commits viewable in <a href="https://github.com/facelessuser/pymdown-extensions/compare/10.21.3...11.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pymdown-extensions&package-manager=uv&previous-version=10.21.3&new-version=11.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2aea77540b15`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.