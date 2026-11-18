# Issue

**Title:** chore(deps-dev): Bump vitest from 3.2.6 to 4.1.11

## Description

Bumps [vitest](https://github.com/vitest-dev/vitest/tree/HEAD/packages/vitest) from 3.2.6 to 4.1.11.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/vitest-dev/vitest/releases">vitest's releases</a>.</em></p>
<blockquote>
<h2>v4.1.11</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li>Revive global concurrency limit for test lifecycle [backport to v4]  -  by <a href="https://github.com/sheremet-va"><code>@​sheremet-va</code></a> and <a href="https://github.com/hi-ogawa"><code>@​hi-ogawa</code></a> in <a href="">vitest-dev/vitest#10992</a> <a href=""><!-- raw HTML omitted -->(5146d)<!-- raw HTML omitted --></a></li>
<li><strong>browser</strong>:
<ul>
<li>Encode iframeId in tester iframe URL [backport to v4]  -  by <a href="https://github.com/sheremet-va"><code>@​sheremet-va</code></a>, <strong>Pduhard</strong> and <strong>Claude Opus 4.8</strong> in <a href="">vitest-dev/vitest#10955</a> <a href=""><!-- raw HTML omitted -->(10b2c)<!-- raw HTML omitted --></a></li>
<li>Trigger playwright/chromium gc on lower disk availability [backport to v4]  -  by <a href="https://github.com/hi-ogawa"><code>@​hi-ogawa</code></a>, <strong>Hiroshi Ogawa</strong> and <strong>OpenCode</strong> in <a href="">vitest-dev/vitest#10951</a> <a href=""><!-- raw HTML omitted -->(9851d)<!-- raw HTML omitted --></a></li>
</ul>
</li>
<li><strong>mocker</strong>:
<ul>
<li>Restrict redirect mocks to the fs allowlist [backport to v4]  -  by <a href="https://github.com/sheremet-va"><code>@​sheremet-va</code></a> in <a href="">vitest-dev/vitest#10974</a> <a href=""><!-- raw HTML omitted -->(fe5a1)<!-- raw HTML omitted --></a></li>
</ul>
</li>
</ul>
<h5>    <a href="https://github.com/vitest-dev/vitest/compare/v4.1.10...v4.1.11">View changes on GitHub</a></h5>
<h2>v4.1.10</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li><strong>browser</strong>: Check fs access in builtin commands [backport to v4]  -  by <a href="https://github.com/hi-ogawa"><code>@​hi-ogawa</code></a>, <strong>Hiroshi Ogawa</strong> and <strong>OpenCode (claude-opus-4-8)</strong> in <a href="">vitest-dev/vitest#10680</a> <a href=""><!-- raw HTML omitted -->(5c18d)<!-- raw HTML omitted --></a></li>
<li><strong>vm</strong>: Fix external module resolve error with deps optimizer query for encoded URI [backport to v4]  -  by <a href="https://github.com/SveLil"><code>@​SveLil</code></a> and <a href="https://github.com/hi-ogawa"><code>@​hi-ogawa</code></a> in <a href="">vitest-dev/vitest#10661</a> <a href=""><!-- raw HTML omitted -->(bae52)<!-- raw HTML omitted --></a></li>
</ul>
<h5>    <a href="https://github.com/vitest-dev/vitest/compare/v4.1.9...v4.1.10">View changes on GitHub</a></h5>
<h2>v4.1.9</h2>
<h3>🐞 Bug Fixes</h3>
<ul>
<li>Fix <code>importOriginal</code> with optimizer and query import [backport to v4] - by <strong>Hiroshi Ogawa</strong>, <strong>David Harris</strong>, <strong>Codex</strong>and <strong>Vladimir</strong> in <a href="">vitest-dev/vitest#10546</a> <a href=""><!-- raw HTML omitted -->(a5180)<!-- raw HTML omitted --></a></li>
<li><strong>browser</strong>:
<ul>
<li>Wait for orchestrator readiness before resolving browser sessions [backport to v4] - by <strong>Vladimir</strong> and <strong>Séamus O'Connor</strong> in <a href="">vitest-dev/vitest#10555</a> <a href=""><!-- raw HTML omitted -->(7fb29)<!-- raw HTML omitted --></a></li>
<li>Wait for iframe tester readiness before preparing  [backport to v4] - by <strong>Vladimir</strong> and <strong>Séamus O'Connor</strong> in <a href="">vitest-dev/vitest#10497</a> and <a href="">vitest-dev/vitest#10556</a> <a href=""><!-- raw HTML omitted -->(fbc62)<!-- raw HTML omitted --></a></li>
</ul>
</li>
<li><strong>mocker</strong>:
<ul>
<li>Hoist vi.mock() for vite-plus/test imports [backport to v4] - by <strong>Hiroshi Ogawa</strong>, <strong>LongYinan</strong>, <strong>Claude Opus 4.8</strong> and <strong>Vladimir</strong> in <a href="">vitest-dev/vitest#10548</a> <a href=""><!-- raw HTML omitted -->(2c955)<!-- raw HTML omitted --></a></li>
</ul>
</li>
<li><strong>pool</strong>:
<ul>
<li>Prevent test run hang on worker crash  [backport to v4] - by <strong>Ari Perkkiö</strong> and <strong>Jattioui Ismail</strong> in <a href="">vitest-dev/vitest#10543</a> and <a href="">vitest-dev/vitest#10564</a> <a href=""><!-- raw HTML omitted -->(934b0)<!-- raw HTML omitted --></a></li>
</ul>
</li>
</ul>
<h5><a href="https://github.com/vitest-dev/vitest/compare/v4.1.8...v4.1.9">View changes on GitHub</a></h5>
<h2>v4.1.8</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li><strong>browser</strong>:
<ul>
<li>Disable client <code>cdp</code> API when <code>allowWrite/allowExec: false</code> [backport to v4]  -  by <a href="https://github.com/hi-ogawa"><code>@​hi-ogawa</code></a> and <strong>Codex</strong> in <a href="">vitest-dev/vitest#10450</a> <a href=""><!-- raw HTML omitted -->(e4067)<!-- raw HTML omitted --></a></li>
<li>Remove orphaned Playwright route when same module is mocked via multiple ids [backport to v4]  -  by <a href="https://github.com/toxik"><code>@​toxik</code></a> and <a href="https://github.com/Zelys-DFKH"><code>@​Zelys-DFKH</code></a> in <a href="">vitest-dev/vitest#10474</a> <a href=""><!-- raw HTML omitted -->(675b4)<!-- raw HTML omitted --></a></li>
</ul>
</li>
</ul>
<h5>    <a href="https://github.com/vitest-dev/vitest/compare/v4.1.7...v4.1.8">View changes on GitHub</a></h5>
<h2>v4.1.7</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li><strong>runner</strong>: Limit concurrency per task branch in addition to per leaf callbacks (backport)  -  by <a href="https://github.com/hi-ogawa"><code>@​hi-ogawa</code></a> in <a href="">vitest-dev/vitest#10384</a> <a href=""><!-- raw HTML omitted -->(4f0f2)<!-- raw HTML omitted --></a></li>
</ul>
<h5>    <a href="https://github.com/vitest-dev/vitest/compare/v4.1.6...v4.1.7">View changes on GitHub</a></h5>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9bd8d46</code></a> chore: release v4.1.11 (<a href="">#10995</a>)</li>
<li><a href=""><code>9851dbc</code></a> fix(browser): trigger playwright/chromium gc on lower disk availability [back...</li>
<li><a href=""><code>db616d2</code></a> chore: release v4.1.10 (<a href="">#10718</a>)</li>
<li><a href=""><code>bae52b5</code></a> fix(vm): fix external module resolve error with deps optimizer query for enco...</li>
<li><a href=""><code>a7a61e7</code></a> chore: release v4.1.9 (<a href="">#10598</a>)</li>
<li><a href=""><code>934b0f5</code></a> fix(pool): prevent test run hang on worker crash (<a href="">#10543</a>) [backport to v4] (#...</li>
<li><a href=""><code>7fb2965</code></a> fix(browser): wait for orchestrator readiness before resolving browser sessio...</li>
<li><a href=""><code>a518019</code></a> fix: fix <code>importOriginal</code> with optimizer and query import [backport to v4] (#...</li>
<li><a href=""><code>e61f2dd</code></a> chore: release v4.1.8</li>
<li><a href=""><code>e4067b3</code></a> fix(browser): disable client <code>cdp</code> API when <code>allowWrite/allowExec: false</code> [ba...</li>
<li>Additional commits viewable in <a href="https://github.com/vitest-dev/vitest/commits/v4.1.11/packages/vitest">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63dbad92d217`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.