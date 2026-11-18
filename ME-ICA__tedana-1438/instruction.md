# Issue

**Title:** Bump requests from 2.34.0 to 2.34.2

## Description

Bumps [requests](https://github.com/psf/requests) from 2.34.0 to 2.34.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/releases">requests's releases</a>.</em></p>
<blockquote>
<h2>v2.34.2</h2>
<h2>2.34.2 (2026-05-14)</h2>
<ul>
<li>Moved <code>headers</code> input type back to <code>Mapping</code> to avoid invariance issues with <code>MutableMapping</code> and inferred dict types. Users calling <code>Request.headers.update()</code> may need to narrow typing in their code. (<a href="">#7441</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/psf/requests/blob/main/HISTORY.md#2342-2026-05-14">https://github.com/psf/requests/blob/main/HISTORY.md#2342-2026-05-14</a></p>
<h2>v2.34.1</h2>
<h2>2.34.1 (2026-05-13)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Widened <code>json</code> input type from <code>dict</code> and <code>list</code> to <code>Mapping</code>
and <code>Sequence</code>. (<a href="">#7436</a>)</li>
<li>Changed <code>headers</code> input type to MutableMapping and removed <code>None</code> from
<code>Request.headers</code> typing to improve handling for users. (<a href="">#7431</a>)</li>
<li><code>Response.reason</code> moved from <code>str | None</code> to <code>str</code> to improve handling
for users. (<a href="">#7437</a>)</li>
<li>Fixed a bug where some bodies with custom <code>__getattr__</code> implementations
weren't being properly detected as Iterables. (<a href="">#7433</a>)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/k223kim"><code>@​k223kim</code></a> made their first contribution in <a href="">psf/requests#7433</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/psf/requests/blob/main/HISTORY.md#2341-2026-05-13">https://github.com/psf/requests/blob/main/HISTORY.md#2341-2026-05-13</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/blob/main/HISTORY.md">requests's changelog</a>.</em></p>
<blockquote>
<h2>2.34.2 (2026-05-14)</h2>
<ul>
<li>Moved <code>headers</code> input type back to <code>Mapping</code> to avoid invariance issues
with <code>MutableMapping</code> and inferred dict types. Users calling
<code>Request.headers.update()</code> may need to narrow typing in their code. (<a href="">#7441</a>)</li>
</ul>
<h2>2.34.1 (2026-05-13)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Widened <code>json</code> input type from <code>dict</code> and <code>list</code> to <code>Mapping</code>
and <code>Sequence</code>. (<a href="">#7436</a>)</li>
<li>Changed <code>headers</code> input type to MutableMapping and removed <code>None</code> from
<code>Request.headers</code> typing to improve handling for users. (<a href="">#7431</a>)</li>
<li><code>Response.reason</code> moved from <code>str | None</code> to <code>str</code> to improve handling
for users. (<a href="">#7437</a>)</li>
<li>Fixed a bug where some bodies with custom <code>__getattr__</code> implementations
weren't being properly detected as Iterables. (<a href="">#7433</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6e83187</code></a> v2.34.2</li>
<li><a href=""><code>84d10f0</code></a> Move Request.headers back to Mapping (<a href="">#7441</a>)</li>
<li><a href=""><code>b7b549b</code></a> v2.34.1</li>
<li><a href=""><code>e511bc7</code></a> Fix mutability issues with headers input types (<a href="">#7431</a>)</li>
<li><a href=""><code>5691f59</code></a> Update JsonType containers to read-based collections (<a href="">#7436</a>)</li>
<li><a href=""><code>2144213</code></a> Constrain Response.reason to str (<a href="">#7437</a>)</li>
<li><a href=""><code>6404f34</code></a> Fix <code>prepare_body</code> stream detection for <code>__getattr__</code>-based file wrappers (<a href="">#7</a>...</li>
<li>See full diff in <a href="https://github.com/psf/requests/compare/v2.34.0...v2.34.2">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9fb4a88bc16f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.