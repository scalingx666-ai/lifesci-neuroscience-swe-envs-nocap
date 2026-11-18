# Issue

**Title:** chore(deps): bump next from 16.2.9 to 16.2.11 in /packages/docs

## Description

Bumps [next](https://github.com/vercel/next.js) from 16.2.9 to 16.2.11.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/vercel/next.js/releases">next's releases</a>.</em></p>
<blockquote>
<h2>v16.2.11</h2>
<p>This release contains security fixes for the following advisories:</p>
<p>High:</p>
<ul>
<li><a href="https://github.com/vercel/next.js/security/advisories/GHSA-m99w-x7hq-7vfj">Denial of Service in App Router using Server Actions</a></li>
<li><a href="https://github.com/vercel/next.js/security/advisories/GHSA-6gpp-xcg3-4w24">Middleware / Proxy bypass in App Router applications using Turbopack and single locale</a></li>
<li><a href="https://github.com/vercel/next.js/security/advisories/GHSA-p9j2-gv94-2wf4">Server-Side Request Forgery in rewrites via attacker-controlled destination hostname</a></li>
<li><a href="https://github.com/vercel/next.js/security/advisories/GHSA-89xv-2m56-2m9x">Server-Side Request Forgery in Server Actions on custom servers</a></li>
</ul>
<p>Moderate:</p>
<ul>
<li><a href="https://github.com/vercel/next.js/security/advisories/GHSA-68g3-v927-f742">Cache confusion of response bodies for requests with bodies</a></li>
<li><a href="https://github.com/vercel/next.js/security/advisories/GHSA-4633-3j49-mh5q">Cache confusion of response bodies for requests with bodies containing invalid UTF-8 byte sequences</a></li>
<li><a href="https://github.com/vercel/next.js/security/advisories/GHSA-q8wf-6r8g-63ch">Denial of Service in the Image Optimization API using SVGs</a></li>
<li><a href="https://github.com/vercel/next.js/security/advisories/GHSA-955p-x3mx-jcvp">Unauthenticated disclosure of internal Server Function endpoints</a></li>
<li><a href="https://github.com/vercel/next.js/security/advisories/GHSA-4c39-4ccg-62r3">Unbounded Server Action payload in Edge runtime</a></li>
</ul>
<h2>v16.2.10</h2>
<p>Contains no changes except publishing <code>@next/swc-wasm-web</code> which was accidentally not published since 16.2.4.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9beca08</code></a> v16.2.11</li>
<li><a href=""><code>3c48c7a</code></a> [16.x] Fix Turbopack middleware matcher with i18n single locale</li>
<li><a href=""><code>ac1eff3</code></a> [16.x] Improve performance of checking valid MPA form submissions</li>
<li><a href=""><code>9a4651e</code></a> [16.x] Enforce <code>serverActions.bodySizeLimit</code> for Server Actions in Edge runtime</li>
<li><a href=""><code>b512063</code></a> [16.x] Set correct origin for internal redirects in custom server</li>
<li><a href=""><code>d303326</code></a> [16.x] Ensure exotic rewrite param values are properly encoded</li>
<li><a href=""><code>73b9487</code></a> [16.x] fix(fetch-cache): key fetch(Request, init) by the effective request</li>
<li><a href=""><code>bf9d17f</code></a> [16.x] fix(incremental-cache): byte-exact fetch cache key for binary bodies</li>
<li><a href=""><code>fe28768</code></a> [16.x] fix(next/image): improve performance of detectContentType()</li>
<li><a href=""><code>d8afb8d</code></a> [16.x] Performance improvements when decoding React Server function payloads</li>
<li>Additional commits viewable in <a href="https://github.com/vercel/next.js/compare/v16.2.9...v16.2.11">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdaa5898bdba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.