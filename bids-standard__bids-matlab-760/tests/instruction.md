# Issue

**Title:** Bump matlab-actions/setup-matlab from 2.3.1 to 2.5.0

## Description

Bumps [matlab-actions/setup-matlab](https://github.com/matlab-actions/setup-matlab) from 2.3.1 to 2.5.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/setup-matlab/releases">matlab-actions/setup-matlab's releases</a>.</em></p>
<blockquote>
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
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>718d432</code></a> Build for 0aae622</li>
<li><a href=""><code>0aae622</code></a> [skip ci] Bump v2.5.0</li>
<li><a href=""><code>c4356af</code></a> Update to <code>@​actions/cache</code> v4 (<a href="">#143</a>)</li>
<li><a href=""><code>45ddf79</code></a> [skip ci] Bump v2.4.0</li>
<li><a href=""><code>e0aef80</code></a> Add runtime directory to system PATH for windows (<a href="">#141</a>)</li>
<li><a href=""><code>38d812c</code></a> on-demand setup for self-hosted runners</li>
<li><a href=""><code>f496773</code></a> Merge pull request <a href="">#134</a> from matlab-actions/dep_updates</li>
<li><a href=""><code>743e353</code></a> Add pause to tests as workaround to connector bug (<a href="">#137</a>)</li>
<li><a href=""><code>beac786</code></a> Update bat.yml (<a href="">#136</a>)</li>
<li><a href=""><code>e211b84</code></a> update deps</li>
<li>See full diff in <a href="https://github.com/matlab-actions/setup-matlab/compare/v2.3.1...v2.5.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matlab-actions/setup-matlab&package-manager=github_actions&previous-version=2.3.1&new-version=2.5.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f591699eddc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.