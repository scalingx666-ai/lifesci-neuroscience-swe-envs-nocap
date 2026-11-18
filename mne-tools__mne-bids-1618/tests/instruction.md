# Issue

**Title:** [dependabot]: Bump the actions group with 2 updates

## Description

Bumps the actions group with 2 updates: [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) and [codecov/codecov-action](https://github.com/codecov/codecov-action).

Updates `astral-sh/setup-uv` from 8.1.0 to 8.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v8.2.0 🌈 New inputs <code>quiet</code> and <code>download-from-astral-mirror</code></h2>
<h2>Changes</h2>
<p>This release brings two new inputs and a few bug fixes.</p>
<h3>New inputs</h3>
<p>Lets talk about the new inputs first.</p>
<h4>quiet</h4>
<p>Pretty simple. It turns of all <code>info</code> loggings. Useful if you use this in a composite action and are not interested in all the details.
In the upcoming releases we will add log groups to fully implement support for &quot;less noise&quot;</p>
<blockquote>
<p>[!NOTE]<br />
Warnings and errors are always logged.</p>
</blockquote>
<h4>download-from-astral-mirror</h4>
<p>In some cases you may want to directly use the fallback of checking for available versions and downloading releases from GitHub instead of using the astral.sh mirror. Setting <code>download-from-astral-mirror: false</code> allows you to do that.</p>
<h3>Bugfixes</h3>
<p>When using the astral.sh mirror to query available versions and download releases (done by default) we now stop sending the GitHub token in the header. The mirror never looked at it but we shouldn't be handing out that data even if it is just a short lived token.
All other bugfixes try to limit the impact of failed GitHub queries due to retries and other faults.</p>
<p>We couldn't pinpoint all rootcauses yet but added more logging for error cases to track them down.</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>fix: report unexpected cache save failures <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#896</a>)</li>
<li>fix: report unexpected setup failures <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#895</a>)</li>
<li>fix: add timeout to fetch to prevent silent hangs <a href="https://github.com/eifinger-bot"><code>@​eifinger-bot</code></a> (<a href="">#883</a>)</li>
<li>Limit GitHub tokens to github.com download URLs <a href="https://github.com/zsol"><code>@​zsol</code></a> (<a href="">#878</a>)</li>
<li>increase libuv-workaround timeout to 100ms <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#880</a>)</li>
</ul>
<h2>🚀 Enhancements</h2>
<ul>
<li>Add quiet input to suppress info-level log output <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#898</a>)</li>
<li>feat: add <code>download-from-astral-mirror</code> input <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#897</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>docs: update dependabot rollup biome guidance <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#902</a>)</li>
<li>chore: update known checksums for 0.11.18 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#899</a>)</li>
<li>chore: update known checksums for 0.11.17 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#892</a>)</li>
<li>chore: update known checksums for 0.11.16 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#889</a>)</li>
<li>chore: update known checksums for 0.11.15 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#885</a>)</li>
<li>chore: update known checksums for 0.11.14 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#879</a>)</li>
<li>chore: update known checksums for 0.11.13 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#877</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>fac544c</code></a> chore(deps): roll up dependabot updates (<a href="">#903</a>)</li>
<li><a href=""><code>7390f77</code></a> docs: update dependabot rollup biome guidance (<a href="">#902</a>)</li>
<li><a href=""><code>363c64a</code></a> chore(deps): roll up dependabot updates (<a href="">#901</a>)</li>
<li><a href=""><code>c4fcbaf</code></a> chore(deps): bump release-drafter/release-drafter from 7.3.0 to 7.3.1 (<a href="">#900</a>)</li>
<li><a href=""><code>8e642c5</code></a> chore: update known checksums for 0.11.18 (<a href="">#899</a>)</li>
<li><a href=""><code>a92cb43</code></a> Add quiet input to suppress info-level log output (<a href="">#898</a>)</li>
<li><a href=""><code>e07f2ac</code></a> chore(deps): bump eifinger/actionlint-action from 1.10.1 to 1.10.2 (<a href="">#842</a>)</li>
<li><a href=""><code>bc4034e</code></a> chore(deps): bump github/codeql-action from 4.35.4 to 4.36.0 (<a href="">#893</a>)</li>
<li><a href=""><code>df42d4f</code></a> chore(deps): bump zizmorcore/zizmor-action from 0.5.5 to 0.5.6 (<a href="">#891</a>)</li>
<li><a href=""><code>b9c8c4c</code></a> feat: add <code>download-from-astral-mirror</code> input (<a href="">#897</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/v8.1.0...v8.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `codecov/codecov-action` from 6 to 7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/codecov/codecov-action/releases">codecov/codecov-action's releases</a>.</em></p>
<blockquote>
<h2>v7.0.0</h2>
<p>⚠️ Due to migration issues with keybase, we are unable to update our keys under the <code>codecovsecurity</code> account. We have deleted the account and are using <code>codecovsecops</code> with the original gpg key</p>
<h2>What's Changed</h2>
<ul>
<li>ci: remove Enforce License Compliance workflow by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1950</a></li>
<li>chore(release): 7.0.0 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1957</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v6.0.1...v7.0.0">https://github.com/codecov/codecov-action/compare/v6.0.1...v7.0.0</a></p>
<h2>v6.0.2</h2>
<p>This is a copy of the <code>v7.0.0</code> release to make updates easier</p>
<h2>What's Changed</h2>
<ul>
<li>ci: remove Enforce License Compliance workflow by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1950</a></li>
<li>chore(release): 7.0.0 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1957</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v6.0.1...v6.0.2">https://github.com/codecov/codecov-action/compare/v6.0.1...v6.0.2</a></p>
<h2>v6.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>fix: prevent template injection in run: steps (VULN-1652) by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1947</a></li>
<li>chore(release): 6.0.1 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1949</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v6.0.0...v6.0.1">https://github.com/codecov/codecov-action/compare/v6.0.0...v6.0.1</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/codecov/codecov-action/blob/main/CHANGELOG.md">codecov/codecov-action's changelog</a>.</em></p>
<blockquote>
<h2>v5.5.2</h2>
<h3>What's Changed</h3>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v5.5.1..v5.5.2">https://github.com/codecov/codecov-action/compare/v5.5.1..v5.5.2</a></p>
<h2>v5.5.1</h2>
<h3>What's Changed</h3>
<ul>
<li>fix: overwrite pr number on fork by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1871</a></li>
<li>build(deps): bump actions/checkout from 4.2.2 to 5.0.0 by <code>@​app/dependabot</code> in <a href="">codecov/codecov-action#1868</a></li>
<li>build(deps): bump github/codeql-action from 3.29.9 to 3.29.11 by <code>@​app/dependabot</code> in <a href="">codecov/codecov-action#1867</a></li>
<li>fix: update to use local app/ dir by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1872</a></li>
<li>docs: fix typo in README by <a href="https://github.com/datalater"><code>@​datalater</code></a> in <a href="">codecov/codecov-action#1866</a></li>
<li>Document a <code>codecov-cli</code> version reference example by <a href="https://github.com/webknjaz"><code>@​webknjaz</code></a> in <a href="">codecov/codecov-action#1774</a></li>
<li>build(deps): bump github/codeql-action from 3.28.18 to 3.29.9 by <code>@​app/dependabot</code> in <a href="">codecov/codecov-action#1861</a></li>
<li>build(deps): bump ossf/scorecard-action from 2.4.1 to 2.4.2 by <code>@​app/dependabot</code> in <a href="">codecov/codecov-action#1833</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v5.5.0..v5.5.1">https://github.com/codecov/codecov-action/compare/v5.5.0..v5.5.1</a></p>
<h2>v5.5.0</h2>
<h3>What's Changed</h3>
<ul>
<li>feat: upgrade wrapper to 0.2.4 by <a href="https://github.com/jviall"><code>@​jviall</code></a> in <a href="">codecov/codecov-action#1864</a></li>
<li>Pin actions/github-script by Git SHA by <a href="https://github.com/martincostello"><code>@​martincostello</code></a> in <a href="">codecov/codecov-action#1859</a></li>
<li>fix: check reqs exist by <a href="https://github.com/joseph-sentry"><code>@​joseph-sentry</code></a> in <a href="">codecov/codecov-action#1835</a></li>
<li>fix: Typo in README by <a href="https://github.com/spalmurray"><code>@​spalmurray</code></a> in <a href="">codecov/codecov-action#1838</a></li>
<li>docs: Refine OIDC docs by <a href="https://github.com/spalmurray"><code>@​spalmurray</code></a> in <a href="">codecov/codecov-action#1837</a></li>
<li>build(deps): bump github/codeql-action from 3.28.17 to 3.28.18 by <code>@​app/dependabot</code> in <a href="">codecov/codecov-action#1829</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v5.4.3..v5.5.0">https://github.com/codecov/codecov-action/compare/v5.4.3..v5.5.0</a></p>
<h2>v5.4.3</h2>
<h3>What's Changed</h3>
<ul>
<li>build(deps): bump github/codeql-action from 3.28.13 to 3.28.17 by <code>@​app/dependabot</code> in <a href="">codecov/codecov-action#1822</a></li>
<li>fix: OIDC on forks by <a href="https://github.com/joseph-sentry"><code>@​joseph-sentry</code></a> in <a href="">codecov/codecov-action#1823</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v5.4.2..v5.4.3">https://github.com/codecov/codecov-action/compare/v5.4.2..v5.4.3</a></p>
<h2>v5.4.2</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/codecov/codecov-action/compare/v6...v7">compare view</a></li>
</ul>
</details>
<br />

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
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92671d64f5f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.