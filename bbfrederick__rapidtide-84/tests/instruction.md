# Issue

**Title:** Bump docker/login-action from 1 to 2

## Description

[//]: # (dependabot-start)
⚠️  **Dependabot is rebasing this PR** ⚠️

Rebasing might not happen immediately, so don't worry if this takes some time.

Note: if you make any changes to this PR yourself, they will take precedence over the rebase.

---

[//]: # (dependabot-end)

Bumps [docker/login-action](https://github.com/docker/login-action) from 1 to 2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/login-action/releases">docker/login-action's releases</a>.</em></p>
<blockquote>
<h2>v2.0.0</h2>
<ul>
<li>Node 16 as default runtime by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/161">#161</a>)
<ul>
<li>This requires a minimum <a href="https://github.com/actions/runner/releases/tag/v2.285.0">Actions Runner</a> version of v2.285.0, which is by default available in GHES 3.4 or later.</li>
</ul>
</li>
<li>chore: update dev dependencies and workflow by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/170">#170</a>)</li>
<li>Bump <code>@​actions/exec</code> from 1.1.0 to 1.1.1 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/167">#167</a>)</li>
<li>Bump <code>@​actions/io</code> from 1.1.1 to 1.1.2 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/168">#168</a>)</li>
<li>Bump minimist from 1.2.5 to 1.2.6 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/176">#176</a>)</li>
<li>Bump https-proxy-agent from 5.0.0 to 5.0.1 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/182">#182</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v1.14.1...v2.0.0">https://github.com/docker/login-action/compare/v1.14.1...v2.0.0</a></p>
<h2>v1.14.1</h2>
<ul>
<li>Revert to Node 12 as default runtime to fix issue for GHE users (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/160">#160</a>)</li>
</ul>
<h2>v1.14.0</h2>
<ul>
<li>Update to node 16 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/158">#158</a>)</li>
<li>Bump <code>@​aws-sdk/client-ecr</code> from 3.45.0 to 3.53.0 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/157">#157</a>)</li>
<li>Bump <code>@​aws-sdk/client-ecr-public</code> from 3.45.0 to 3.53.0 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/156">#156</a>)</li>
</ul>
<h2>v1.13.0</h2>
<ul>
<li>Handle proxy settings for aws-sdk (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/152">#152</a>)</li>
<li>Workload identity based authentication docs for GCR and GAR (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/112">#112</a>)</li>
<li>Test login against ACR (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/49">#49</a>)</li>
<li>Bump <code>@​aws-sdk/client-ecr</code> from 3.44.0 to 3.45.0 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/132">#132</a>)</li>
<li>Bump <code>@​aws-sdk/client-ecr-public</code> from 3.43.0 to 3.45.0 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/131">#131</a>)</li>
</ul>
<h2>v1.12.0</h2>
<ul>
<li>ECR: only set credentials if username and password are specified (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/128">#128</a>)</li>
<li>Refactor to use aws-sdk v3 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/128">#128</a>)</li>
</ul>
<h2>v1.11.0</h2>
<ul>
<li>ECR: switch implementation to use the AWS SDK (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/126">#126</a>)</li>
<li><code>ecr</code> input to specify whether the given registry is ECR (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/123">#123</a>)</li>
<li>Test against Windows runner (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/126">#126</a>)</li>
<li>Update instructions for Google registry (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/127">#127</a>)</li>
<li>Update dev workflow (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/111">#111</a>)</li>
<li>Small changes for GHCR doc (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/86">#86</a>)</li>
<li>Update dev dependencies (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/85">#85</a>)</li>
<li>Bump ansi-regex from 5.0.0 to 5.0.1 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/101">#101</a>)</li>
<li>Bump tmpl from 1.0.4 to 1.0.5 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/100">#100</a>)</li>
<li>Bump <code>@​actions/core</code> from 1.4.0 to 1.6.0 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/94">#94</a> <a href="https://github-redirect.dependabot.com/docker/login-action/issues/103">#103</a>)</li>
<li>Bump codecov/codecov-action from 1 to 2 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/88">#88</a>)</li>
<li>Bump hosted-git-info from 2.8.8 to 2.8.9 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/83">#83</a>)</li>
<li>Bump node-notifier from 8.0.0 to 8.0.2 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/82">#82</a>)</li>
<li>Bump ws from 7.3.1 to 7.5.0 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/81">#81</a>)</li>
<li>Bump lodash from 4.17.20 to 4.17.21 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/80">#80</a>)</li>
<li>Bump y18n from 4.0.0 to 4.0.3 (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/79">#79</a>)</li>
</ul>
<h2>v1.10.0</h2>
<ul>
<li>GitHub Packages Docker Registry deprecated (<a href="https://github-redirect.dependabot.com/docker/login-action/issues/78">#78</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>49ed152</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/login-action/issues/161">#161</a> from crazy-max/node16-runtime</li>
<li><a href=""><code>b61a9ce</code></a> Node 16 as default runtime</li>
<li><a href=""><code>3a136a8</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/login-action/issues/182">#182</a> from docker/dependabot/npm_and_yarn/https-proxy-agent...</li>
<li><a href=""><code>b312880</code></a> Update generated content</li>
<li><a href=""><code>795794e</code></a> Bump https-proxy-agent from 5.0.0 to 5.0.1</li>
<li><a href=""><code>1edf618</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/login-action/issues/179">#179</a> from docker/dependabot/github_actions/codecov/codecov...</li>
<li><a href=""><code>8e66ad4</code></a> Bump codecov/codecov-action from 2 to 3</li>
<li><a href=""><code>7c79b59</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/login-action/issues/176">#176</a> from docker/dependabot/npm_and_yarn/minimist-1.2.6</li>
<li><a href=""><code>24a38e0</code></a> Bump minimist from 1.2.5 to 1.2.6</li>
<li><a href=""><code>70e1ff8</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/login-action/issues/170">#170</a> from crazy-max/eslint</li>
<li>Additional commits viewable in <a href="https://github.com/docker/login-action/compare/v1...v2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/login-action&package-manager=github_actions&previous-version=1&new-version=2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ba46ef69213`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.