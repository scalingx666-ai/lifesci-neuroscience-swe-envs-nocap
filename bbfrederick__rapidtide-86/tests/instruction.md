# Issue

**Title:** Bump docker/setup-buildx-action from 1 to 2

## Description

Bumps [docker/setup-buildx-action](https://github.com/docker/setup-buildx-action) from 1 to 2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/setup-buildx-action/releases">docker/setup-buildx-action's releases</a>.</em></p>
<blockquote>
<h2>v2.0.0</h2>
<ul>
<li>Node 16 as default runtime by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/131">#131</a>)
<ul>
<li>This requires a minimum <a href="https://github.com/actions/runner/releases/tag/v2.285.0">Actions Runner</a> version of v2.285.0, which is by default available in GHES 3.4 or later.</li>
</ul>
</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v1.7.0...v2.0.0">https://github.com/docker/setup-buildx-action/compare/v1.7.0...v2.0.0</a></p>
<h2>v1.7.0</h2>
<ul>
<li>Standalone mode by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/119">#119</a>)</li>
<li>Update dev dependencies and workflow by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/114">#114</a> <a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/130">#130</a>)</li>
<li>Bump tmpl from 1.0.4 to 1.0.5 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/108">#108</a>)</li>
<li>Bump ansi-regex from 5.0.0 to 5.0.1 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/109">#109</a>)</li>
<li>Bump <code>@​actions/core</code> from 1.5.0 to 1.6.0 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/110">#110</a>)</li>
<li>Bump actions/checkout from 2 to 3 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/126">#126</a>)</li>
<li>Bump <code>@​actions/tool-cache</code> from 1.7.1 to 1.7.2 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/128">#128</a>)</li>
<li>Bump <code>@​actions/exec</code> from 1.1.0 to 1.1.1 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/129">#129</a>)</li>
<li>Bump minimist from 1.2.5 to 1.2.6 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/132">#132</a>)</li>
<li>Bump codecov/codecov-action from 2 to 3 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/133">#133</a>)</li>
<li>Bump semver from 7.3.5 to 7.3.7 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/136">#136</a>)</li>
</ul>
<h2>v1.6.0</h2>
<ul>
<li>Add <code>config-inline</code> input (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/106">#106</a>)</li>
<li>Bump <code>@​actions/core</code> from 1.4.0 to 1.5.0 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/104">#104</a>)</li>
<li>Bump codecov/codecov-action from 1 to 2 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/101">#101</a>)</li>
</ul>
<h2>v1.5.1</h2>
<ul>
<li>Explicit version spec for caching (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/100">#100</a>)</li>
</ul>
<h2>v1.5.0</h2>
<ul>
<li>Allow building buildx from source (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/99">#99</a>)</li>
</ul>
<h2>v1.4.1</h2>
<ul>
<li>Fix <code>docker: invalid reference format</code> (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/97">#97</a>)</li>
</ul>
<h2>v1.4.0</h2>
<ul>
<li>Update dev deps (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/95">#95</a>)</li>
<li>Use built-in <code>getExecOutput</code> (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/94">#94</a>)</li>
<li>Use <code>core.getBooleanInput</code> (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/93">#93</a>)</li>
<li>Bump <code>@​actions/exec</code> from 1.0.4 to 1.1.0 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/85">#85</a>)</li>
<li>Bump y18n from 4.0.0 to 4.0.3 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/91">#91</a>)</li>
<li>Bump hosted-git-info from 2.8.8 to 2.8.9 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/89">#89</a>)</li>
<li>Bump ws from 7.3.1 to 7.5.0 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/90">#90</a>)</li>
<li>Bump <code>@​actions/tool-cache</code> from 1.6.1 to 1.7.1 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/82">#82</a> <a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/86">#86</a>)</li>
<li>Bump <code>@​actions/core</code> from 1.2.7 to 1.4.0 (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/80">#80</a> <a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/87">#87</a>)</li>
</ul>
<h2>v1.3.0</h2>
<ul>
<li>Display BuildKit version (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/72">#72</a>)</li>
</ul>
<h2>v1.2.0</h2>
<ul>
<li>Remove os limitation (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/71">#71</a>)</li>
<li>Add test job for <code>config</code> input (<a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/68">#68</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dc7b971</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/131">#131</a> from crazy-max/node16</li>
<li><a href=""><code>f55bc08</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/setup-buildx-action/issues/141">#141</a> from crazy-max/fix-test</li>
<li><a href=""><code>aa877a9</code></a> ci: fix standalone test</li>
<li><a href=""><code>130c56f</code></a> Node 16 as default runtime</li>
<li>See full diff in <a href="https://github.com/docker/setup-buildx-action/compare/v1...v2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/setup-buildx-action&package-manager=github_actions&previous-version=1&new-version=2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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