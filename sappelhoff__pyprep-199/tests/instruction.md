# Issue

**Title:** Bump matlab-actions/run-command from 2 to 3

## Description

Bumps [matlab-actions/run-command](https://github.com/matlab-actions/run-command) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/run-command/releases">matlab-actions/run-command's releases</a>.</em></p>
<blockquote>
<h2>v3.0.0</h2>
<h2>Compatibility Considerations</h2>
<ul>
<li>The <strong>Run MATLAB Command</strong> action now uses Node.js 24. Specify this version of the action in your workflow as <code>matlab-actions/run-command@v3</code>. GitHub-hosted runners automatically support the new action version. To use the new action version on a self-hosted runner, ensure that the runner uses GitHub Actions runner version v2.327.1 or later.</li>
</ul>
<h2>v2.4.1</h2>
<h3>Bug Fixes</h3>
<ul>
<li>This release updates the <a href="https://github.com/matlab-actions/common-utils">common-utils</a> dependency version to <a href="https://github.com/matlab-actions/common-utils/releases/tag/v1.0.1">v1.0.1</a>.</li>
</ul>
<h2>v2.4.0</h2>
<h3>Features</h3>
<ul>
<li>If you have a MATLAB Test™ license, you can view your MATLAB and Simulink test results in your GitHub job summary. For more information, see <a href="https://github.com/matlab-actions/run-tests/blob/main/README.md#view-test-results">View Test Results</a>.</li>
<li>You can view your MATLAB buildtool task results in your GitHub job summary.</li>
</ul>
<h3>Maintenance</h3>
<ul>
<li>This release moves utilities to <a href="https://github.com/matlab-actions/common-utils">common-utils</a>.</li>
</ul>
<h2>v2.3.0</h2>
<h2>Features</h2>
<ul>
<li>Enabled online batch licensing.</li>
</ul>
<h2>v2.2.2</h2>
<h2>Maintenance</h2>
<ul>
<li>Action dependencies have been updated based on <code>npm audit</code> and <code>npm outdated</code>.</li>
</ul>
<h2>v2.2.1</h2>
<h2>Bug Fixes</h2>
<ul>
<li>Disabled online batch licensing.</li>
</ul>
<h2>v2.2.0</h2>
<h2>Features</h2>
<ul>
<li>Improved logging output by reducing extraneous foldable groups.</li>
</ul>
<h2>v2.1.1</h2>
<ul>
<li>Bumped dependency versions</li>
</ul>
<h2>v2.1.0</h2>
<ul>
<li>Added Apple Silicon support</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bcd446a</code></a> Build for adaa767</li>
<li><a href=""><code>adaa767</code></a> [skip ci] Bump v3.2.0</li>
<li><a href=""><code>67cdfd4</code></a> Add generate-job-summary input to control CI job summary generation (<a href="">#98</a>)</li>
<li><a href=""><code>e8cdbd0</code></a> [skip ci] Bump v3.1.2</li>
<li><a href=""><code>3f8ea5f</code></a> Add attestations (<a href="">#99</a>)</li>
<li><a href=""><code>16e9f86</code></a> [skip ci] Bump v3.1.1</li>
<li><a href=""><code>b7aa89c</code></a> Update common-utils version to v2.2.2 (<a href="">#97</a>)</li>
<li><a href=""><code>51f4256</code></a> [skip ci] Bump v3.1.0</li>
<li><a href=""><code>198e150</code></a> Update common-utils version to v2.2.1 (<a href="">#96</a>)</li>
<li><a href=""><code>b2bfb1b</code></a> [skip ci] Bump v3.0.2</li>
<li>Additional commits viewable in <a href="https://github.com/matlab-actions/run-command/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matlab-actions/run-command&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04a82f1eb53b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.