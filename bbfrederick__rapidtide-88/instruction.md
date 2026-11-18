# Issue

**Title:** Bump docker/build-push-action from 2 to 3

## Description

Bumps [docker/build-push-action](https://github.com/docker/build-push-action) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/build-push-action/releases">docker/build-push-action's releases</a>.</em></p>
<blockquote>
<h2>v3.0.0</h2>
<ul>
<li>Node 16 as default runtime by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/564">#564</a>)
<ul>
<li>This requires a minimum <a href="https://github.com/actions/runner/releases/tag/v2.285.0">Actions Runner</a> version of v2.285.0, which is by default available in GHES 3.4 or later.</li>
</ul>
</li>
<li>Standalone mode support by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/601">#601</a> <a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/609">#609</a>)</li>
<li>chore: update dev dependencies and workflow by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/571">#571</a>)</li>
<li>Bump <code>@​actions/exec</code> from 1.1.0 to 1.1.1 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/573">#573</a>)</li>
<li>Bump <code>@​actions/github</code> from 5.0.0 to 5.0.1 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/582">#582</a>)</li>
<li>Bump minimist from 1.2.5 to 1.2.6 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/584">#584</a>)</li>
<li>Bump semver from 7.3.5 to 7.3.7 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/595">#595</a>)</li>
<li>Bump csv-parse from 4.16.3 to 5.0.4 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/533">#533</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v2.10.0...v3.0.0">https://github.com/docker/build-push-action/compare/v2.10.0...v3.0.0</a></p>
<h2>v2.10.0</h2>
<ul>
<li>Add <code>imageid</code> output and use metadata to set <code>digest</code> output (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/569">#569</a>)</li>
<li>Add <code>build-contexts</code> input (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/563">#563</a>)</li>
<li>Enhance outputs display (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/559">#559</a>)</li>
</ul>
<h2>v2.9.0</h2>
<ul>
<li><code>add-hosts</code> input (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/553">#553</a> <a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/555">#555</a>)</li>
<li>Fix git context subdir example and improve README (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/552">#552</a>)</li>
<li>Add e2e tests for ACR (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/548">#548</a>)</li>
<li>Add description on <code>github-token</code> option to README (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/544">#544</a>)</li>
<li>Bump node-fetch from 2.6.1 to 2.6.7 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/549">#549</a>)</li>
</ul>
<h2>v2.8.0</h2>
<ul>
<li>Allow specifying subdirectory with default git context (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/531">#531</a>)</li>
<li>Add <code>cgroup-parent</code>, <code>shm-size</code>, <code>ulimit</code> inputs (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/501">#501</a>)</li>
<li>Don't set outputs if empty or nil (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/470">#470</a>)</li>
<li>docs: example to sanitize tags with metadata-action (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/476">#476</a>)</li>
<li>docs: wrong syntax to sanitize repo slug (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/475">#475</a>)</li>
<li>docs: test before pushing your image (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/455">#455</a>)</li>
<li>readme: remove v1 section (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/500">#500</a>)</li>
<li>ci: virtual env file system info (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/510">#510</a>)</li>
<li>dev: update workflow (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/499">#499</a>)</li>
<li>Bump <code>@​actions/core</code> from 1.5.0 to 1.6.0 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/160">#160</a>)</li>
<li>Bump ansi-regex from 5.0.0 to 5.0.1 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/469">#469</a>)</li>
<li>Bump tmpl from 1.0.4 to 1.0.5 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/465">#465</a>)</li>
<li>Bump csv-parse from 4.16.0 to 4.16.3 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/451">#451</a> <a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/459">#459</a>)</li>
</ul>
<h2>v2.7.0</h2>
<ul>
<li>Add <code>metadata</code> output (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/412">#412</a>)</li>
<li>Bump <code>@​actions/core</code> from 1.4.0 to 1.5.0 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/439">#439</a>)</li>
<li>Add note to sanitize tags (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/426">#426</a>)</li>
<li>Cache backend API docs (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/406">#406</a>)</li>
<li>Git context now supports subdir (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/407">#407</a>)</li>
<li>Bump codecov/codecov-action from 1 to 2 (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/415">#415</a>)</li>
</ul>
<h2>v2.6.1</h2>
<ul>
<li>Small typo and ensure trimmed output (<a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/400">#400</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c84f382</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/663">#663</a> from crazy-max/fix-git-token-cond</li>
<li><a href=""><code>cd5d0b7</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/661">#661</a> from dud225/subdir_context</li>
<li><a href=""><code>30a3224</code></a> Fix GitHub token not passed with Git context if subdir defined</li>
<li><a href=""><code>1f19633</code></a> Update comment regarding the support of subdir context</li>
<li><a href=""><code>67af6dc</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/657">#657</a> from bendrucker/deprecated-fs-rmdir</li>
<li><a href=""><code>988cb09</code></a> replace deprecated <code>fs.rmdir</code> with <code>fs.rm</code></li>
<li><a href=""><code>1cb9d22</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/653">#653</a> from crazy-max/no-cache-filters</li>
<li><a href=""><code>5ffbca1</code></a> <code>no-cache-filters</code> input</li>
<li><a href=""><code>a8d76c0</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/docker/build-push-action/issues/650">#650</a> from docker/dependabot/npm_and_yarn/csv-parse-5.3.0</li>
<li><a href=""><code>12b1e41</code></a> Update generated content</li>
<li>Additional commits viewable in <a href="https://github.com/docker/build-push-action/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/build-push-action&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65dfffdbfb13`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.