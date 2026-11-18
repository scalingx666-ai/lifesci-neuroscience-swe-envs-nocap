# Issue

**Title:** chore(deps): bump hono from 4.12.26 to 4.12.32

## Description

Bumps [hono](https://github.com/honojs/hono) from 4.12.26 to 4.12.32.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/honojs/hono/releases">hono's releases</a>.</em></p>
<blockquote>
<h2>v4.12.32</h2>
<h2>What's Changed</h2>
<ul>
<li>ci: enable reports for type &amp; bundle size check in <a href="">honojs/hono#5148</a></li>
<li>fix(aws-lambda): add jwt and lambda authorizer types for API Gateway v2 in <a href="">honojs/hono#5142</a></li>
<li>fix(sse): emit empty id field to reset Last-Event-ID in <a href="">honojs/hono#5138</a></li>
<li>test(cloudflare-workers): add coverage for onClose, onError, send, and close in Cloudflare Workers websocket adapter in <a href="">honojs/hono#5145</a></li>
<li>fix: use <code>Object.create(null)</code> when parsing query, headers, and params in <a href="">honojs/hono#5161</a></li>
<li>fix(secure-headers): keep CSP callbacks scoped to their header in <a href="">honojs/hono#5147</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/hono/compare/v4.12.31...v4.12.32">https://github.com/honojs/hono/compare/v4.12.31...v4.12.32</a></p>
<h2>v4.12.31</h2>
<h2>What's Changed</h2>
<ul>
<li>test(context): assert case-insensitive header names in response helpers by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5116</a></li>
<li>chore(benchmark): add app.fetch() overhead benchmark by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5117</a></li>
<li>refactor(aws-lambada): remove FIXME in <code>@ts-expect-error</code> by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5130</a></li>
<li>fix(utils/body): reuse cached formData in <code>parseBody()</code> by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5131</a></li>
<li>fix(request): fix multipart boundary mismatch in <code>cloneRawRequest</code> by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5133</a></li>
<li>fix(sse): emit retry feild when retry is <code>0</code> by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5135</a></li>
<li>test(validator): fix misspelled identifier in transform type test by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5136</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/hono/compare/v4.12.30...v4.12.31">https://github.com/honojs/hono/compare/v4.12.30...v4.12.31</a></p>
<h2>v4.12.30</h2>
<h2>What's Changed</h2>
<ul>
<li>chore(benchmark/routers): bump deps in <a href="">honojs/hono#5107</a></li>
<li>chore(benchmark): remove not used benchmarks in <a href="">honojs/hono#5108</a></li>
<li>chore: update to ts6 in prep for ts7 in <a href="">honojs/hono#5104</a></li>
<li>fix(cache): deduplicate Cache-Control directives case-insensitively in <a href="">honojs/hono#5025</a></li>
<li>fix(compress): do not compress 206 Partial Content responses in <a href="">honojs/hono#5020</a></li>
<li>fix(client): replaceUrlParam should not match a param that prefixes another in <a href="">honojs/hono#5096</a></li>
<li>fix(method-override): set duplex when forwarding a stream body in query mode in <a href="">honojs/hono#5110</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/hono/compare/v4.12.29...v4.12.30">https://github.com/honojs/hono/compare/v4.12.29...v4.12.30</a></p>
<h2>v4.12.29</h2>
<h2>What's Changed</h2>
<ul>
<li>fix(client): merge function headers with per-request headers by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5092</a></li>
<li>chore: fix no-op tsc in test script by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5093</a></li>
<li>fix(lambda-edge): resolve the handler with the value passed to the callback by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5094</a></li>
<li>docs(language): add JSDoc <a href="https://github.com/example"><code>@​example</code></a> to languageDetector by <a href="https://github.com/codebybilal18"><code>@​codebybilal18</code></a> in <a href="">honojs/hono#5081</a></li>
<li>test(workerd): add <code>compatibilityDate</code> by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5100</a></li>
<li>fix(lambda-edge): base64 encode content-encoded response bodies by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5099</a></li>
<li>fix(aws-lambda): treat any non-identity content-encoding as binary by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5101</a></li>
<li>fix(types): strip extra properties from array types in JSONParsed by <a href="https://github.com/Arman-Luthra"><code>@​Arman-Luthra</code></a> in <a href="">honojs/hono#5103</a></li>
<li>fix(trie-router): match empty wildcard remainder after regexp param by <a href="https://github.com/usualoma"><code>@​usualoma</code></a> in <a href="">honojs/hono#5102</a></li>
<li>fix(etag): treat If-None-Match: <code>*</code> as a match by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/hono#5084</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/codebybilal18"><code>@​codebybilal18</code></a> made their first contribution in <a href="">honojs/hono#5081</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>26d8e42</code></a> 4.12.32</li>
<li><a href=""><code>402eb3a</code></a> fix(secure-headers): keep CSP callbacks scoped to their header (<a href="">#5147</a>)</li>
<li><a href=""><code>c85aead</code></a> fix: use <code>Object.create(null)</code> when parsing query, headers, and params (<a href="">#5161</a>)</li>
<li><a href=""><code>a88c89d</code></a> test(cloudflare-workers): add coverage for onClose, onError, send, and close ...</li>
<li><a href=""><code>44f8843</code></a> fix(sse): emit empty id field to reset Last-Event-ID (<a href="">#5138</a>)</li>
<li><a href=""><code>e36f57d</code></a> fix(aws-lambda): add jwt and lambda authorizer types for API Gateway v2 (<a href="">#5142</a>)</li>
<li><a href=""><code>bf8608c</code></a> ci: enable reports for type &amp; bundle size check (<a href="">#5148</a>)</li>
<li><a href=""><code>cadff88</code></a> 4.12.31</li>
<li><a href=""><code>64c613a</code></a> test(validator): fix misspelled identifier in transform type test (<a href="">#5136</a>)</li>
<li><a href=""><code>aeba9ec</code></a> fix(sse): emit retry feild when retry is <code>0</code> (<a href="">#5135</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/honojs/hono/compare/v4.12.26...v4.12.32">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=hono&package-manager=npm_and_yarn&previous-version=4.12.26&new-version=4.12.32)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `630dd2de960d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.