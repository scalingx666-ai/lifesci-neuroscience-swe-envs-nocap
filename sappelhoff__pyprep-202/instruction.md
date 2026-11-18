# Issue

**Title:** Bump matlab-actions/setup-matlab from 2 to 3

## Description

Bumps [matlab-actions/setup-matlab](https://github.com/matlab-actions/setup-matlab) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/setup-matlab/releases">matlab-actions/setup-matlab's releases</a>.</em></p>
<blockquote>
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
<h2>v2.6.1</h2>
<h2>Bug Fixes</h2>
<ul>
<li>The <strong>Setup MATLAB</strong> action now sets up the specified products regardless of the contents of the tool cache on a self-hosted runner. Previously, if the runner’s tool cache contained MATLAB and other MathWorks products from an earlier setup, subsequent runs of the action ignored any newly specified products in the workflow file.</li>
</ul>
<h2>v2.6.0</h2>
<h2>Features</h2>
<ul>
<li>With the <code>cache</code> input specified as <code>true</code>, the action now caches MATLAB if it is set up successfully. Previously, the action cached MATLAB only if the entire job completed successfully.</li>
</ul>
<h2>Maintenance</h2>
<ul>
<li>Action dependencies have been updated based on <code>npm audit</code> and <code>npm outdated</code>.</li>
</ul>
<h2>v2.5.0</h2>
<h2>Features</h2>
<ul>
<li>Upgraded the actions/cache package to v4.</li>
</ul>
<h2>v2.4.0</h2>
<h2>Features</h2>
<ul>
<li>On Windows® systems, the <strong>Setup MATLAB</strong> action automatically adds the MATLAB Runtime folder to the <code>PATH</code> system environment variable.</li>
</ul>
<h2>v2.3.1</h2>
<h3><strong>Bug Fixes</strong></h3>
<ul>
<li>You can use the <strong>Setup MATLAB</strong> action multiple times within a workflow to set up different releases of MATLAB. Previously, attempting to set up different releases in the same workflow resulted in an error. For more information, see <a href="">#130</a>.</li>
</ul>
<h2>v2.3.0</h2>
<h2>Features</h2>
<ul>
<li>All HTTP clients now include retries for improved robustness.</li>
</ul>
<h2>v2.2.0</h2>
<ul>
<li>Install Intel version of MATLAB on Apple silicon runners when a release prior to R2023b is requested</li>
</ul>
<h2>v2.1.2</h2>
<ul>
<li>Fix cache bug for macOS and Windows runners</li>
<li>Bump dependency versions</li>
</ul>
<h2>v2.1.1</h2>
<ul>
<li>Updated set up on Apple Silicon to use the officially supported Java version</li>
</ul>
<h2>v2.1.0</h2>
<ul>
<li>Add Apple Silicon support</li>
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
<li>Additional commits viewable in <a href="https://github.com/matlab-actions/setup-matlab/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matlab-actions/setup-matlab&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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