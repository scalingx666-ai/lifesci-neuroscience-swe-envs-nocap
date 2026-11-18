# Issue

**Title:** chore(actions): bump docker/login-action from 3.7.0 to 4.7.0

## Description

Bumps [docker/login-action](https://github.com/docker/login-action) from 3.7.0 to 4.7.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/login-action/releases">docker/login-action's releases</a>.</em></p>
<blockquote>
<h2>v4.7.0</h2>
<ul>
<li>Preserve explicit ECR settings in <code>registry-auth</code> by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1089</a></li>
<li>Use registry hosts for scoped credentials by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1088</a></li>
<li>Raise Docker Hub OIDC max expiry to 6 hours by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1068</a></li>
<li>Log Docker Hub OIDC token exchange progress by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1061</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> and <code>@​aws-sdk/client-ecr-public</code> to 3.1154.0 in <a href="">docker/login-action#1093</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.94.0 to 0.107.0 in <a href="">docker/login-action#1100</a></li>
<li>Bump <code>@​humanfs/node</code> from 0.16.7 to 0.16.8 in <a href="">docker/login-action#1077</a></li>
<li>Bump csv-parse from 7.0.1 to 7.0.3 in <a href="">docker/login-action#1078</a></li>
<li>Bump handlebars from 4.7.9 to 4.7.10 in <a href="">docker/login-action#1091</a></li>
<li>Bump js-yaml from 5.2.2 to 5.5.0 in <a href="">docker/login-action#1066</a></li>
<li>Bump postcss from 8.5.22 to 8.5.26 in <a href="">docker/login-action#1071</a></li>
<li>Bump postcss-selector-parser from 7.1.1 to 7.1.6 in <a href="">docker/login-action#1092</a></li>
<li>Bump source-map-js from 1.2.1 to 1.2.2 in <a href="">docker/login-action#1090</a></li>
<li>Bump undici from 6.27.0 to 6.29.1 in <a href="">docker/login-action#1085</a></li>
<li>Bump uuid from 14.0.1 to 14.0.3 in <a href="">docker/login-action#1096</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v4.6.0...v4.7.0">https://github.com/docker/login-action/compare/v4.6.0...v4.7.0</a></p>
<h2>v4.6.0</h2>
<ul>
<li>Harden buildx scoped config path handling by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1059</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> and <code>@​aws-sdk/client-ecr-public</code> to 3.1095.0 in <a href="">docker/login-action#1051</a></li>
<li>Bump js-yaml from 5.2.1 to 5.2.2 in <a href="">docker/login-action#1057</a></li>
<li>Bump postcss from 8.5.10 to 8.5.22 in <a href="">docker/login-action#1056</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v4.5.2...v4.6.0">https://github.com/docker/login-action/compare/v4.5.2...v4.6.0</a></p>
<h2>v4.5.2</h2>
<ul>
<li>Surface Docker Hub OIDC error responses by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1058</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v4.5.1...v4.5.2">https://github.com/docker/login-action/compare/v4.5.1...v4.5.2</a></p>
<h2>v4.5.1</h2>
<ul>
<li>Support <code>dhi.io</code> as Docker Hub OIDC registry by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1054</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v4.5.0...v4.5.1">https://github.com/docker/login-action/compare/v4.5.0...v4.5.1</a></p>
<h2>v4.5.0</h2>
<ul>
<li><a href="https://github.com/docker/login-action#docker-hub">Docker Hub OIDC</a> login support by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1048</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> and <code>@​aws-sdk/client-ecr-public</code> to 3.1091.0 in <a href="">docker/login-action#1037</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.92.0 to 0.94.0 in <a href="">docker/login-action#1044</a> <a href="">docker/login-action#1050</a></li>
<li>Bump brace-expansion from 1.1.13 to 1.1.16 in <a href="">docker/login-action#1046</a></li>
<li>Bump js-yaml from 5.2.0 to 5.2.1 in <a href="">docker/login-action#1038</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/login-action/compare/v4.4.0...v4.5.0">https://github.com/docker/login-action/compare/v4.4.0...v4.5.0</a></p>
<h2>v4.4.0</h2>
<ul>
<li>Skip empty <code>registry-auth</code> secret mask by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/login-action#1035</a></li>
<li>Bump <code>@​aws-sdk/client-ecr</code> and <code>@​aws-sdk/client-ecr-public</code> to 3.1077.0 <a href="">docker/login-action#1034</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>81c6f93</code></a> Merge pull request <a href="">#1100</a> from docker/dependabot/npm_and_yarn/docker/actions-t...</li>
<li><a href=""><code>1b16c8d</code></a> Merge pull request <a href="">#1096</a> from docker/dependabot/npm_and_yarn/uuid-14.0.3</li>
<li><a href=""><code>ac86b5e</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>1476d84</code></a> build(deps): bump <code>@​docker/actions-toolkit</code> from 0.94.0 to 0.107.0</li>
<li><a href=""><code>503cee6</code></a> Merge pull request <a href="">#1095</a> from docker/dependabot/github_actions/actions/create...</li>
<li><a href=""><code>f093535</code></a> Merge pull request <a href="">#1099</a> from docker/dependabot/github_actions/codecov/codeco...</li>
<li><a href=""><code>d5ae7f1</code></a> Merge pull request <a href="">#1098</a> from docker/dependabot/github_actions/docker/bake-ac...</li>
<li><a href=""><code>6f97507</code></a> Merge pull request <a href="">#1097</a> from docker/dependabot/github_actions/docker/bake-ac...</li>
<li><a href=""><code>006d61f</code></a> Merge pull request <a href="">#1094</a> from docker/dependabot/github_actions/codeql-actions...</li>
<li><a href=""><code>93f5f52</code></a> Merge pull request <a href="">#1093</a> from docker/dependabot/npm_and_yarn/aws-sdk-dependen...</li>
<li>Additional commits viewable in <a href="https://github.com/docker/login-action/compare/c94ce9fb468520275223c153574b00df6fe4bcc9...81c6f93d4bc991e510b342a00b419b3bb4efc5c6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/login-action&package-manager=github_actions&previous-version=3.7.0&new-version=4.7.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f457e154653`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.