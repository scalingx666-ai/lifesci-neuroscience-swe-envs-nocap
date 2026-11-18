# Issue

**Title:** Bump the actions group with 2 updates

## Description

Bumps the actions group with 2 updates: [matlab-actions/setup-matlab](https://github.com/matlab-actions/setup-matlab) and [matlab-actions/run-command](https://github.com/matlab-actions/run-command).

Updates `matlab-actions/setup-matlab` from 3.0.2 to 3.1.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/setup-matlab/releases">matlab-actions/setup-matlab's releases</a>.</em></p>
<blockquote>
<h2>v3.1.0</h2>
<h3>Features</h3>
<ul>
<li>You can set up the latest release or prerelease of MATLAB and other MathWorks products by specifying the <code>release</code> input of the <strong>Setup MATLAB</strong> action as <code>latest-including-prerelease</code>. If the latest prerelease is more recent than the latest release, the action sets up the latest prerelease. Otherwise, the action sets up the latest release.</li>
</ul>
<h3>Dependency Update</h3>
<ul>
<li>This release updates the third-party libraries used by the action.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f9e4301</code></a> Build for 8936441</li>
<li><a href=""><code>8936441</code></a> [skip ci] Bump v3.1.0</li>
<li><a href=""><code>6372edb</code></a> use new mpm format for prerelease (<a href="">#207</a>)</li>
<li><a href=""><code>33aa4fc</code></a> Fix CVEs (<a href="">#205</a>)</li>
<li>See full diff in <a href="https://github.com/matlab-actions/setup-matlab/compare/2323adb8243827ea460b0def4c413545aaec46a9...f9e43010f1ae678f7cfa0542fe2a4f60f7d1ad8d">compare view</a></li>
</ul>
</details>
<br />

Updates `matlab-actions/run-command` from 3.2.1 to 3.3.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/run-command/releases">matlab-actions/run-command's releases</a>.</em></p>
<blockquote>
<h2>v3.3.0</h2>
<h3>Features</h3>
<ul>
<li>You can now generate a test summary on the GitHub job summary page when running tests in parallel. Previously, test summary generation was supported only for serial test execution.</li>
<li>The GitHub Actions workflow no longer fails when the action cannot generate a test summary on the GitHub job summary page. Instead, the action issues a warning and continues the workflow.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bfa8576</code></a> Build for 0ada21f</li>
<li><a href=""><code>0ada21f</code></a> [skip ci] Bump v3.3.0</li>
<li><a href=""><code>595f1b3</code></a> Bump common-utils to v2.5.0 (<a href="">#105</a>)</li>
<li><a href=""><code>bc74ddb</code></a> Remove dependency on MATLAB Test (<a href="">#104</a>)</li>
<li>See full diff in <a href="https://github.com/matlab-actions/run-command/compare/75644028e1e2aa374bbfdc968a65718a178cc264...bfa857648f4895aa98a446fe41c85e0788421ed5">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdd127dcbc60`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.