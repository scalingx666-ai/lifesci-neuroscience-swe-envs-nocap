# Issue

**Title:** Bump the github-actions group across 1 directory with 7 updates

## Description

Bumps the github-actions group with 7 updates in the / directory:

| Package | From | To |
| --- | --- | --- |
| [actions/checkout](https://github.com/actions/checkout) | `5` | `7` |
| [mamba-org/setup-micromamba](https://github.com/mamba-org/setup-micromamba) | `2.0.7` | `3.2.0` |
| [docker/login-action](https://github.com/docker/login-action) | `3` | `4` |
| [docker/setup-buildx-action](https://github.com/docker/setup-buildx-action) | `3` | `4` |
| [docker/build-push-action](https://github.com/docker/build-push-action) | `6` | `7` |
| [actions/cache](https://github.com/actions/cache) | `4` | `6` |
| [codecov/codecov-action](https://github.com/codecov/codecov-action) | `5` | `7` |

Updates `actions/checkout` from 5 to 7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/releases">actions/checkout's releases</a>.</em></p>
<blockquote>
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
<li>Fix tag handling: preserve annotations and explicit fetch-tags by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2356</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v6.0.1...v6.0.2">https://github.com/actions/checkout/compare/v6.0.1...v6.0.2</a></p>
<h2>v6.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Update all references from v5 and v4 to v6 by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2314</a></li>
<li>Add worktree support for persist-credentials includeIf by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2327</a></li>
<li>Clarify v6 README by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">actions/checkout#2328</a></li>
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
<li>Additional commits viewable in <a href="https://github.com/actions/checkout/compare/v5...v7">compare view</a></li>
</ul>
</details>
<br />

Updates `mamba-org/setup-micromamba` from 2.0.7 to 3.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mamba-org/setup-micromamba/releases">mamba-org/setup-micromamba's releases</a>.</em></p>
<blockquote>
<h2>v3.2.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>New features</h3>
<ul>
<li>feat: Support prereleases of micromamba by <a href="https://github.com/jjerphan"><code>@​jjerphan</code></a> in <a href="">mamba-org/setup-micromamba#310</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/mamba-org/setup-micromamba/compare/v3.1.0...v3.2.0">https://github.com/mamba-org/setup-micromamba/compare/v3.1.0...v3.2.0</a></p>
<h2>v3.1.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>New features</h3>
<ul>
<li>Support Windows ARM64 (<code>win-arm64</code>) by <a href="https://github.com/weiji14"><code>@​weiji14</code></a> in <a href="">mamba-org/setup-micromamba#269</a></li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update README examples to use setup-micromamba v3 by <a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> with <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">mamba-org/setup-micromamba#305</a></li>
</ul>
<h3>Dependency updates</h3>
<ul>
<li>Bump the actions group with 3 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#299</a></li>
<li>Bump the actions group across 1 directory with 5 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#308</a></li>
<li>Bump actions/checkout from 6.0.2 to 6.0.3 in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#311</a></li>
<li>Bump the actions group with 3 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#312</a></li>
<li>Bump the node group across 1 directory with 14 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#309</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> with <a href="https://github.com/Copilot"><code>@​Copilot</code></a> made their first contribution in <a href="">mamba-org/setup-micromamba#305</a></li>
<li><a href="https://github.com/weiji14"><code>@​weiji14</code></a> made their first contribution in <a href="">mamba-org/setup-micromamba#269</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/mamba-org/setup-micromamba/compare/v3.0.0...v3.1.0">https://github.com/mamba-org/setup-micromamba/compare/v3.0.0...v3.1.0</a></p>
<h2>v3.0.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>New features</h3>
<ul>
<li>Update Node.js version from 20 to 24 by <a href="https://github.com/glass-ships"><code>@​glass-ships</code></a> in <a href="">mamba-org/setup-micromamba#296</a></li>
<li>Hash bytes rather than encoded string by <a href="https://github.com/bhperry"><code>@​bhperry</code></a> in <a href="">mamba-org/setup-micromamba#297</a></li>
</ul>
<h3>Dependency updates</h3>
<ul>
<li>Bump the node group with 9 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#286</a></li>
<li>Bump the actions group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#285</a></li>
<li>Bump the node group across 1 directory with 13 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#292</a></li>
<li>Bump the actions group across 1 directory with 4 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#289</a></li>
<li>Bump the node group across 1 directory with 14 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mamba-org/setup-micromamba#294</a></li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Pin github actions by <a href="https://github.com/pavelzw"><code>@​pavelzw</code></a> in <a href="">mamba-org/setup-micromamba#298</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/glass-ships"><code>@​glass-ships</code></a> made their first contribution in <a href="">mamba-org/setup-micromamba#296</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d6abac3</code></a> feat: Support prereleases of micromamba (<a href="">#310</a>)</li>
<li><a href=""><code>ce51e99</code></a> Bump the node group across 1 directory with 14 updates (<a href="">#309</a>)</li>
<li><a href=""><code>fb7186a</code></a> Support Windows ARM64 (<code>win-arm64</code>) (<a href="">#269</a>)</li>
<li><a href=""><code>60f1092</code></a> Bump the actions group with 3 updates (<a href="">#312</a>)</li>
<li><a href=""><code>ed54f9b</code></a> Bump actions/checkout from 6.0.2 to 6.0.3 in the actions group (<a href="">#311</a>)</li>
<li><a href=""><code>60b4c82</code></a> Bump the actions group across 1 directory with 5 updates (<a href="">#308</a>)</li>
<li><a href=""><code>63fffb4</code></a> Update README examples to use setup-micromamba v3 (<a href="">#305</a>)</li>
<li><a href=""><code>8959ca9</code></a> Bump the actions group with 3 updates (<a href="">#299</a>)</li>
<li><a href=""><code>d7c9bd8</code></a> Pin github actions (<a href="">#298</a>)</li>
<li><a href=""><code>11aea49</code></a> Bump the node group across 1 directory with 14 updates (<a href="">#294</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/mamba-org/setup-micromamba/compare/v2.0.7...v3.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `docker/login-action` from 3 to 4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/login-action/releases">docker/login-action's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<ul>
<li>Node 24 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.327.1">Actions Runner v2.327.1</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#929</a></li>
<li>Switch to ESM and update config/test wiring by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#927</a></li>
<li>Bump <code>@​actions/core</code> from 1.11.1 to 3.0.0 in <a href="">docker/login-action#919</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> from 3.890.0 to 3.1000.0 in <a href="">docker/login-action#909</a> <a href="">docker/login-action#920</a></li>
<li>Bump <code>@​aws-sdk/client-ecr-public</code> from 3.890.0 to 3.1000.0 in <a href="">docker/login-action#909</a> <a href="">docker/login-action#920</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.63.0 to 0.77.0 in <a href="">docker/login-action#910</a> <a href="">docker/login-action#928</a></li>
<li>Bump <code>@​isaacs/brace-expansion</code> from 5.0.0 to 5.0.1 in <a href="">docker/login-action#921</a></li>
<li>Bump js-yaml from 4.1.0 to 4.1.1 in <a href="">docker/login-action#901</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v3.7.0...v4.0.0">https://github.com/docker/login-action/compare/v3.7.0...v4.0.0</a></p>
<h2>v3.7.0</h2>
<ul>
<li>Add <code>scope</code> input to set scopes for the authentication token by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#912</a></li>
<li>Add support for AWS European Sovereign Cloud ECR by <a href="https://github.com/dphi"><code>@​dphi</code></a> in <a href="">docker/login-action#914</a></li>
<li>Ensure passwords are redacted with <code>registry-auth</code> input by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#911</a></li>
<li>build(deps): bump lodash from 4.17.21 to 4.17.23 in <a href="">docker/login-action#915</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v3.6.0...v3.7.0">https://github.com/docker/login-action/compare/v3.6.0...v3.7.0</a></p>
<h2>v3.6.0</h2>
<ul>
<li>Add <code>registry-auth</code> input for raw authentication to registries by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#887</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> to 3.890.0 in <a href="">docker/login-action#882</a> <a href="">docker/login-action#890</a></li>
<li>Bump <code>@​aws-sdk/client-ecr-public</code> to 3.890.0 in <a href="">docker/login-action#882</a> <a href="">docker/login-action#890</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.62.1 to 0.63.0 in <a href="">docker/login-action#883</a></li>
<li>Bump brace-expansion from 1.1.11 to 1.1.12 in <a href="">docker/login-action#880</a></li>
<li>Bump undici from 5.28.4 to 5.29.0 in <a href="">docker/login-action#879</a></li>
<li>Bump tmp from 0.2.3 to 0.2.4 in <a href="">docker/login-action#881</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v3.5.0...v3.6.0">https://github.com/docker/login-action/compare/v3.5.0...v3.6.0</a></p>
<h2>v3.5.0</h2>
<ul>
<li>Support dual-stack endpoints for AWS ECR by <a href="https://github.com/Spacefish"><code>@​Spacefish</code></a> <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#874</a> <a href="">docker/login-action#876</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> to 3.859.0 in <a href="">docker/login-action#860</a> <a href="">docker/login-action#878</a></li>
<li>Bump <code>@​aws-sdk/client-ecr-public</code> to 3.859.0 in <a href="">docker/login-action#860</a> <a href="">docker/login-action#878</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.57.0 to 0.62.1 in <a href="">docker/login-action#870</a></li>
<li>Bump form-data from 2.5.1 to 2.5.5 in <a href="">docker/login-action#875</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v3.4.0...v3.5.0">https://github.com/docker/login-action/compare/v3.4.0...v3.5.0</a></p>
<h2>v3.4.0</h2>
<ul>
<li>Bump <code>@​actions/core</code> from 1.10.1 to 1.11.1 in <a href="">docker/login-action#791</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> to 3.766.0 in <a href="">docker/login-action#789</a> <a href="">docker/login-action#856</a></li>
<li>Bump <code>@​aws-sdk/client-ecr-public</code> to 3.758.0 in <a href="">docker/login-action#789</a> <a href="">docker/login-action#856</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.35.0 to 0.57.0 in <a href="">docker/login-action#801</a> <a href="">docker/login-action#806</a> <a href="">docker/login-action#858</a></li>
<li>Bump cross-spawn from 7.0.3 to 7.0.6 in <a href="">docker/login-action#814</a></li>
<li>Bump https-proxy-agent from 7.0.5 to 7.0.6 in <a href="">docker/login-action#823</a></li>
<li>Bump path-to-regexp from 6.2.2 to 6.3.0 in <a href="">docker/login-action#777</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v3.3.0...v3.4.0">https://github.com/docker/login-action/compare/v3.3.0...v3.4.0</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dbcb813</code></a> Merge pull request <a href="">#1051</a> from docker/dependabot/npm_and_yarn/aws-sdk-dependen...</li>
<li><a href=""><code>5bcb015</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>b30b2f2</code></a> build(deps): bump the aws-sdk-dependencies group across 1 directory with 2 up...</li>
<li><a href=""><code>9087f1e</code></a> Merge pull request <a href="">#1057</a> from docker/dependabot/npm_and_yarn/js-yaml-5.2.2</li>
<li><a href=""><code>0009830</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>2325523</code></a> build(deps): bump js-yaml from 5.2.1 to 5.2.2</li>
<li><a href=""><code>4ec1d4a</code></a> Merge pull request <a href="">#1056</a> from docker/dependabot/npm_and_yarn/postcss-8.5.22</li>
<li><a href=""><code>5fc99ba</code></a> Merge pull request <a href="">#1053</a> from docker/dependabot/github_actions/aws-actions/co...</li>
<li><a href=""><code>e512bd5</code></a> Merge pull request <a href="">#1052</a> from docker/dependabot/github_actions/codeql-actions...</li>
<li><a href=""><code>a146c91</code></a> Merge pull request <a href="">#1059</a> from crazy-max/harden-buildx-scope-paths</li>
<li>Additional commits viewable in <a href="https://github.com/docker/login-action/compare/v3...v4">compare view</a></li>
</ul>
</details>
<br />

Updates `docker/setup-buildx-action` from 3 to 4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/setup-buildx-action/releases">docker/setup-buildx-action's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<ul>
<li>Node 24 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.327.1">Actions Runner v2.327.1</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#483</a></li>
<li>Remove deprecated inputs/outputs by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#464</a></li>
<li>Switch to ESM and update config/test wiring by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#481</a></li>
<li>Bump <code>@​actions/core</code> from 1.11.1 to 3.0.0 in <a href="">docker/setup-buildx-action#475</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.63.0 to 0.79.0 in <a href="">docker/setup-buildx-action#482</a> <a href="">docker/setup-buildx-action#485</a></li>
<li>Bump js-yaml from 4.1.0 to 4.1.1 in <a href="">docker/setup-buildx-action#452</a></li>
<li>Bump lodash from 4.17.21 to 4.17.23 in <a href="">docker/setup-buildx-action#472</a></li>
<li>Bump minimatch from 3.1.2 to 3.1.5 in <a href="">docker/setup-buildx-action#480</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.12.0...v4.0.0">https://github.com/docker/setup-buildx-action/compare/v3.12.0...v4.0.0</a></p>
<h2>v3.12.0</h2>
<ul>
<li>Deprecate <code>install</code> input by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#455</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.62.1 to 0.63.0 in <a href="">docker/setup-buildx-action#434</a></li>
<li>Bump brace-expansion from 1.1.11 to 1.1.12 in <a href="">docker/setup-buildx-action#436</a></li>
<li>Bump form-data from 2.5.1 to 2.5.5 in <a href="">docker/setup-buildx-action#432</a></li>
<li>Bump undici from 5.28.4 to 5.29.0 in <a href="">docker/setup-buildx-action#435</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.11.1...v3.12.0">https://github.com/docker/setup-buildx-action/compare/v3.11.1...v3.12.0</a></p>
<h2>v3.11.1</h2>
<ul>
<li>Fix <code>keep-state</code> not being respected by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#429</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.11.0...v3.11.1">https://github.com/docker/setup-buildx-action/compare/v3.11.0...v3.11.1</a></p>
<h2>v3.11.0</h2>
<ul>
<li>Keep BuildKit state support by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#427</a></li>
<li>Remove aliases created when installing by default by <a href="https://github.com/hashhar"><code>@​hashhar</code></a> in <a href="">docker/setup-buildx-action#139</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.56.0 to 0.62.1 in <a href="">docker/setup-buildx-action#422</a> <a href="">docker/setup-buildx-action#425</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.10.0...v3.11.0">https://github.com/docker/setup-buildx-action/compare/v3.10.0...v3.11.0</a></p>
<h2>v3.10.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.54.0 to 0.56.0 in <a href="">docker/setup-buildx-action#408</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.9.0...v3.10.0">https://github.com/docker/setup-buildx-action/compare/v3.9.0...v3.10.0</a></p>
<h2>v3.9.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.48.0 to 0.54.0 in <a href="">docker/setup-buildx-action#402</a> <a href="">docker/setup-buildx-action#404</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.8.0...v3.9.0">https://github.com/docker/setup-buildx-action/compare/v3.8.0...v3.9.0</a></p>
<h2>v3.8.0</h2>
<ul>
<li>Make cloud prefix optional to download buildx if driver is cloud by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#390</a></li>
<li>Bump <code>@​actions/core</code> from 1.10.1 to 1.11.1 in <a href="">docker/setup-buildx-action#370</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.39.0 to 0.48.0 in <a href="">docker/setup-buildx-action#389</a></li>
<li>Bump cross-spawn from 7.0.3 to 7.0.6 in <a href="">docker/setup-buildx-action#382</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v3.7.1...v3.8.0">https://github.com/docker/setup-buildx-action/compare/v3.7.1...v3.8.0</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bb05f3f</code></a> Merge pull request <a href="">#580</a> from docker/dependabot/npm_and_yarn/docker/actions-to...</li>
<li><a href=""><code>321c814</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>b9a36ef</code></a> build(deps): bump <code>@​docker/actions-toolkit</code> from 0.91.0 to 0.92.0</li>
<li><a href=""><code>ebeab24</code></a> Merge pull request <a href="">#570</a> from docker/dependabot/npm_and_yarn/undici-6.27.0</li>
<li><a href=""><code>5c7b8ae</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>037e618</code></a> build(deps): bump undici from 6.25.0 to 6.27.0</li>
<li><a href=""><code>66080e5</code></a> Merge pull request <a href="">#577</a> from docker/dependabot/npm_and_yarn/sigstore-4.1.1</li>
<li><a href=""><code>409aef0</code></a> Merge pull request <a href="">#562</a> from docker/dependabot/npm_and_yarn/js-yaml-4.2.0</li>
<li><a href=""><code>49c6e42</code></a> build(deps): bump sigstore from 4.1.0 to 4.1.1</li>
<li><a href=""><code>2211273</code></a> [dependabot skip] chore: update generated content</li>
<li>Additional commits viewable in <a href="https://github.com/docker/setup-buildx-action/compare/v3...v4">compare view</a></li>
</ul>
</details>
<br />

Updates `docker/build-push-action` from 6 to 7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/build-push-action/releases">docker/build-push-action's releases</a>.</em></p>
<blockquote>
<h2>v7.0.0</h2>
<ul>
<li>Node 24 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.327.1">Actions Runner v2.327.1</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1470</a></li>
<li>Remove deprecated <code>DOCKER_BUILD_NO_SUMMARY</code> and <code>DOCKER_BUILD_EXPORT_RETENTION_DAYS</code> envs by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1473</a></li>
<li>Remove legacy export-build tool support for build summary by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1474</a></li>
<li>Switch to ESM and update config/test wiring by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1466</a></li>
<li>Bump <code>@​actions/core</code> from 1.11.1 to 3.0.0 in <a href="">docker/build-push-action#1454</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.62.1 to 0.79.0 in <a href="">docker/build-push-action#1453</a> <a href="">docker/build-push-action#1472</a> <a href="">docker/build-push-action#1479</a></li>
<li>Bump minimatch from 3.1.2 to 3.1.5 in <a href="">docker/build-push-action#1463</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.19.2...v7.0.0">https://github.com/docker/build-push-action/compare/v6.19.2...v7.0.0</a></p>
<h2>v6.19.2</h2>
<ul>
<li>Preserve port in <code>GIT_AUTH_TOKEN</code> host by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1458</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.19.1...v6.19.2">https://github.com/docker/build-push-action/compare/v6.19.1...v6.19.2</a></p>
<h2>v6.19.1</h2>
<ul>
<li>Derive <code>GIT_AUTH_TOKEN</code> host from GitHub server URL by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1456</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.19.0...v6.19.1">https://github.com/docker/build-push-action/compare/v6.19.0...v6.19.1</a></p>
<h2>v6.19.0</h2>
<ul>
<li>Scope default git auth token to <code>github.com</code> by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1451</a></li>
<li>Bump brace-expansion from 1.1.11 to 1.1.12 in <a href="">docker/build-push-action#1396</a></li>
<li>Bump form-data from 2.5.1 to 2.5.5 in <a href="">docker/build-push-action#1391</a></li>
<li>Bump js-yaml from 3.14.1 to 3.14.2 in <a href="">docker/build-push-action#1429</a></li>
<li>Bump lodash from 4.17.21 to 4.17.23 in <a href="">docker/build-push-action#1446</a></li>
<li>Bump tmp from 0.2.3 to 0.2.4 in <a href="">docker/build-push-action#1398</a></li>
<li>Bump undici from 5.28.4 to 5.29.0 in <a href="">docker/build-push-action#1397</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.18.0...v6.19.0">https://github.com/docker/build-push-action/compare/v6.18.0...v6.19.0</a></p>
<h2>v6.18.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.61.0 to 0.62.1 in <a href="">docker/build-push-action#1381</a></li>
</ul>
<blockquote>
<p>[!NOTE]
<a href="https://docs.docker.com/build/ci/github-actions/build-summary/">Build summary</a> is now supported with <a href="https://docs.docker.com/build-cloud/">Docker Build Cloud</a>.</p>
</blockquote>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.17.0...v6.18.0">https://github.com/docker/build-push-action/compare/v6.17.0...v6.18.0</a></p>
<h2>v6.17.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.59.0 to 0.61.0 by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1364</a></li>
</ul>
<blockquote>
<p>[!NOTE]
Build record is now exported using the <a href="https://docs.docker.com/reference/cli/docker/buildx/history/export/"><code>buildx history export</code></a> command instead of the legacy export-build tool.</p>
</blockquote>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.16.0...v6.17.0">https://github.com/docker/build-push-action/compare/v6.16.0...v6.17.0</a></p>
<h2>v6.16.0</h2>
<ul>
<li>Handle no default attestations env var by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1343</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>53b7df9</code></a> Merge pull request <a href="">#1572</a> from docker/dependabot/npm_and_yarn/docker/actions-t...</li>
<li><a href=""><code>154298c</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>cb1238b</code></a> chore(deps): Bump <code>@​docker/actions-toolkit</code> from 0.91.0 to 0.92.0</li>
<li><a href=""><code>24f845d</code></a> Merge pull request <a href="">#1566</a> from docker/dependabot/npm_and_yarn/js-yaml-4.2.0</li>
<li><a href=""><code>9c69730</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>bc3a3a5</code></a> Merge pull request <a href="">#1574</a> from docker/dependabot/github_actions/aws-actions/co...</li>
<li><a href=""><code>a82c504</code></a> chore(deps): Bump js-yaml from 4.1.1 to 4.3.0</li>
<li><a href=""><code>0285a75</code></a> Merge pull request <a href="">#1573</a> from docker/dependabot/github_actions/actions/cache-...</li>
<li><a href=""><code>c6ad2a3</code></a> Merge pull request <a href="">#1575</a> from docker/dependabot/github_actions/actions/checko...</li>
<li><a href=""><code>d37484f</code></a> Merge pull request <a href="">#1564</a> from docker/dependabot/npm_and_yarn/undici-6.27.0</li>
<li>Additional commits viewable in <a href="https://github.com/docker/build-push-action/compare/v6...v7">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/cache` from 4 to 6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/cache/releases">actions/cache's releases</a>.</em></p>
<blockquote>
<h2>v6.0.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Update packages, migrate to ESM by <a href="https://github.com/Samirat"><code>@​Samirat</code></a> in <a href="">actions/cache#1760</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v5...v6.0.0">https://github.com/actions/cache/compare/v5...v6.0.0</a></p>
<h2>v5.1.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump <code>@​actions/cache</code> to v5.1.0 - handle read-only cache access by <a href="https://github.com/jasongin"><code>@​jasongin</code></a> in <a href="">actions/cache#1775</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v5...v5.1.0">https://github.com/actions/cache/compare/v5...v5.1.0</a></p>
<h2>v5.0.5</h2>
<h2>What's Changed</h2>
<ul>
<li>Update ts-http-runtime dependency by <a href="https://github.com/yacaovsnc"><code>@​yacaovsnc</code></a> in <a href="">actions/cache#1747</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v5...v5.0.5">https://github.com/actions/cache/compare/v5...v5.0.5</a></p>
<h2>v5.0.4</h2>
<h2>What's Changed</h2>
<ul>
<li>Add release instructions and update maintainer docs by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/cache#1696</a></li>
<li>Potential fix for code scanning alert no. 52: Workflow does not contain permissions by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/cache#1697</a></li>
<li>Fix workflow permissions and cleanup workflow names / formatting by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/cache#1699</a></li>
<li>docs: Update examples to use the latest version by <a href="https://github.com/XZTDean"><code>@​XZTDean</code></a> in <a href="">actions/cache#1690</a></li>
<li>Fix proxy integration tests by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/cache#1701</a></li>
<li>Fix cache key in examples.md for bun.lock by <a href="https://github.com/RyPeck"><code>@​RyPeck</code></a> in <a href="">actions/cache#1722</a></li>
<li>Update dependencies &amp; patch security vulnerabilities by <a href="https://github.com/Link"><code>@​Link</code></a>- in <a href="">actions/cache#1738</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/XZTDean"><code>@​XZTDean</code></a> made their first contribution in <a href="">actions/cache#1690</a></li>
<li><a href="https://github.com/RyPeck"><code>@​RyPeck</code></a> made their first contribution in <a href="">actions/cache#1722</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v5...v5.0.4">https://github.com/actions/cache/compare/v5...v5.0.4</a></p>
<h2>v5.0.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump <code>@actions/cache</code> to v5.0.5 (Resolves: <a href="https://github.com/actions/cache/security/dependabot/33">https://github.com/actions/cache/security/dependabot/33</a>)</li>
<li>Bump <code>@actions/core</code> to v2.0.3</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/cache/compare/v5...v5.0.3">https://github.com/actions/cache/compare/v5...v5.0.3</a></p>
<h2>v.5.0.2</h2>
<h1>v5.0.2</h1>
<h2>What's Changed</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/cache/blob/main/RELEASES.md">actions/cache's changelog</a>.</em></p>
<blockquote>
<h1>Releases</h1>
<h2>How to prepare a release</h2>
<blockquote>
<p>[!NOTE]
Relevant for maintainers with write access only.</p>
</blockquote>
<ol>
<li>Switch to a new branch from <code>main</code>.</li>
<li>Run <code>npm test</code> to ensure all tests are passing.</li>
<li>Update the version in <a href="https://github.com/actions/cache/blob/main/package.json"><code>https://github.com/actions/cache/blob/main/package.json</code></a>.</li>
<li>Run <code>npm run build</code> to update the compiled files.</li>
<li>Update this <a href="https://github.com/actions/cache/blob/main/RELEASES.md"><code>https://github.com/actions/cache/blob/main/RELEASES.md</code></a> with the new version and changes in the <code>## Changelog</code> section.</li>
<li>Run <code>licensed cache</code> to update the license report.</li>
<li>Run <code>licensed status</code> and resolve any warnings by updating the <a href="https://github.com/actions/cache/blob/main/.licensed.yml"><code>https://github.com/actions/cache/blob/main/.licensed.yml</code></a> file with the exceptions.</li>
<li>Commit your changes and push your branch upstream.</li>
<li>Open a pull request against <code>main</code> and get it reviewed and merged.</li>
<li>Draft a new release <a href="https://github.com/actions/cache/releases">https://github.com/actions/cache/releases</a> use the same version number used in <code>package.json</code>
<ol>
<li>Create a new tag with the version number.</li>
<li>Auto generate release notes and update them to match the changes you made in <code>RELEASES.md</code>.</li>
<li>Toggle the set as the latest release option.</li>
<li>Publish the release.</li>
</ol>
</li>
<li>Navigate to <a href="https://github.com/actions/cache/actions/workflows/release-new-action-version.yml">https://github.com/actions/cache/actions/workflows/release-new-action-version.yml</a>
<ol>
<li>There should be a workflow run queued with the same version number.</li>
<li>Approve the run to publish the new version and update the major tags for this action.</li>
</ol>
</li>
</ol>
<h2>Changelog</h2>
<h3>6.1.0</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v6.1.0 to pick up <a href="">actions/toolkit#2435 Handle cache write error due to read-only token</a></li>
<li>Switch redundant &quot;Cache save failed&quot; warning to debug log in save-only</li>
</ul>
<h3>6.0.0</h3>
<ul>
<li>Updated <code>@actions/cache</code> to ^6.0.1, <code>@actions/core</code> to ^3.0.1, <code>@actions/exec</code> to ^3.0.0, <code>@actions/io</code> to ^3.0.2</li>
<li>Migrated to ESM module system</li>
<li>Upgraded Jest to v30 and test infrastructure to be ESM compatible</li>
</ul>
<h3>5.0.4</h3>
<ul>
<li>Bump <code>minimatch</code> to v3.1.5 (fixes ReDoS via globstar patterns)</li>
<li>Bump <code>undici</code> to v6.24.1 (WebSocket decompression bomb protection, header validation fixes)</li>
<li>Bump <code>fast-xml-parser</code> to v5.5.6</li>
</ul>
<h3>5.0.3</h3>
<ul>
<li>Bump <code>@actions/cache</code> to v5.0.5 (Resolves: <a href="https://github.com/actions/cache/security/dependabot/33">https://github.com/actions/cache/security/dependabot/33</a>)</li>
<li>Bump <code>@actions/core</code> to v2.0.3</li>
</ul>
<h3>5.0.2</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>55cc834</code></a> Merge pull request <a href="">#1768</a> from jasongin/readonly-cache</li>
<li><a href=""><code>d8cd72f</code></a> Bump <code>@​actions/cache</code> to v6.1.0 - handle cache write error due to RO token</li>
<li><a href=""><code>2c8a9bd</code></a> Merge pull request <a href="">#1760</a> from actions/samirat/esm_migration_and_package_update</li>
<li><a href=""><code>e9b91fd</code></a> Prettier fixes</li>
<li><a href=""><code>e4884b8</code></a> Rebuild dist</li>
<li><a href=""><code>10baf01</code></a> Fixed licenses</li>
<li><a href=""><code>e39b386</code></a> Fix test mock return order</li>
<li><a href=""><code>b692820</code></a> PR feedback</li>
<li><a href=""><code>6074912</code></a> Rebuild dist bundles as ESM to match type:module</li>
<li><a href=""><code>5a912e8</code></a> Fix lint and jest issues</li>
<li>Additional commits viewable in <a href="https://github.com/actions/cache/compare/v4...v6">compare view</a></li>
</ul>
</details>
<br />

Updates `codecov/codecov-action` from 5 to 7
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
<p><strong>Full Change...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfe884e64a6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.