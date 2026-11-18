# Issue

**Title:** [MAINT] Bump the actions group across 1 directory with 2 updates

## Description

Bumps the actions group with 2 updates in the / directory: [actions/checkout](https://github.com/actions/checkout) and [codecov/codecov-action](https://github.com/codecov/codecov-action).

Updates `actions/checkout` from 5 to 6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/releases">actions/checkout's releases</a>.</em></p>
<blockquote>
<h2>v6.0.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Update README to include Node.js 24 support details and requirements by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/checkout#2248</a></li>
<li>Persist creds to a separate file by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2286</a></li>
<li>v6-beta by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2298</a></li>
<li>update readme/changelog for v6 by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2311</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v5.0.0...v6.0.0">https://github.com/actions/checkout/compare/v5.0.0...v6.0.0</a></p>
<h2>v6-beta</h2>
<h2>What's Changed</h2>
<p>Updated persist-credentials to store the credentials under <code>$RUNNER_TEMP</code> instead of directly in the local git config.</p>
<p>This requires a minimum Actions Runner version of <a href="https://github.com/actions/runner/releases/tag/v2.329.0">v2.329.0</a> to access the persisted credentials for <a href="https://docs.github.com/en/actions/tutorials/use-containerized-services/create-a-docker-container-action">Docker container action</a> scenarios.</p>
<h2>v5.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Port v6 cleanup to v5 by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2301</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v5...v5.0.1">https://github.com/actions/checkout/compare/v5...v5.0.1</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/blob/main/CHANGELOG.md">actions/checkout's changelog</a>.</em></p>
<blockquote>
<h1>Changelog</h1>
<h2>v6.0.2</h2>
<ul>
<li>Fix tag handling: preserve annotations and explicit fetch-tags by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2356</a></li>
</ul>
<h2>v6.0.1</h2>
<ul>
<li>Add worktree support for persist-credentials includeIf by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2327</a></li>
</ul>
<h2>v6.0.0</h2>
<ul>
<li>Persist creds to a separate file by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2286</a></li>
<li>Update README to include Node.js 24 support details and requirements by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/checkout#2248</a></li>
</ul>
<h2>v5.0.1</h2>
<ul>
<li>Port v6 cleanup to v5 by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2301</a></li>
</ul>
<h2>v5.0.0</h2>
<ul>
<li>Update actions checkout to use node 24 by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/checkout#2226</a></li>
</ul>
<h2>v4.3.1</h2>
<ul>
<li>Port v6 cleanup to v4 by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2305</a></li>
</ul>
<h2>v4.3.0</h2>
<ul>
<li>docs: update README.md by <a href="https://github.com/motss"><code>@​motss</code></a> in <a href="">actions/checkout#1971</a></li>
<li>Add internal repos for checking out multiple repositories by <a href="https://github.com/mouismail"><code>@​mouismail</code></a> in <a href="">actions/checkout#1977</a></li>
<li>Documentation update - add recommended permissions to Readme by <a href="https://github.com/benwells"><code>@​benwells</code></a> in <a href="">actions/checkout#2043</a></li>
<li>Adjust positioning of user email note and permissions heading by <a href="https://github.com/joshmgross"><code>@​joshmgross</code></a> in <a href="">actions/checkout#2044</a></li>
<li>Update README.md by <a href="https://github.com/nebuk89"><code>@​nebuk89</code></a> in <a href="">actions/checkout#2194</a></li>
<li>Update CODEOWNERS for actions by <a href="https://github.com/TingluoHuang"><code>@​TingluoHuang</code></a> in <a href="">actions/checkout#2224</a></li>
<li>Update package dependencies by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/checkout#2236</a></li>
</ul>
<h2>v4.2.2</h2>
<ul>
<li><code>url-helper.ts</code> now leverages well-known environment variables by <a href="https://github.com/jww3"><code>@​jww3</code></a> in <a href="">actions/checkout#1941</a></li>
<li>Expand unit test coverage for <code>isGhes</code> by <a href="https://github.com/jww3"><code>@​jww3</code></a> in <a href="">actions/checkout#1946</a></li>
</ul>
<h2>v4.2.1</h2>
<ul>
<li>Check out other refs/* by commit if provided, fall back to ref by <a href="https://github.com/orhantoy"><code>@​orhantoy</code></a> in <a href="">actions/checkout#1924</a></li>
</ul>
<h2>v4.2.0</h2>
<ul>
<li>Add Ref and Commit outputs by <a href="https://github.com/lucacome"><code>@​lucacome</code></a> in <a href="">actions/checkout#1180</a></li>
<li>Dependency updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>- <a href="">actions/checkout#1777</a>, <a href="">actions/checkout#1872</a></li>
</ul>
<h2>v4.1.7</h2>
<ul>
<li>Bump the minor-npm-dependencies group across 1 directory with 4 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1739</a></li>
<li>Bump actions/checkout from 3 to 4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1697</a></li>
<li>Check out other refs/* by commit by <a href="https://github.com/orhantoy"><code>@​orhantoy</code></a> in <a href="">actions/checkout#1774</a></li>
<li>Pin actions/checkout's own workflows to a known, good, stable version. by <a href="https://github.com/jww3"><code>@​jww3</code></a> in <a href="">actions/checkout#1776</a></li>
</ul>
<h2>v4.1.6</h2>
<ul>
<li>Check platform to set archive extension appropriately by <a href="https://github.com/cory-miller"><code>@​cory-miller</code></a> in <a href="">actions/checkout#1732</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>de0fac2</code></a> Fix tag handling: preserve annotations and explicit fetch-tags (<a href="">#2356</a>)</li>
<li><a href=""><code>064fe7f</code></a> Add orchestration_id to git user-agent when ACTIONS_ORCHESTRATION_ID is set (...</li>
<li><a href=""><code>8e8c483</code></a> Clarify v6 README (<a href="">#2328</a>)</li>
<li><a href=""><code>033fa0d</code></a> Add worktree support for persist-credentials includeIf (<a href="">#2327</a>)</li>
<li><a href=""><code>c2d88d3</code></a> Update all references from v5 and v4 to v6 (<a href="">#2314</a>)</li>
<li><a href=""><code>1af3b93</code></a> update readme/changelog for v6 (<a href="">#2311</a>)</li>
<li><a href=""><code>71cf226</code></a> v6-beta (<a href="">#2298</a>)</li>
<li><a href=""><code>069c695</code></a> Persist creds to a separate file (<a href="">#2286</a>)</li>
<li><a href=""><code>ff7abcd</code></a> Update README to include Node.js 24 support details and requirements (<a href="">#2248</a>)</li>
<li>See full diff in <a href="https://github.com/actions/checkout/compare/v5...v6">compare view</a></li>
</ul>
</details>
<br />

Updates `codecov/codecov-action` from 5 to 6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/codecov/codecov-action/releases">codecov/codecov-action's releases</a>.</em></p>
<blockquote>
<h2>v6.0.0</h2>
<h2>⚠️ This version introduces support for node24 which make cause breaking changes for systems that do not currently support node24. ⚠️</h2>
<h2>What's Changed</h2>
<ul>
<li>Revert &quot;Revert &quot;build(deps): bump actions/github-script from 7.0.1 to 8.0.0&quot;&quot; by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1929</a></li>
<li>Th/6.0.0 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1928</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v5.5.4...v6.0.0">https://github.com/codecov/codecov-action/compare/v5.5.4...v6.0.0</a></p>
<h2>v5.5.4</h2>
<p>This is a mirror of <code>v5.5.2</code>. <code>v6</code> will be released which requires <code>node24</code></p>
<h2>What's Changed</h2>
<ul>
<li>Revert &quot;build(deps): bump actions/github-script from 7.0.1 to 8.0.0&quot; by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1926</a></li>
<li>chore(release): 5.5.4 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1927</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v5.5.3...v5.5.4">https://github.com/codecov/codecov-action/compare/v5.5.3...v5.5.4</a></p>
<h2>v5.5.3</h2>
<h2>What's Changed</h2>
<ul>
<li>build(deps): bump actions/github-script from 7.0.1 to 8.0.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">codecov/codecov-action#1874</a></li>
<li>chore(release): bump to 5.5.3 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1922</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v5.5.2...v5.5.3">https://github.com/codecov/codecov-action/compare/v5.5.2...v5.5.3</a></p>
<h2>v5.5.2</h2>
<h2>What's Changed</h2>
<ul>
<li>check gpg only when skip-validation = false by <a href="https://github.com/maxweng-sentry"><code>@​maxweng-sentry</code></a> in <a href="">codecov/codecov-action#1894</a></li>
<li>chore: <code>disable_search</code> alignment by <a href="https://github.com/freemanzMrojo"><code>@​freemanzMrojo</code></a> in <a href="">codecov/codecov-action#1881</a></li>
<li>chore(release): 5.5.2 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1902</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/maxweng-sentry"><code>@​maxweng-sentry</code></a> made their first contribution in <a href="">codecov/codecov-action#1894</a></li>
<li><a href="https://github.com/freemanzMrojo"><code>@​freemanzMrojo</code></a> made their first contribution in <a href="">codecov/codecov-action#1881</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v5.5.1...v5.5.2">https://github.com/codecov/codecov-action/compare/v5.5.1...v5.5.2</a></p>
<h2>v5.5.1</h2>
<h2>What's Changed</h2>
<ul>
<li>build(deps): bump ossf/scorecard-action from 2.4.1 to 2.4.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">codecov/codecov-action#1833</a></li>
<li>build(deps): bump github/codeql-action from 3.28.18 to 3.29.9 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">codecov/codecov-action#1861</a></li>
<li>Document a <code>codecov-cli</code> version reference example by <a href="https://github.com/webknjaz"><code>@​webknjaz</code></a> in <a href="">codecov/codecov-action#1774</a></li>
<li>docs: fix typo in README by <a href="https://github.com/datalater"><code>@​datalater</code></a> in <a href="">codecov/codecov-action#1866</a></li>
<li>fix: update to use local app/ dir by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1872</a></li>
<li>build(deps): bump github/codeql-action from 3.29.9 to 3.29.11 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">codecov/codecov-action#1867</a></li>
<li>build(deps): bump actions/checkout from 4.2.2 to 5.0.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">codecov/codecov-action#1868</a></li>
<li>fix: overwrite pr number on fork by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1871</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
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
<li><a href=""><code>57e3a13</code></a> Th/6.0.0 (<a href="">#1928</a>)</li>
<li><a href=""><code>f67d33d</code></a> Revert &quot;Revert &quot;build(deps): bump actions/github-script from 7.0.1 to 8.0.0&quot;&quot;...</li>
<li>See full diff in <a href="https://github.com/codecov/codecov-action/compare/v5...v6">compare view</a></li>
</ul>
</details>
<br />

You can trigger a rebase of this PR by commenting `@dependabot rebase`.

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

> **Note**
> Automatic rebases have been disabled on this pull request as it has been open for over 30 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f507e6e63d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.