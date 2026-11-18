# Issue

**Title:** chore(deps): bump the actions group with 6 updates

## Description

Bumps the actions group with 6 updates:

| Package | From | To |
| --- | --- | --- |
| [actions/checkout](https://github.com/actions/checkout) | `4.4.0` | `7.0.1` |
| [actions/setup-python](https://github.com/actions/setup-python) | `5.6.0` | `7.0.0` |
| [codecov/codecov-action](https://github.com/codecov/codecov-action) | `5.5.5` | `7.1.1` |
| [actions/upload-artifact](https://github.com/actions/upload-artifact) | `4.6.2` | `7.0.1` |
| [actions/download-artifact](https://github.com/actions/download-artifact) | `4.3.0` | `8.0.1` |
| [actions/attest-build-provenance](https://github.com/actions/attest-build-provenance) | `2.4.0` | `4.2.2` |

Updates `actions/checkout` from 4.4.0 to 7.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/releases">actions/checkout's releases</a>.</em></p>
<blockquote>
<h2>v7.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>skip running unsafe pr check if input is default by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2518</a></li>
<li>trim only ascii whitespace for branch by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2521</a></li>
<li>escape values passed to --unset by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2530</a></li>
<li>Various dependency updates</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v7...v7.0.1">https://github.com/actions/checkout/compare/v7...v7.0.1</a></p>
<h2>v7.0.0</h2>
<h2>What's Changed</h2>
<ul>
<li>block checking out fork pr for pull_request_target and workflow_run by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2454</a></li>
<li>Bump actions/publish-immutable-action from 0.0.3 to 0.0.4 in the minor-actions-dependencies group across 1 directory by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/checkout#2458</a></li>
<li>Bump flatted from 3.3.1 to 3.4.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/checkout#2460</a></li>
<li>Bump js-yaml from 4.1.0 to 4.2.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/checkout#2461</a></li>
<li>Bump <code>@​actions/core</code> and <code>@​actions/tool-cache</code> and Remove uuid by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/checkout#2459</a></li>
<li>upgrade module to esm and update dependencies by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2463</a></li>
<li>Bump the minor-npm-dependencies group across 1 directory with 3 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/checkout#2462</a></li>
<li>getting ready for checkout v7 release by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2464</a></li>
<li>update error wording by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2467</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> made their first contribution in <a href="">actions/checkout#2454</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v6.0.3...v7.0.0">https://github.com/actions/checkout/compare/v6.0.3...v7.0.0</a></p>
<h2>v6.1.0</h2>
<h2>What's Changed</h2>
<ul>
<li><strong>[BREAKING]</strong> backport <code>allow-unsafe-pr-checkout</code> to v6 by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2500</a></li>
<li>backport fixes to releases-v6 by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2527</a></li>
</ul>
<p><a href="https://github.blog/changelog/2026-06-18-safer-pull_request_target-defaults-for-github-actions-checkout/">https://github.blog/changelog/2026-06-18-safer-pull_request_target-defaults-for-github-actions-checkout/</a> for more details about this breaking change</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v6.0.3...v6.1.0">https://github.com/actions/checkout/compare/v6.0.3...v6.1.0</a></p>
<h2>v6.0.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Update changelog by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2357</a></li>
<li>fix: expand merge commit SHA regex and add SHA-256 test cases by <a href="https://github.com/yaananth"><code>@​yaananth</code></a> in <a href="">actions/checkout#2414</a></li>
<li>Fix checkout init for SHA-256 repositories by <a href="https://github.com/yaananth"><code>@​yaananth</code></a> in <a href="">actions/checkout#2439</a></li>
<li>Update changelog for v6.0.3 by <a href="https://github.com/yaananth"><code>@​yaananth</code></a> in <a href="">actions/checkout#2446</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/yaananth"><code>@​yaananth</code></a> made their first contribution in <a href="">actions/checkout#2414</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v6...v6.0.3">https://github.com/actions/checkout/compare/v6...v6.0.3</a></p>
<h2>v6.0.2</h2>
<h2>What's Changed</h2>
<ul>
<li>Add orchestration_id to git user-agent when ACTIONS_ORCHESTRATION_ID is set by <a href="https://github.com/TingluoHuang"><code>@​TingluoHuang</code></a> in <a href="">actions/checkout#2355</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/blob/main/CHANGELOG.md">actions/checkout's changelog</a>.</em></p>
<blockquote>
<h1>Changelog</h1>
<h2>v7.0.1</h2>
<ul>
<li>Skip running unsafe pr check if input is default by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2518</a></li>
<li>Trim only ascii whitespace for branch by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2521</a></li>
<li>Escape values passed to --unset by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2530</a></li>
<li>Various dependency updates</li>
</ul>
<h2>v7.0.0</h2>
<ul>
<li>Block checking out fork PR for pull_request_target and workflow_run by <a href="https://github.com/aiqiaoy"><code>@​aiqiaoy</code></a> in <a href="">actions/checkout#2454</a></li>
<li>Various dependency updates</li>
</ul>
<h2>v6.0.3</h2>
<ul>
<li>Fix checkout init for SHA-256 repositories by <a href="https://github.com/yaananth"><code>@​yaananth</code></a> in <a href="">actions/checkout#2439</a></li>
<li>fix: expand merge commit SHA regex and add SHA-256 test cases by <a href="https://github.com/yaananth"><code>@​yaananth</code></a> in <a href="">actions/checkout#2414</a></li>
</ul>
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
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3d3c42e</code></a> prep v7.0.1 release (<a href="">#2531</a>)</li>
<li><a href=""><code>2880268</code></a> escape values passed to --unset (<a href="">#2530</a>)</li>
<li><a href=""><code>12cd223</code></a> trim only ascii whitespace for branch (<a href="">#2521</a>)</li>
<li><a href=""><code>62661c4</code></a> skip running unsafe pr check if input is default (<a href="">#2518</a>)</li>
<li><a href=""><code>e8d4307</code></a> Bump the minor-actions-dependencies group with 2 updates (<a href="">#2499</a>)</li>
<li><a href=""><code>631c942</code></a> eslint 9 (<a href="">#2474</a>)</li>
<li><a href=""><code>4f1f4ae</code></a> Bump actions/upload-artifact from 4 to 7 (<a href="">#2476</a>)</li>
<li><a href=""><code>ba09753</code></a> Bump actions/checkout from 6 to 7 (<a href="">#2488</a>)</li>
<li><a href=""><code>b9e0990</code></a> Bump docker/login-action from 3.3.0 to 4.2.0 (<a href="">#2479</a>)</li>
<li><a href=""><code>e8cb398</code></a> Bump docker/build-push-action from 6.5.0 to 7.2.0 (<a href="">#2478</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/actions/checkout/compare/11d5960a326750d5838078e36cf38b85af677262...3d3c42e5aac5ba805825da76410c181273ba90b1">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/setup-python` from 5.6.0 to 7.0.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/setup-python/releases">actions/setup-python's releases</a>.</em></p>
<blockquote>
<h2>v7.0.0</h2>
<h2>What's Changed</h2>
<h3>Enhancements</h3>
<ul>
<li>Migrate to ESM and upgrade dependencies by <a href="https://github.com/priyagupta108"><code>@​priyagupta108</code></a> in <a href="">actions/setup-python#1330</a></li>
<li>Pin SHA commits and update docs with latest versions by <a href="https://github.com/HarithaVattikuti"><code>@​HarithaVattikuti</code></a> in <a href="">actions/setup-python#1338</a></li>
<li>Remove the pip-install input by <a href="https://github.com/gowridurgad"><code>@​gowridurgad</code></a> in <a href="">actions/setup-python#1336</a></li>
</ul>
<h3>Bug Fix</h3>
<ul>
<li>Fix to Classify stderr warning messages as warnings instead of errors in annotations by <a href="https://github.com/lmvysakh"><code>@​lmvysakh</code></a> in <a href="">actions/setup-python#1335</a></li>
<li>Validate and retry manifest fetch to prevent silent failures by <a href="https://github.com/priyagupta108"><code>@​priyagupta108</code></a> in <a href="">actions/setup-python#1332</a></li>
</ul>
<h3>Dependency Upgrade</h3>
<ul>
<li>Bump certifi from 2020.6.20 to 2024.7.4 in /<strong>tests</strong>/data by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/setup-python#1328</a></li>
<li>Remove EOL Python versions and Bumps numpy text fixture by <a href="https://github.com/priya-kinthali"><code>@​priya-kinthali</code></a> in <a href="">actions/setup-python#1333</a></li>
<li>Upgrade <code>@​actions/cache</code> to 6.2.0 by <a href="https://github.com/philip-gai"><code>@​philip-gai</code></a> in <a href="">actions/setup-python#1337</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/lmvysakh"><code>@​lmvysakh</code></a> made their first contribution in <a href="">actions/setup-python#1335</a></li>
<li><a href="https://github.com/philip-gai"><code>@​philip-gai</code></a> made their first contribution in <a href="">actions/setup-python#1337</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/setup-python/compare/v6...v7.0.0">https://github.com/actions/setup-python/compare/v6...v7.0.0</a></p>
<h2>v6.3.0</h2>
<h2>What's Changed</h2>
<h3>Enhancement</h3>
<ul>
<li>Add RHEL support and include Linux distro in cache keys by <a href="https://github.com/priyagupta108"><code>@​priyagupta108</code></a> in <a href="">actions/setup-python#1323</a></li>
<li>Fix pip cache error handling on Windows by <a href="https://github.com/priyagupta108"><code>@​priyagupta108</code></a> in <a href="">actions/setup-python#1040</a></li>
</ul>
<h3>Dependency update</h3>
<ul>
<li>Upgrade minimatch from 3.1.2 to 3.1.5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/setup-python#1281</a></li>
<li>Upgrade actions dependencies by <a href="https://github.com/gowridurgad"><code>@​gowridurgad</code></a> with <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">actions/setup-python#1303</a></li>
<li>Upgrade <code>@​actions/cache</code> to 5.1.0, log cache write denied by <a href="https://github.com/jasongin"><code>@​jasongin</code></a> in <a href="">actions/setup-python#1324</a></li>
<li>Upgrade dependency versions and test workflow configuration by <a href="https://github.com/HarithaVattikuti"><code>@​HarithaVattikuti</code></a> in <a href="">actions/setup-python#1322</a></li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update advanced-usage.md by <a href="https://github.com/Dunky-Z"><code>@​Dunky-Z</code></a> in <a href="">actions/setup-python#811</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/gowridurgad"><code>@​gowridurgad</code></a> with <a href="https://github.com/Copilot"><code>@​Copilot</code></a> made their first contribution in <a href="">actions/setup-python#1303</a></li>
<li><a href="https://github.com/jasongin"><code>@​jasongin</code></a> made their first contribution in <a href="">actions/setup-python#1324</a></li>
<li><a href="https://github.com/Dunky-Z"><code>@​Dunky-Z</code></a> made their first contribution in <a href="">actions/setup-python#811</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/setup-python/compare/v6.2.0...v6.3.0">https://github.com/actions/setup-python/compare/v6.2.0...v6.3.0</a></p>
<h2>v6.2.0</h2>
<h2>What's Changed</h2>
<h3>Dependency Upgrades</h3>
<ul>
<li>Upgrade dependencies to Node 24 compatible versions by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/setup-python#1259</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5fda3b9</code></a> Pin SHA commits and update docs with latest versions (<a href="">#1338</a>)</li>
<li><a href=""><code>4ab7e95</code></a> Merge pull request <a href="">#1337</a> from actions/philip-gai/bump-actions-cache-6-2-0</li>
<li><a href=""><code>0f3a009</code></a> Remove the pip-install input (<a href="">#1336</a>)</li>
<li><a href=""><code>f8cf429</code></a> Migrate to ESM and upgrade dependencies (<a href="">#1330</a>)</li>
<li><a href=""><code>54baeea</code></a> Validate and retry manifest fetch to prevent silent failures (<a href="">#1332</a>)</li>
<li><a href=""><code>c709277</code></a> Annotation code fix (<a href="">#1335</a>)</li>
<li><a href=""><code>6849080</code></a> remove EOL Python versions and Bumps numpy text fixture (<a href="">#1333</a>)</li>
<li><a href=""><code>0903b46</code></a> Bump certifi from 2020.6.20 to 2024.7.4 in /<strong>tests</strong>/data (<a href="">#1328</a>)</li>
<li><a href=""><code>ece7cb0</code></a> Fix pip cache error handling on Windows. (<a href="">#1040</a>)</li>
<li><a href=""><code>1d18d7a</code></a> Update advanced-usage.md (<a href="">#811</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/actions/setup-python/compare/a26af69be951a213d495a4c3e4e4022e16d87065...5fda3b95a4ea91299a34e894583c3862153e4b97">compare view</a></li>
</ul>
</details>
<br />

Updates `codecov/codecov-action` from 5.5.5 to 7.1.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/codecov/codecov-action/releases">codecov/codecov-action's releases</a>.</em></p>
<blockquote>
<h2>v7.1.1</h2>
<h2>What's Changed</h2>
<ul>
<li>chore(release): 7.1.1 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1973</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v7.1.0...v7.1.1">https://github.com/codecov/codecov-action/compare/v7.1.0...v7.1.1</a></p>
<h2>v7.1.0</h2>
<h2>What's Changed</h2>
<ul>
<li>chore(release): 7.1.0 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1971</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v7.0.0...v7.1.0">https://github.com/codecov/codecov-action/compare/v7.0.0...v7.1.0</a></p>
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
<h2>v6.0.0</h2>
<h2>⚠️ This version introduces support for node24 which make cause breaking changes for systems that do not currently support node24. ⚠️</h2>
<h2>What's Changed</h2>
<ul>
<li>Revert &quot;Revert &quot;build(deps): bump actions/github-script from 7.0.1 to 8.0.0&quot;&quot; by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1929</a></li>
<li>Th/6.0.0 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1928</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>303a32d</code></a> chore(release): 7.1.1 (<a href="">#1973</a>)</li>
<li><a href=""><code>0b35c9e</code></a> chore(release): 7.1.0 (<a href="">#1971</a>)</li>
<li><a href=""><code>fb8b358</code></a> chore(release): 7.0.0 (<a href="">#1957</a>)</li>
<li><a href=""><code>ca0a928</code></a> ci: remove Enforce License Compliance workflow (<a href="">#1950</a>)</li>
<li><a href=""><code>e79a696</code></a> chore(release): 6.0.1 (<a href="">#1949</a>)</li>
<li><a href=""><code>51e6422</code></a> fix: prevent template injection in run: steps (VULN-1652) (<a href="">#1947</a>)</li>
<li><a href=""><code>57e3a13</code></a> Th/6.0.0 (<a href="">#1928</a>)</li>
<li><a href=""><code>f67d33d</code></a> Revert &quot;Revert &quot;build(deps): bump actions/github-script from 7.0.1 to 8.0.0&quot;&quot;...</li>
<li>See full diff in <a href="https://github.com/codecov/codecov-action/compare/0fb7174895f61a3b6b78fc075e0cd60383518dac...303a32d7a59b442fa8d48b6a1cc6825c09c847a5">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/upload-artifact` from 4.6.2 to 7.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/upload-artifact/releases">actions/upload-artifact's releases</a>.</em></p>
<blockquote>
<h2>v7.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Update the readme with direct upload details by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/upload-artifact#795</a></li>
<li>Readme: bump all the example versions to v7 by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/upload-artifact#796</a></li>
<li>Include changes in typespec/ts-http-runtime 0.3.5 by <a href="https://github.com/yacaovsnc"><code>@​yacaovsnc</code></a> in <a href="">actions/upload-artifact#797</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v7...v7.0.1">https://github.com/actions/upload-artifact/compare/v7...v7.0.1</a></p>
<h2>v7.0.0</h2>
<h2>v7 What's new</h2>
<h3>Direct Uploads</h3>
<p>Adds support for uploading single files directly (unzipped). Callers can set the new <code>archive</code> parameter to <code>false</code> to skip zipping the file during upload. Right now, we only support single files. The action will fail if the glob passed resolves to multiple files. The <code>name</code> parameter is also ignored with this setting. Instead, the name of the artifact will be the name of the uploaded file.</p>
<h3>ESM</h3>
<p>To support new versions of the <code>@actions/*</code> packages, we've upgraded the package to ESM.</p>
<h2>What's Changed</h2>
<ul>
<li>Add proxy integration test by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/upload-artifact#754</a></li>
<li>Upgrade the module to ESM and bump dependencies by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/upload-artifact#762</a></li>
<li>Support direct file uploads by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/upload-artifact#764</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Link"><code>@​Link</code></a>- made their first contribution in <a href="">actions/upload-artifact#754</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v6...v7.0.0">https://github.com/actions/upload-artifact/compare/v6...v7.0.0</a></p>
<h2>v6.0.0</h2>
<h2>v6 - What's new</h2>
<blockquote>
<p>[!IMPORTANT]
actions/upload-artifact@v6 now runs on Node.js 24 (<code>runs.using: node24</code>) and requires a minimum Actions Runner version of 2.327.1. If you are using self-hosted runners, ensure they are updated before upgrading.</p>
</blockquote>
<h3>Node.js 24</h3>
<p>This release updates the runtime to Node.js 24. v5 had preliminary support for Node.js 24, however this action was by default still running on Node.js 20. Now this action by default will run on Node.js 24.</p>
<h2>What's Changed</h2>
<ul>
<li>Upload Artifact Node 24 support by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/upload-artifact#719</a></li>
<li>fix: update <code>@​actions/artifact</code> for Node.js 24 punycode deprecation by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/upload-artifact#744</a></li>
<li>prepare release v6.0.0 for Node.js 24 support by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/upload-artifact#745</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v5.0.0...v6.0.0">https://github.com/actions/upload-artifact/compare/v5.0.0...v6.0.0</a></p>
<h2>v5.0.0</h2>
<h2>What's Changed</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>043fb46</code></a> Merge pull request <a href="">#797</a> from actions/yacaovsnc/update-dependency</li>
<li><a href=""><code>634250c</code></a> Include changes in typespec/ts-http-runtime 0.3.5</li>
<li><a href=""><code>e454baa</code></a> Readme: bump all the example versions to v7 (<a href="">#796</a>)</li>
<li><a href=""><code>74fad66</code></a> Update the readme with direct upload details (<a href="">#795</a>)</li>
<li><a href=""><code>bbbca2d</code></a> Support direct file uploads (<a href="">#764</a>)</li>
<li><a href=""><code>589182c</code></a> Upgrade the module to ESM and bump dependencies (<a href="">#762</a>)</li>
<li><a href=""><code>47309c9</code></a> Merge pull request <a href="">#754</a> from actions/Link-/add-proxy-integration-tests</li>
<li><a href=""><code>02a8460</code></a> Add proxy integration test</li>
<li><a href=""><code>b7c566a</code></a> Merge pull request <a href="">#745</a> from actions/upload-artifact-v6-release</li>
<li><a href=""><code>e516bc8</code></a> docs: correct description of Node.js 24 support in README</li>
<li>Additional commits viewable in <a href="https://github.com/actions/upload-artifact/compare/ea165f8d65b6e75b540449e92b4886f43607fa02...043fb46d1a93c77aae656e7c1c64a875d1fc6a0a">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/download-artifact` from 4.3.0 to 8.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/download-artifact/releases">actions/download-artifact's releases</a>.</em></p>
<blockquote>
<h2>v8.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Support for CJK characters in the artifact name by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#471</a></li>
<li>Add a regression test for artifact name + content-type mismatches by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#472</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/download-artifact/compare/v8...v8.0.1">https://github.com/actions/download-artifact/compare/v8...v8.0.1</a></p>
<h2>v8.0.0</h2>
<h2>v8 - What's new</h2>
<blockquote>
<p>[!IMPORTANT]
actions/download-artifact@v8 has been migrated to an ESM module. This should be transparent to the caller but forks might need to make significant changes.</p>
</blockquote>
<blockquote>
<p>[!IMPORTANT]
Hash mismatches will now error by default. Users can override this behavior with a setting change (see below).</p>
</blockquote>
<h3>Direct downloads</h3>
<p>To support direct uploads in <code>actions/upload-artifact</code>, the action will no longer attempt to unzip all downloaded files. Instead, the action checks the <code>Content-Type</code> header ahead of unzipping and skips non-zipped files. Callers wishing to download a zipped file as-is can also set the new <code>skip-decompress</code> parameter to <code>true</code>.</p>
<h3>Enforced checks (breaking)</h3>
<p>A previous release introduced digest checks on the download. If a download hash didn't match the expected hash from the server, the action would log a warning. Callers can now configure the behavior on mismatch with the <code>digest-mismatch</code> parameter. To be secure by default, we are now defaulting the behavior to <code>error</code> which will fail the workflow run.</p>
<h3>ESM</h3>
<p>To support new versions of the @actions/* packages, we've upgraded the package to ESM.</p>
<h2>What's Changed</h2>
<ul>
<li>Don't attempt to un-zip non-zipped downloads by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#460</a></li>
<li>Add a setting to specify what to do on hash mismatch and default it to <code>error</code> by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#461</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/download-artifact/compare/v7...v8.0.0">https://github.com/actions/download-artifact/compare/v7...v8.0.0</a></p>
<h2>v7.0.0</h2>
<h2>v7 - What's new</h2>
<blockquote>
<p>[!IMPORTANT]
actions/download-artifact@v7 now runs on Node.js 24 (<code>runs.using: node24</code>) and requires a minimum Actions Runner version of 2.327.1. If you are using self-hosted runners, ensure they are updated before upgrading.</p>
</blockquote>
<h3>Node.js 24</h3>
<p>This release updates the runtime to Node.js 24. v6 had preliminary support for Node 24, however this action was by default still running on Node.js 20. Now this action by default will run on Node.js 24.</p>
<h2>What's Changed</h2>
<ul>
<li>Update GHES guidance to include reference to Node 20 version by <a href="https://github.com/patrikpolyak"><code>@​patrikpolyak</code></a> in <a href="">actions/download-artifact#440</a></li>
<li>Download Artifact Node24 support by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/download-artifact#415</a></li>
<li>fix: update <code>@​actions/artifact</code> to fix Node.js 24 punycode deprecation by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/download-artifact#451</a></li>
<li>prepare release v7.0.0 for Node.js 24 support by <a href="https://github.com/salmanmkc"><code>@​salmanmkc</code></a> in <a href="">actions/download-artifact#452</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3e5f45b</code></a> Add regression tests for CJK characters (<a href="">#471</a>)</li>
<li><a href=""><code>e6d03f6</code></a> Add a regression test for artifact name + content-type mismatches (<a href="">#472</a>)</li>
<li><a href=""><code>70fc10c</code></a> Merge pull request <a href="">#461</a> from actions/danwkennedy/digest-mismatch-behavior</li>
<li><a href=""><code>f258da9</code></a> Add change docs</li>
<li><a href=""><code>ccc058e</code></a> Fix linting issues</li>
<li><a href=""><code>bd7976b</code></a> Add a setting to specify what to do on hash mismatch and default it to <code>error</code></li>
<li><a href=""><code>ac21fcf</code></a> Merge pull request <a href="">#460</a> from actions/danwkennedy/download-no-unzip</li>
<li><a href=""><code>15999bf</code></a> Add note about package bumps</li>
<li><a href=""><code>974686e</code></a> Bump the version to <code>v8</code> and add release notes</li>
<li><a href=""><code>fbe48b1</code></a> Update test names to make it clearer what they do</li>
<li>Additional commits viewable in <a href="https://github.com/actions/download-artifact/compare/d3f86a106a0bac45b974a628896c90dbdf5c8093...3e5f45b2cfb9172054b4087a40e8e0b5a5461e7c">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/attest-build-provenance` from 2.4.0 to 4.2.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/attest-build-provenance/releases">actions/attest-build-provenance's releases</a>.</em></p>
<blockquote>
<h2>v4.2.2</h2>
<blockquote>
<p>[!NOTE]
As of version 4, <code>actions/attest-build-provenance</code> is simply a wrapper on top of <a href="https://github.com/actions/attest"><code>actions/attest</code></a>.</p>
<p>Existing applications may continue to use the <code>attest-build-provenance</code> action, but new implementations should use <code>actions/attest</code> instead.</p>
</blockquote>
<h2>What's Changed</h2>
<ul>
<li>Bump actions/attest from 4.2.0 to 4.2.1 in the actions-minor group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">actions/attest-build-provenance#862</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/attest-build-provenance/compare/v4.1.1...v4.2.2">https://github.com/actions/attest-build-provenance/compare/v4.1.1...v4.2.2</a></p>
<h2>v4.1.1</h2>
<blockquote>
<p>[!NOTE]
As of version 4, <code>actions/attest-build-provenance</code> is simply a wrapper on top of <a href="https://github.com/actions/attest"><code>actions/attest</code></a>.</p>
<p>Existing applications may continue to use the <code>attest-build-provenance</code> action, but new implementations should use <code>actions/attest</code> instead.</p>
</blockquote>
<h2>What's Changed</h2>
<ul>
<li>Update actions/attest to v4.1.1 by <a href="https://github.com/bdehamer"><code>@​bdehamer</code></a> in <a href="">actions/attest-build-provenance#858</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/attest-build-provenance/compare/v4.1.0...v4.1.1">https://github.com/actions/attest-build-provenance/compare/v4.1.0...v4.1.1</a></p>
<h2>v4.1.0</h2>
<blockquote>
<p>[!NOTE]
As of version 4, <code>actions/attest-build-provenance</code> is simply a wrapper on top of <a href="https://github.com/actions/attest"><code>actions/attest</code></a>.</p>
<p>Existing applications may continue to use the <code>attest-build-provenance</code> action, but new implementations should use <code>actions/attest</code> instead.</p>
</blockquote>
<h2>What's Changed</h2>
<ul>
<li>Update RELEASE.md docs by <a href="https://github.com/bdehamer"><code>@​bdehamer</code></a> in <a href="">actions/attest-build-provenance#836</a></li>
<li>Bump <code>actions/attest</code> from 4.0.0 to 4.1.0 by <a href="https://github.com/bdehamer"><code>@​bdehamer</code></a> in <a href="">actions/attest-build-provenance#838</a>
<ul>
<li>Bump <code>@actions/attest</code> from 3.0.0 to 3.1.0 by <a href="https://github.com/bdehamer"><code>@​bdehamer</code></a> in <a href="">actions/attest#362</a></li>
<li>Bump <code>@actions/attest</code> from 3.1.0 to 3.2.0 by <a href="https://github.com/bdehamer"><code>@​bdehamer</code></a> in <a href="">actions/attest#365</a></li>
<li>Add new <code>subject-version</code> input for inclusion in storage record by <a href="https://github.com/bdehamer"><code>@​bdehamer</code></a> in <a href="">actions/attest#364</a></li>
<li>Add storage record content to README by <a href="https://github.com/bdehamer"><code>@​bdehamer</code></a> in <a href="">actions/attest#366</a></li>
</ul>
</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/attest-build-provenance/compare/v4.0.0...v4.1.0">https://github.com/actions/attest-build-provenance/compare/v4.0.0...v4.1.0</a></p>
<h2>v4.0.0</h2>
<blockquote>
<p>[!NOTE]
As of version 4, <code>actions/attest-build-provenance</code> is simply a wrapper on top of <a href="https://github.com/actions/attest"><code>actions/attest</code></a>.</p>
<p>Existing applications may continue to use the <code>attest-build-provenance</code> action, but new implementations should use <code>actions/attest</code> instead.</p>
</blockquote>
<h2>What's Changed</h2>
<ul>
<li>Prepare v4 release by <a href="https://github.com/bdehamer"><code>@​bdehamer</code></a> in <a href="">actions/attest-build-provenance#835</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4d10147</code></a> Bump actions/attest from 4.2.0 to 4.2.1 in the actions-minor group (<a href="">#862</a>)</li>
<li><a href=""><code>e3fe62e</code></a> Bump the actions-minor group with 2 updates (<a href="">#860</a>)</li>
<li><a href=""><code>0f67c3f</code></a> Bump actions/checkout from 6.0.3 to 7.0.0 (<a href="">#857</a>)</li>
<li><a href=""><code>21b787d</code></a> Update actions/attest to v4.1.1 (<a href="">#858</a>)</li>
<li><a href=""><code>f14352a</code></a> add dependabot cooldown (<a href="">#851</a>)</li>
<li><a href=""><code>2c04a00</code></a> Bump actions/checkout from 6.0.2 to 6.0.3 in the actions-minor group (<a href="">#850</a>)</li>
<li><a href=""><code>10334b5</code></a> remove badges from README (<a href="">#840</a>)</li>
<li><a href=""><code>c5efebd</code></a> remove prober workflows (<a href="">#837</a>)</li>
<li><a href=""><code>a2bbfa2</code></a> bump actions/attest from 4.0.0 to 4.1.0 (<a href="">#838</a>)</li>
<li><a href=""><code>0856891</code></a> update RELEASE.md docs (<a href="">#836</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/actions/attest-build-provenance/compare/e8998f949152b193b063cb0ec769d69d929409be...4d101475d8b20a2381f78447822ac1eab6504dd8">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e240e532135`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.