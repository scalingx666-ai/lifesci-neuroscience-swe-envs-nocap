# Issue

**Title:** chore(deps): bump hono from 4.12.32 to 4.13.0

## Description

Bumps [hono](https://github.com/honojs/hono) from 4.12.32 to 4.13.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/honojs/hono/releases">hono's releases</a>.</em></p>
<blockquote>
<h2>v4.13.0</h2>
<p>Hono v4.13.0 is now available!</p>
<p>The highlight of this release is performance: a batch of low-level optimizations makes the core request/response path significantly faster — up to 1.25x on common routes in our benchmark. This release also adds first-class support for the HTTP QUERY method, defined in <a href="https://www.rfc-editor.org/rfc/rfc10008.html">RFC 10008</a>, a new Method Not Allowed middleware, and more.</p>
<h2>Performance improvements</h2>
<p>This release includes a series of small optimizations: skipping unnecessary <code>Headers</code> allocations, replacing regex tests with <code>indexOf</code>, allocating internal state lazily, and more.</p>
<p>Here is <a href="https://github.com/honojs/hono/tree/main/benchmarks/fetch"><code>benchmarks/fetch</code></a> comparing v4.12 and v4.13 (<code>ROUNDS=5 ./compare.sh</code>, Bun 1.4.0, Apple Silicon — each measurement runs in a fresh process, and the variant order is reversed every round to avoid warm-up bias):</p>
<table>
<thead>
<tr>
<th>Benchmark</th>
<th align="right">v4.12</th>
<th align="right">v4.13</th>
<th align="right">Speedup</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>ping</code> — <code>GET /</code></td>
<td align="right">165.83 ns</td>
<td align="right">163.99 ns</td>
<td align="right">1.01x</td>
</tr>
<tr>
<td><code>query</code> — <code>GET /id/1?name=bun</code></td>
<td align="right">674.40 ns</td>
<td align="right">616.99 ns</td>
<td align="right"><strong>1.09x</strong></td>
</tr>
<tr>
<td><code>json</code> — <code>GET /user</code></td>
<td align="right">528.99 ns</td>
<td align="right">422.44 ns</td>
<td align="right"><strong>1.25x</strong></td>
</tr>
<tr>
<td><code>body</code> — <code>POST /json</code></td>
<td align="right">1.16 µs</td>
<td align="right">1.00 µs</td>
<td align="right"><strong>1.15x</strong></td>
</tr>
</tbody>
</table>
<p>The individual changes:</p>
<ul>
<li>perf(context): iterate the header record with <code>for..in</code> <a href="">honojs/hono#5118</a></li>
<li>perf(url): replace regex tests with <code>indexOf</code> <a href="">honojs/hono#5121</a></li>
<li>perf(context): skip <code>Headers</code> creation when there are no headers to merge <a href="">honojs/hono#5122</a></li>
<li>perf(urls): refactor <code>tryDecodeURIComponent</code> <a href="">honojs/hono#5158</a></li>
<li>perf(request): allocate <code>#validatedData</code> lazily <a href="">honojs/hono#5175</a></li>
<li>perf(request): probe the body cache without allocating <a href="">honojs/hono#5176</a></li>
</ul>
<p>In addition, the RegExpRouter rewrite described below makes route registration plus the first match roughly 20% faster.</p>
<p>Thanks <a href="https://github.com/kibertoad"><code>@​kibertoad</code></a> for the contributions!</p>
<h2>First-class QUERY method support</h2>
<p>The QUERY method — a safe, idempotent method that carries a request body — is now a first-class citizen in Hono. You can define QUERY handlers with <code>app.query()</code>:</p>
<pre lang="ts"><code>const app = new Hono()
<p>app.query('/search', async (c) =&gt; {<br />
const conditions = await c.req.json()<br />
return c.json(await search(conditions))<br />
})<br />
</code></pre></p>
<p>Thanks <a href="https://github.com/shellhaki"><code>@​shellhaki</code></a>!</p>
<h2>QUERY support across built-in middleware</h2>
<p>The built-in middleware has been updated to handle QUERY requests properly:</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>192768f</code></a> 4.13.0</li>
<li><a href=""><code>b0c2d90</code></a> Merge pull request <a href="">#5154</a> from honojs/next</li>
<li><a href=""><code>8f07028</code></a> fix(compress): set Vary: Accept-Encoding on negotiated responses (<a href="">#5137</a>)</li>
<li><a href=""><code>8a0b18f</code></a> feat(reg-exp-router): throw UnsupportedPathError during route registration (#...</li>
<li><a href=""><code>3feb355</code></a> fix(jsx): allow a function component to return an array (<a href="">#5179</a>)</li>
<li><a href=""><code>5d911d2</code></a> feat(utils/headers): add HTTP fields newly registered with IANA (<a href="">#5153</a>)</li>
<li><a href=""><code>30277ae</code></a> feat(jwt,jwk): add a configurable WWW-Authenticate realm (<a href="">#5141</a>)</li>
<li><a href=""><code>1f707c5</code></a> feat(middleware): add method-not-allowed middleware (<a href="">#5132</a>)</li>
<li><a href=""><code>2df0b47</code></a> feat(jsx): add React-compatible overloads to useRef (<a href="">#5063</a>)</li>
<li><a href=""><code>3bc96ba</code></a> feat(cache): add first-class support for QUERY requests (<a href="">#5119</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/honojs/hono/compare/v4.12.32...v4.13.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=hono&package-manager=npm_and_yarn&previous-version=4.12.32&new-version=4.13.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/NeuroAIHub/BrainPilot/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2940e7e0afdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.