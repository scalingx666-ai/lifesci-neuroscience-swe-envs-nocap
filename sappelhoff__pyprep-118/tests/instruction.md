# Issue

**Title:** Bump actions/cache from 2 to 3

## Description

Bumps [actions/cache](https://github.com/actions/cache) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/cache/releases">actions/cache's releases</a>.</em></p>
<blockquote>
<h2>v3.0.0</h2>
<ul>
<li>
<p>This change adds a minimum runner version(node12 -&gt; node16), which can break users using an out-of-date/fork of the runner. This would be most commonly affecting users on GHES 3.3 or before, as those runners do not support node16 actions and they can use actions from github.com via <a href="https://docs.github.com/en/enterprise-server@3.0/admin/github-actions/managing-access-to-actions-from-githubcom/enabling-automatic-access-to-githubcom-actions-using-github-connect">github connect</a> or manually copying the repo to their GHES instance.</p>
</li>
<li>
<p>Few dependencies and cache action usage examples have also been updated.</p>
</li>
</ul>
<h2>v2.1.7</h2>
<p>Support 10GB cache upload using the latest version <code>1.0.8</code> of <a href="https://www.npmjs.com/package/@actions/cache"><code>@actions/cache</code> </a></p>
<h2>v2.1.6</h2>
<ul>
<li>Catch unhandled &quot;bad file descriptor&quot; errors that sometimes occurs when the cache server returns non-successful response (<a href="https://github-redirect.dependabot.com/actions/cache/pull/596">actions/cache#596</a>)</li>
</ul>
<h2>v2.1.5</h2>
<ul>
<li>Fix permissions error seen when extracting caches with GNU tar that were previously created using BSD tar (<a href="https://github-redirect.dependabot.com/actions/cache/issues/527">actions/cache#527</a>)</li>
</ul>
<h2>v2.1.4</h2>
<ul>
<li>Make caching more verbose <a href="https://github-redirect.dependabot.com/actions/toolkit/pull/650">#650</a></li>
<li>Use GNU tar on macOS if available <a href="https://github-redirect.dependabot.com/actions/toolkit/pull/701">#701</a></li>
</ul>
<h2>v2.1.3</h2>
<ul>
<li>Upgrades <code>@actions/core</code> to v1.2.6 for <a href="https://github.com/advisories/GHSA-mfwh-5m23-j46w">CVE-2020-15228</a>. This action was not using the affected methods.</li>
<li>Fix error handling in <code>uploadChunk</code> where 400-level errors were not being detected and handled correctly</li>
</ul>
<h2>v2.1.2</h2>
<ul>
<li>Adds input to limit the chunk upload size, useful for self-hosted runners with slower upload speeds</li>
<li>No-op when executing on GHES</li>
</ul>
<h2>v2.1.1</h2>
<ul>
<li>Update <code>@actions/cache</code> package to <code>v1.0.2</code> which allows cache action to use posix format when taring files.</li>
</ul>
<h2>v2.1.0</h2>
<ul>
<li>Replaces the <code>http-client</code> with the Azure Storage SDK for NodeJS when downloading cache content from Azure.  This should help improve download performance and reliability as the SDK downloads files in 4 MB chunks, which can be parallelized and retried independently</li>
<li>Display download progress and speed</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/cache/blob/main/RELEASES.md">actions/cache's changelog</a>.</em></p>
<blockquote>
<h1>Releases</h1>
<h3>3.0.0</h3>
<ul>
<li>Updated minimum runner version support from node 12 -&gt; node 16</li>
</ul>
<h3>3.0.1</h3>
<ul>
<li>Added support for caching from GHES 3.5.</li>
<li>Fixed download issue for files &gt; 2GB during restore.</li>
</ul>
<h3>3.0.2</h3>
<ul>
<li>Added support for dynamic cache size cap on GHES.</li>
</ul>
<h3>3.0.3</h3>
<ul>
<li>Fixed avoiding empty cache save when no files are available for caching. (<a href="https://github-redirect.dependabot.com/actions/cache/issues/624">issue</a>)</li>
</ul>
<h3>3.0.4</h3>
<ul>
<li>Fixed tar creation error while trying to create tar with path as <code>~/</code> home folder on <code>ubuntu-latest</code>. (<a href="https://github-redirect.dependabot.com/actions/cache/issues/689">issue</a>)</li>
</ul>
<h3>3.0.5</h3>
<ul>
<li>Removed error handling by consuming actions/cache 3.0 toolkit, Now cache server error handling will be done by toolkit. (<a href="https://github-redirect.dependabot.com/actions/cache/pull/834">PR</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0865c47</code></a> new release (<a href="https://github-redirect.dependabot.com/actions/cache/issues/855">#855</a>)</li>
<li><a href=""><code>354a2ae</code></a> Consuming 3.0 actions/cache (<a href="https://github-redirect.dependabot.com/actions/cache/issues/834">#834</a>)</li>
<li><a href=""><code>baed351</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/actions/cache/issues/530">#530</a> from axelson/document-where-to-cache</li>
<li><a href=""><code>8829e97</code></a> Update README.md</li>
<li><a href=""><code>eec8cd3</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/actions/cache/issues/836">#836</a> from actions/vsvipul/fix-auto-assign</li>
<li><a href=""><code>5cc84c0</code></a> Add kotewar and remove phantsure from auto-assignees lists</li>
<li><a href=""><code>afc669e</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/actions/cache/issues/819">#819</a> from mpilgrem/haskell-stack-example</li>
<li><a href=""><code>a0efc56</code></a> Use pull_request_target instead of pull_request</li>
<li><a href=""><code>d25c51b</code></a> Adapt existing Haskell Stack example for Windows</li>
<li><a href=""><code>a080a3b</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/actions/cache/issues/816">#816</a> from lobis/main</li>
<li>Additional commits viewable in <a href="https://github.com/actions/cache/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/cache&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b82d498379bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.