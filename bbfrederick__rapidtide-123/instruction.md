# Issue

**Title:** Bump docker/metadata-action from 4 to 5

## Description

Bumps [docker/metadata-action](https://github.com/docker/metadata-action) from 4 to 5.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/metadata-action/releases">docker/metadata-action's releases</a>.</em></p>
<blockquote>
<h2>v5.0.0</h2>
<ul>
<li>Node 20 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.308.0">Actions Runner v2.308.0</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/metadata-action#328</a></li>
<li>Bump <code>@​actions/core</code> from 1.10.0 to 1.10.1 in <a href="">docker/metadata-action#333</a></li>
<li>Bump csv-parse from 5.4.0 to 5.5.0 in <a href="">docker/metadata-action#320</a></li>
<li>Bump semver from 7.5.1 to 7.5.2 in <a href="">docker/metadata-action#304</a></li>
<li>Bump handlebars from 4.7.7 to 4.7.8 in <a href="">docker/metadata-action#315</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v4.6.0...v5.0.0">https://github.com/docker/metadata-action/compare/v4.6.0...v5.0.0</a></p>
<h2>v4.6.0</h2>
<ul>
<li>Dedup and sort labels by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/metadata-action#301</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.3.0 to 0.5.0 in <a href="">docker/metadata-action#302</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v4.5.0...v4.6.0">https://github.com/docker/metadata-action/compare/v4.5.0...v4.6.0</a></p>
<h2>v4.5.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.1.0 to 0.3.0 in <a href="">docker/metadata-action#296</a></li>
<li>Bump csv-parse from 5.3.8 to 5.4.0 in <a href="">docker/metadata-action#294</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v4.4.0...v4.5.0">https://github.com/docker/metadata-action/compare/v4.4.0...v4.5.0</a></p>
<h2>v4.4.0</h2>
<ul>
<li>Add <code>context</code> input to define the metadata provider by <a href="https://github.com/neilime"><code>@​neilime</code></a> in <a href="">docker/metadata-action#248</a></li>
<li>Switch to actions-toolkit implementation by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/metadata-action#266</a> <a href="">docker/metadata-action#273</a> <a href="">docker/metadata-action#284</a></li>
<li>Bump csv-parse from 5.3.3 to 5.3.8 in <a href="">docker/metadata-action#271</a> <a href="">docker/metadata-action#286</a></li>
<li>Bump moment-timezone from 0.5.40 to 0.5.43 in <a href="">docker/metadata-action#268</a> <a href="">docker/metadata-action#278</a> <a href="">docker/metadata-action#281</a></li>
<li>Bump semver from 7.4.0 to 7.5.0 in <a href="">docker/metadata-action#285</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v4.3.0...v4.4.0">https://github.com/docker/metadata-action/compare/v4.3.0...v4.4.0</a></p>
<h2>v4.3.0</h2>
<ul>
<li>Provide outputs as env vars by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="">#257</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v4.2.0...v4.3.0">https://github.com/docker/metadata-action/compare/v4.2.0...v4.3.0</a></p>
<h2>v4.2.0</h2>
<ul>
<li>Add <code>tz</code> attribute to handlebar date function by <a href="https://github.com/chroju"><code>@​chroju</code></a> (<a href="">#251</a>)</li>
<li>Bump minimatch from 3.0.4 to 3.1.2 (<a href="">#242</a>)</li>
<li>Bump csv-parse from 5.3.1 to 5.3.3 (<a href="">#245</a>)</li>
<li>Bump json5 from 2.2.0 to 2.2.3 (<a href="">#252</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v4.1.1...v4.2.0">https://github.com/docker/metadata-action/compare/v4.1.1...v4.2.0</a></p>
<h2>v4.1.1</h2>
<ul>
<li>Revert changes to set associated head sha on pull request event by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="">#239</a>)
<ul>
<li>User can still set associated head sha on PR by setting the env var <code>DOCKER_METADATA_PR_HEAD_SHA=true</code></li>
</ul>
</li>
<li>Bump csv-parse from 5.3.0 to 5.3.1 (<a href="">#237</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v4.1.0...v4.1.1">https://github.com/docker/metadata-action/compare/v4.1.0...v4.1.1</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Upgrade guide</summary>
<p><em>Sourced from <a href="https://github.com/docker/metadata-action/blob/master/UPGRADE.md">docker/metadata-action's upgrade guide</a>.</em></p>
<blockquote>
<h1>Upgrade notes</h1>
<h2>v2 to v3</h2>
<ul>
<li>Repository has been moved to docker org. Replace <code>crazy-max/ghaction-docker-meta@v2</code>
with <code>docker/metadata-action@v5</code></li>
<li>The default bake target has been changed: <code>ghaction-docker-meta</code> &gt; <code>docker-metadata-action</code></li>
</ul>
<h2>v1 to v2</h2>
<ul>
<li><a href="https://github.com/docker/metadata-action/blob/master/#inputs">inputs</a>
<ul>
<li><a href="https://github.com/docker/metadata-action/blob/master/#tag-sha"><code>tag-sha</code></a></li>
<li><a href="https://github.com/docker/metadata-action/blob/master/#tag-edge--tag-edge-branch"><code>tag-edge</code> / <code>tag-edge-branch</code></a></li>
<li><a href="https://github.com/docker/metadata-action/blob/master/#tag-semver"><code>tag-semver</code></a></li>
<li><a href="https://github.com/docker/metadata-action/blob/master/#tag-match--tag-match-group"><code>tag-match</code> / <code>tag-match-group</code></a></li>
<li><a href="https://github.com/docker/metadata-action/blob/master/#tag-latest"><code>tag-latest</code></a></li>
<li><a href="https://github.com/docker/metadata-action/blob/master/#tag-schedule"><code>tag-schedule</code></a></li>
<li><a href="https://github.com/docker/metadata-action/blob/master/#tag-custom--tag-custom-only"><code>tag-custom</code> / <code>tag-custom-only</code></a></li>
<li><a href="https://github.com/docker/metadata-action/blob/master/#label-custom"><code>label-custom</code></a></li>
</ul>
</li>
<li><a href="https://github.com/docker/metadata-action/blob/master/#basic-workflow">Basic workflow</a></li>
<li><a href="https://github.com/docker/metadata-action/blob/master/#semver-workflow">Semver workflow</a></li>
</ul>
<h3>inputs</h3>
<table>
<thead>
<tr>
<th>New</th>
<th>Unchanged</th>
<th>Removed</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>tags</code></td>
<td><code>images</code></td>
<td><code>tag-sha</code></td>
</tr>
<tr>
<td><code>flavor</code></td>
<td><code>sep-tags</code></td>
<td><code>tag-edge</code></td>
</tr>
<tr>
<td><code>labels</code></td>
<td><code>sep-labels</code></td>
<td><code>tag-edge-branch</code></td>
</tr>
<tr>
<td></td>
<td></td>
<td><code>tag-semver</code></td>
</tr>
<tr>
<td></td>
<td></td>
<td><code>tag-match</code></td>
</tr>
<tr>
<td></td>
<td></td>
<td><code>tag-match-group</code></td>
</tr>
<tr>
<td></td>
<td></td>
<td><code>tag-latest</code></td>
</tr>
<tr>
<td></td>
<td></td>
<td><code>tag-schedule</code></td>
</tr>
<tr>
<td></td>
<td></td>
<td><code>tag-custom</code></td>
</tr>
<tr>
<td></td>
<td></td>
<td><code>tag-custom-only</code></td>
</tr>
<tr>
<td></td>
<td></td>
<td><code>label-custom</code></td>
</tr>
</tbody>
</table>
<h4><code>tag-sha</code></h4>
<pre lang="yaml"><code>tags: |
  type=sha
</code></pre>
<h4><code>tag-edge</code> / <code>tag-edge-branch</code></h4>
<pre lang="yaml"><code>tags: |
  # default branch
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>96383f4</code></a> Merge pull request <a href="">#320</a> from docker/dependabot/npm_and_yarn/csv-parse-5.5.0</li>
<li><a href=""><code>f138b96</code></a> chore: update generated content</li>
<li><a href=""><code>9cf7015</code></a> Bump csv-parse from 5.4.0 to 5.5.0</li>
<li><a href=""><code>5a8a5ff</code></a> Merge pull request <a href="">#315</a> from docker/dependabot/npm_and_yarn/handlebars-4.7.8</li>
<li><a href=""><code>2279d9a</code></a> chore: update generated content</li>
<li><a href=""><code>c659933</code></a> Bump handlebars from 4.7.7 to 4.7.8</li>
<li><a href=""><code>48d23cc</code></a> Merge pull request <a href="">#333</a> from docker/dependabot/npm_and_yarn/actions/core-1.10.1</li>
<li><a href=""><code>b83ffb4</code></a> chore: update generated content</li>
<li><a href=""><code>3207f24</code></a> Bump <code>@​actions/core</code> from 1.10.0 to 1.10.1</li>
<li><a href=""><code>63f4a26</code></a> Merge pull request <a href="">#328</a> from crazy-max/update-node20</li>
<li>Additional commits viewable in <a href="https://github.com/docker/metadata-action/compare/v4...v5">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/metadata-action&package-manager=github_actions&previous-version=4&new-version=5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a35b4e56fcb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.