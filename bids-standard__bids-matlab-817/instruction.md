# Issue

**Title:** Bump matlab-actions/setup-matlab from 2.6.1 to 3.0.1

## Description

Bumps [matlab-actions/setup-matlab](https://github.com/matlab-actions/setup-matlab) from 2.6.1 to 3.0.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/setup-matlab/releases">matlab-actions/setup-matlab's releases</a>.</em></p>
<blockquote>
<h2>v3.0.1</h2>
<h3>Dependency Update</h3>
<ul>
<li>This release does not include any new features. It updates the third-party libraries used by the action.</li>
</ul>
<h2>v3.0.0</h2>
<h2>Compatibility Considerations</h2>
<ul>
<li>The <strong>Setup MATLAB</strong> action now uses Node.js 24. Specify this version of the action in your workflow as <code>matlab-actions/setup-matlab@v3</code>. GitHub-hosted runners automatically support the new action version. To use the new action version on a self-hosted runner, ensure that the runner uses GitHub Actions runner version v2.327.1 or later.</li>
</ul>
<h2>v2.7.0</h2>
<h2>Features</h2>
<ul>
<li>You can control how to install the system dependencies for MATLAB on a runner by using the new <code>install-system-dependencies</code> input of the <strong>Setup MATLAB</strong> action. For example, if you specify the input as <code>true</code>, the action automatically installs the required dependencies. For more information, see <a href="https://github.com/matlab-actions/setup-matlab/blob/HEAD/README.md#set-up-matlab">Set Up MATLAB</a>.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a0180c9</code></a> Build for 421beef</li>
<li><a href=""><code>421beef</code></a> [skip ci] Bump v3.0.1</li>
<li><a href=""><code>245ed85</code></a> Format and update actions (<a href="">#193</a>)</li>
<li><a href=""><code>cd7fcc5</code></a> Bump handlebars from 4.7.8 to 4.7.9 (<a href="">#188</a>)</li>
<li><a href=""><code>47dd637</code></a> Bump brace-expansion (<a href="">#189</a>)</li>
<li><a href=""><code>89267e6</code></a> [skip ci] Bump v3.0.0</li>
<li><a href=""><code>72bbaca</code></a> Update checkout action's version</li>
<li><a href=""><code>2881f9b</code></a> Replace v2 with v3</li>
<li><a href=""><code>d48da49</code></a> Use node24 actions for workflows (<a href="">#191</a>)</li>
<li><a href=""><code>a85f4bd</code></a> Bump picomatch from 2.3.1 to 2.3.2 (<a href="">#190</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/matlab-actions/setup-matlab/compare/v2.6.1...v3.0.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matlab-actions/setup-matlab&package-manager=github_actions&previous-version=2.6.1&new-version=3.0.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1bc6c69c481`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.