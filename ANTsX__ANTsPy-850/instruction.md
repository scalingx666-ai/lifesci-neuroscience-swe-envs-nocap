# Issue

**Title:** Bump pypa/gh-action-pypi-publish from 1.12.4 to 1.13.0 in /.github/workflows

## Description

Bumps [pypa/gh-action-pypi-publish](https://github.com/pypa/gh-action-pypi-publish) from 1.12.4 to 1.13.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/gh-action-pypi-publish/releases">pypa/gh-action-pypi-publish's releases</a>.</em></p>
<blockquote>
<h2>v1.13.0</h2>
<!-- raw HTML omitted -->
<blockquote>
<p>[!important]
🚨 This release includes fixes for <a href="https://github.com/pypa/gh-action-pypi-publish/security/advisories/GHSA-vxmw-7h4f-hqxh">GHSA-vxmw-7h4f-hqxh</a> discovered by <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a><a href="https://github.com/sponsors/woodruffw">💰</a>.
We've also integrated <a href="http://zizmor.sh">Zizmor</a> to catch similar issues in the future and you should too.</p>
</blockquote>
<h2>✨ New Stuff</h2>
<p><a href="https://github.com/woodruffw"><code>@​woodruffw</code></a><a href="https://github.com/sponsors/woodruffw">💰</a> updated the README to no longer mention the attestations feature being experimental in <a href="">#347</a>: it's been rather stable for a year already 🎉
He also added more diagnostic output which includes printing out the GitHub Environment claim via <a href="">#371</a> and warning about the unsupported reusable workflows configurations <a href="">#306</a>, when using Trusted Publishing.</p>
<blockquote>
<p>[!tip]
The official support for reusable workflows is currently blocked on changes to PyPI. To get updates about progress on the action side, you may want to subscribe to <a href="">#166</a>.
At PyCon US 2025 Sprints, <a href="https://github.com/facutuesca"><code>@​facutuesca</code></a><a href="https://github.com/sponsors/facutuesca">💰</a>, <a href="https://github.com/miketheman"><code>@​miketheman</code></a><a href="https://github.com/sponsors/miketheman">💰</a>, <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a><a href="https://github.com/sponsors/woodruffw">💰</a> and I<a href="https://github.com/sponsors/webknjaz">💰</a> spent several hours IRL brainstorming how to fix this and migrate projects that happen to rely on an obscure corner case with reusable workflows that temporarily allows them to function by accident.
The result of that discussion is posted @ <a href="">pypi/warehouse#11096</a>.
Note that this is a volunteer-led effort and there is no ETA. If you need this soon, make your employer sponsor the PSF and maybe they'll be able to hire somebody for this work on Warehouse.</p>
</blockquote>
<p>In addition to that, <a href="https://github.com/konstin"><code>@​konstin</code></a><a href="https://github.com/sponsors/konstin">💰</a> sent <a href="">#378</a> to pin <code>actions/setup-python</code> to a SHA hash. This makes <code>pypi-publish</code> compatible with new GitHub policies that allow organizations to mandate hash-pinning actions used in workflows.</p>
<h2>🛠️ Internal Dependencies</h2>
<p><a href="https://github.com/webknjaz"><code>@​webknjaz</code></a><a href="https://github.com/sponsors/webknjaz">💰</a> made a bunch of updates to the action runtime which includes bumping it to Python 3.13 in <a href="">#331</a> and updating the dependency tree across the board. <code>pip-with-requires-python</code> is no longer being installed (<a href="">#332</a>). Some related bumps were contributed by <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a><a href="https://github.com/sponsors/woodruffw">💰</a> (<a href="">#359</a>) and <a href="https://github.com/kurtmckee"><code>@​kurtmckee</code></a><a href="https://github.com/sponsors/kurtmckee">💰</a> sent a contributor-facing PR, bumping the linting configuration via <a href="">#335</a>.</p>
<h2>💪 New Contributors</h2>
<ul>
<li><a href="https://github.com/kurtmckee"><code>@​kurtmckee</code></a> made their first contribution in <a href="">#335</a></li>
<li><a href="https://github.com/konstin"><code>@​konstin</code></a> made their first contribution in <a href="">#378</a></li>
</ul>
<p><strong>🪞 Full Diff</strong>: <a href="https://github.com/pypa/gh-action-pypi-publish/compare/v1.12.4...v1.13.0">https://github.com/pypa/gh-action-pypi-publish/compare/v1.12.4...v1.13.0</a></p>
<p><strong>🧔‍♂️ Release Manager:</strong> <a href="https://github.com/sponsors/webknjaz"><code>@​webknjaz</code></a> <a href="https://stand-with-ukraine.pp.ua">🇺🇦</a></p>
<p><strong>💬 Discuss</strong> <a href="https://bsky.app/profile/webknjaz.me/post/3lxxzvzhvfc2e">on Bluesky 🦋</a>, <a href="https://mastodon.social/@webknjaz/115143522527224444">on Mastodon 🐘</a> and <a href="https://github.com/pypa/gh-action-pypi-publish/discussions/379">on GitHub</a>.</p>
<p><a href="https://github.com/sponsors/webknjaz"><img src="https://img.shields.io/badge/%40webknjaz-transparent?logo=githubsponsors&amp;logoColor=%23EA4AAA&amp;label=Sponsor&amp;color=2a313c" alt="GH Sponsors badge" /></a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ed0c539</code></a> 📦📌 Bump the pinned dependency tree</li>
<li><a href=""><code>77db1b7</code></a> Merge branch PR <a href="">#306</a>, GHSA-vxmw-7h4f-hqxh fix and PR <a href="">#378</a> into unstable/v1</li>
<li><a href=""><code>280b3a1</code></a> Alias <code>typing as t</code> in imports</li>
<li><a href=""><code>e380240</code></a> Use <code>object</code> in place of <code>typing.Any</code> in annotations</li>
<li><a href=""><code>e50bff6</code></a> Deduplicate claim ref lookup</li>
<li><a href=""><code>decbc9a</code></a> Hint people to subscribe to <a href="">#166</a> for notifications</li>
<li><a href=""><code>8208ad3</code></a> Ask not to report bugs with reusable workflow</li>
<li><a href=""><code>ff0fef5</code></a> 🧪 Scope WPS202 suppression to specific files</li>
<li><a href=""><code>1293b8c</code></a> Use yamllint disable line length lint</li>
<li><a href=""><code>ed01280</code></a> Linter (different rule)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/gh-action-pypi-publish/compare/v1.12.4...v1.13.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/gh-action-pypi-publish&package-manager=github_actions&previous-version=1.12.4&new-version=1.13.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/ANTsX/ANTsPy/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ec36318de96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.